package com.briup.cms.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.cms.bean.Article;
import com.briup.cms.bean.Category;
import com.briup.cms.dao.IBackDao;
import com.briup.cms.exception.DaoException;
import com.briup.cms.exception.ServiceException;
import com.briup.cms.service.IBackService;

@Service
public class BackServiceImpl implements IBackService {
	@Autowired
	IBackDao dao;
	private Date d = new Date();
	
	// 添加栏目
	@Override
	public void addCategory(Category c)  throws ServiceException{
			try {
				dao.addCategory(c);
				} catch (DaoException e) {
				e.printStackTrace();
			}
	}

	// 展示栏目
	@Override
	public List<Category> findAllCategory()  throws ServiceException{
		List<Category> list;
		try {
			list = dao.findAllCategory();
			return list;
		} catch (DaoException e) {
			e.printStackTrace();
		}
		return null;
	}

	// 删除栏目
	@Override
	public void delCategoryById(long id)  throws ServiceException{
		try {
			dao.delCategoryById(id);
		} catch (DaoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 根据id查找栏目
	@Override
	public Category selectCategoryById(long id)  throws ServiceException{
		try {
			Category category = dao.selectCategoryById(id);
			return category;
		} catch (DaoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	@Override
	public Category selectCategoryByName(String name) throws ServiceException {
		try {
			Category selectCategoryByName = dao.selectCategoryByName(name);
			return selectCategoryByName;
		} catch (DaoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public Category selectCategoryByCode(Integer code) throws ServiceException {
		try {
			Category selectCategoryByCode = dao.selectCategoryByCode(code);
			return selectCategoryByCode;
		} catch (DaoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	// 更新栏目
	@Override
	public void updateCategory(Category c) throws ServiceException{
		try {
			dao.updateCategory(c);
		} catch (DaoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 添加文章
	@Override
	public void addArticle(Article a, String cid)  throws ServiceException{
		try {
			System.out.println(a);
			Set<Article> set = new HashSet<>();
			Category category = dao.selectCategoryById(Long.parseLong(cid));
			a.setCategory(category);
			a.setPublisurDate(d);
			set.add(a);
			category.setArticles(set);
			dao.addArticle(a);
		} catch (DaoException e) {
			e.printStackTrace();
		}

		
	}

	// 查找所有的文章
	public List<Article> findAllArticle() throws ServiceException {
		try {
			List<Article> allArticle = dao.findAllArticle();
			return allArticle;
		} catch (DaoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	// 根据id查找文章
	@Override
	public Article selectArticleById(long id) throws ServiceException {
		try {
			Article article = dao.selectArticleById(id);
			return article;
		} catch (DaoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	// 更新文章信息
	public void updateArticle(Article a, String cid)  throws ServiceException{

		long ccid = Long.parseLong(cid);
		try {
			Category category = dao.selectCategoryById(ccid);
			a.setCategory(category);
			dao.updateArticle(a);
		} catch (DaoException e) {
			e.printStackTrace();
		}
	}

	// 根据id删除文章
	@Override
	public void delArticleById(long id)  throws ServiceException{
		try {
			dao.delArticleById(id);
		} catch (DaoException e) {
			e.printStackTrace();
		}
	}
	
	//根据条件展示信息
	public List<Article> selArticle(String key,String value)  throws ServiceException{
		try {
		List<Article> articles = new ArrayList<>();
		List<Article> list = dao.findAllArticle();
		if(key.equals("") || value.equals("")) {
			articles = list;
		}
		switch (key) {
		case "title":
			for (Article article : list) {
				if(article.getTitle().contains(value)){
					articles.add(article);
				}
			}
			break;
		case "author":
			for (Article article : list) {
				if(article.getAuthor().contains(value)){
					articles.add(article);
				}	
			}
				
			break;
		case "category":
			for (Article article : list) {
				if(article.getCategory().getName().contains(value)){
					articles.add(article);
				}
			}
			break;
		}
		return articles;
		} catch (DaoException e) {
			e.printStackTrace();
		}
		return null;
	}

	
}