package com.briup.cms.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.briup.cms.bean.Article;
import com.briup.cms.bean.Category;
import com.briup.cms.exception.ServiceException;
import com.briup.cms.service.IBackService;

/**
 * 后台相关的控制器
 * @author ljd
 *
 */
@Controller
@SessionAttributes(value={"list","category","list1","list2","list3","article1"})
public class BackController {

	@Autowired
	IBackService service;
	//添加栏目
	@RequestMapping("/checkcatall")
	public @ResponseBody Map<String,Object> checkcatall(String name,String code){
			Map<String, Object> map = new HashMap<String, Object>();
			Category c = new Category();
			c.setName(name);
			c.setCode(Integer.parseInt(code));
			try {
			Category selectCategoryByName = service.selectCategoryByName(name);
			Category selectCategoryByCode = service.selectCategoryByCode(Integer.parseInt(code));
			
			if(selectCategoryByCode != null){
					throw new ServiceException("该编码已存在");
			}else if(selectCategoryByName != null){
					throw new ServiceException("该名字已存在");
			}else{
				service.addCategory(c);
				map.put("ms", "添加成功");
			}
			} catch (ServiceException e) {
				map.put("ms", e.getMessage());
				e.printStackTrace();
			}
		return map;
	}
	@RequestMapping("/checkcat")
	public @ResponseBody Map<String,Object> checkcat(String name){
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Category selectCategoryByName = service.selectCategoryByName(name);
			if(selectCategoryByName != null) {
				map.put("msg", "*该栏目已存在");
			}else{
				map.put("msg", "该名字可用");
			}
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return map;
	}
	//展示栏目
	@RequestMapping("/categoryList")
	public String goCategoryList(Model m) {
		try {
			List<Category> list = service.findAllCategory();
			m.addAttribute("list", list);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "manager/categoryList";
	}
	//删除栏目
	@RequestMapping("/deleteCategory.action")
	public String deleteCategory(HttpServletRequest  req) {
		try {
			service.delCategoryById(Long.parseLong(req.getParameter("category.id")));
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "manager/categoryList";
	}
	//转到更新栏目信息
	@RequestMapping("/updateCategory")
	public String goUpdateCategory(HttpServletRequest req,Model model) {
		try {
			Category category = service.selectCategoryById(Long.parseLong(req.getParameter("category.id")));
			model.addAttribute("category", category);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "manager/updateCategory";
	}
	//更新栏目信息
	@RequestMapping("/updateCategory.action")
	public String updateCategory(Category c) {
		try {
			service.updateCategory(c);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "manager/categoryList";
	}
	//跳转到信息发布
	@RequestMapping("/articlePublisur")
	public String goArticlePublisur(Model m) {
		try {
			List<Category> list = service.findAllCategory();
			m.addAttribute("list1", list);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "manager/articlePublisur";
	}
	//发布信息
	@RequestMapping("articlePub")
	public @ResponseBody Map<String,Object> articlePub(String title,String author,String cid,String content){
		Map<String,Object> map = new HashMap<>();
		Article article = new Article();
		article.setTitle(title);
		article.setAuthor(author);
		article.setContent(content);
		try {
		if(title.equals("")){
			throw new ServiceException("标题不能为空");
		}else if(cid.equals("")){
			throw new ServiceException("请选择栏目");
		}else{
			service.addArticle(article, cid);
			map.put("msg", "添加成功");
		}
		} catch (ServiceException e) {
			map.put("msg", e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	//文章列表
	@RequestMapping("/articleList")
	public String goArticleList(Model m) {
		try {
			List<Article> list = service.findAllArticle();
			m.addAttribute("list2", list);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "manager/articleList";
	}
	//跳到文章修改
	@RequestMapping("/updateArticleInfo")
	public String goUpdateArticleInfo(HttpServletRequest req,Model m) {
		try {
		List<Category> list = service.findAllCategory();
		m.addAttribute("list3", list);
		Article article = service.selectArticleById(Long.parseLong(req.getParameter("article.id")));
		m.addAttribute("article1", article);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "manager/updateArticleInfo";
	}
	//修改文章
	@RequestMapping("/updateArticle.action")
	public String updateArticle(Article a,String cid){
		try {
			service.updateArticle(a,cid);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "manager/articleList";
	}
	//删除文章
	@RequestMapping("/deleteArticle.action")
	public String deleteArticle(HttpServletRequest  req) {
		try {
			service.delArticleById(Long.parseLong(req.getParameter("article.id")));
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "manager/articleList";
	}
	
	@RequestMapping("articleListContent.action")
	public String articleListContent(String key,String value,Model m) {
		try {
			List<Article> list = service.selArticle(key, value);
			m.addAttribute("list2", list);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return "manager/articleListContent";
	}
	
	@RequestMapping("/addCategory") 
	public String goAddCategory() {
		return "manager/addCategory";
	}
	
	
	@RequestMapping("/articleListContent")
	public String goArticleListContent() {
		return "manager/articleListContent";
	}
	
	
	
	@RequestMapping("/baseSet")
	public String goBaseSet() {
		return "manager/baseSet";
	}
	
	@RequestMapping("/home")
	public String gohome() {
		return "manager/home";
	}
	
}
