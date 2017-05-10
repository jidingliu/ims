package com.briup.cms.service;

import java.util.List;

import com.briup.cms.bean.Article;
import com.briup.cms.bean.Category;
import com.briup.cms.exception.DaoException;
import com.briup.cms.exception.ServiceException;

/**
 * 有关后台的service层接口
 * @author ljd
 *
 */
public interface IBackService {
	
	//添加栏目
	public void addCategory(Category c) throws ServiceException;
	//展示栏目
	public List<Category> findAllCategory() throws ServiceException;
	//删除栏目
	public void delCategoryById(long id) throws ServiceException;
	//根据id查找栏目
	public Category selectCategoryById(long id) throws ServiceException;
	//根据name查找栏目
	public Category selectCategoryByName(String name) throws ServiceException;
	//根据code查找栏目
	public Category selectCategoryByCode(Integer code) throws ServiceException;
	//更新栏目信息
	public void updateCategory(Category c) throws ServiceException;
	//添加文章
	public void addArticle(Article a,String cid) throws ServiceException;
	//查找所有的文章
	public List<Article> findAllArticle() throws ServiceException;
	//根据id查找文章
	public Article selectArticleById(long id) throws ServiceException;
	//更新文章信息
	public void updateArticle(Article a,String cid) throws ServiceException;
	//根据id删除文章
	public void delArticleById(long id) throws ServiceException;
	//根据条件查找文章列表
	public List<Article> selArticle(String key,String value) throws ServiceException;
	

}
