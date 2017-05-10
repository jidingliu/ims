package com.briup.cms.service;

import java.util.List;

import com.briup.cms.bean.Article;
import com.briup.cms.bean.Category;

public interface IProService {
	//查出所有栏目
	public List<Category> proFindAllCategory();
	
	//通过栏目id查出所有文章
	public List<Article> findArticleByCid(long id);
	
	//通过id查找相应栏目
	public Category pselectCategoryById(long id);
	
	//通过文章id查找相应文章内容
	public Article proSelectArticle(long id);
	public long selectCategoryIDByContentId(long id);
}
