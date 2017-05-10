package com.briup.cms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.briup.cms.bean.Article;
import com.briup.cms.bean.Category;
import com.briup.cms.dao.IProDao;
import com.briup.cms.service.IProService;

@Service
public class ProService implements IProService {
	@Autowired
	private IProDao dao;
	//查出所有栏目
	@Override
	public List<Category> proFindAllCategory() {
		List<Category> categorys = dao.proFindAllCategory();
		return categorys;
	}
	//通过栏目id查出所有文章
	public List<Article> findArticleByCid(long id) {
		List<Article> articles = dao.findArticleByCid(id);
		return articles;
	}
	//通过id查找相应栏目
	public Category pselectCategoryById(long id) {
		Category category = dao.pselectCategoryById(id);
		return category;
	}
	//查看文章内容
	@Override
	public Article proSelectArticle(long id) {
		Article article = dao.proSelectArticle(id);
		article.setClickTimes(article.getClickTimes()+1);
		dao.updatecontent(article);
		return article;
	}
	@Override
	public long selectCategoryIDByContentId(long id) {
		long l = dao.selectCategoryIDByContentId(id);
		return l;
	}
}