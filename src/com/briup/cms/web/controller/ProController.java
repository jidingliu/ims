package com.briup.cms.web.controller;

import java.util.List;

import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.briup.cms.bean.Article;
import com.briup.cms.bean.Category;
import com.briup.cms.service.IProService;

/**
 * 前台相关的控制器
 * @author ljd
 *
 */
@Controller
@SessionAttributes(value={"categorys","c","article","article"})
public class ProController {
	@Autowired
	private IProService service;
	@RequestMapping("manager/toHome.action") 
	public ModelAndView goHome(String nickname,String password) {
		ModelAndView mv = new ModelAndView();
		if(nickname.equals("admin") && password.equals("admin")){
			mv.setViewName("redirect:/home");
		}else{
			mv.setViewName("index");
			mv.addObject("msg","登录失败");
		}
		return mv;
	}
	@RequestMapping("/index")
	public String goIndex(Model model) {
		List<Category> categorys = service.proFindAllCategory();
		model.addAttribute("categorys", categorys);
		return "index";
	}
	
	@RequestMapping("/toList.action")
	public String toList(String id,Model model) {
		List<Article> list = service.findArticleByCid(Long.parseLong(id));
		Category category = service.pselectCategoryById(Long.parseLong(id));
		model.addAttribute("c", category);
		model.addAttribute("articles", list);
		return "list";
	}
	
	@RequestMapping("/content.action")
	public String goContent(String id,Model model) {
		Category category = service.pselectCategoryById(Long.parseLong(id));
		model.addAttribute("c", category);
		model.addAttribute("article", service.proSelectArticle(Long.parseLong(id)));
		return "content";
	}
	
}
