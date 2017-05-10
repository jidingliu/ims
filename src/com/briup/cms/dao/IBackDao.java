package com.briup.cms.dao;

import java.util.List;

import com.briup.cms.bean.Article;
import com.briup.cms.bean.Category;
import com.briup.cms.exception.DaoException;
import com.briup.cms.exception.ServiceException;

/**
 * 后台相关的dao层接口
 * @author ljd
 *
 */
public interface IBackDao {
	//添加栏目
	public void addCategory(Category c)  throws DaoException;
	//展示栏目
	public List<Category> findAllCategory() throws DaoException;
	//删除栏目
	public void delCategoryById(long id) throws DaoException;
	//根据id查找栏目
	public Category selectCategoryById(long id) throws DaoException;
	//根据name查找栏目
	public Category selectCategoryByName(String name) throws DaoException;
	//根据code查找栏目
	public Category selectCategoryByCode(Integer code) throws DaoException;
	//更新栏目信息
	public void updateCategory(Category c) throws DaoException;
	//添加文章
	public void addArticle(Article a) throws DaoException;
	//查找所有的文章
	public List<Article> findAllArticle() throws DaoException;
	//根据id查找文章
	public Article selectArticleById(long id) throws DaoException;
	//更新文章信息
	public void updateArticle(Article a) throws DaoException;
	//根据id删除文章
	public void delArticleById(long id) throws DaoException;
}