package com.briup.cms.dao;

import java.util.List;

import com.briup.cms.bean.Article;
import com.briup.cms.bean.Category;

public interface IProDao {
		//查出所有栏目
		public List<Category> proFindAllCategory();
		//通过栏目id查出所有文章
		public List<Article> findArticleByCid(long id);
		//通过id查找相应栏目
		public Category pselectCategoryById(long id);
		//通过文章id查找相应文章内容
		public Article proSelectArticle(long id);
		
		//更新文章内容
		public void updatecontent(Article a);
		
		public long selectCategoryIDByContentId(long id);
}
