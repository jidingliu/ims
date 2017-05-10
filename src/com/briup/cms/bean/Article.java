package com.briup.cms.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 文章
 * */
public class Article {
	private Long id;
	//标题
	private String title;
	//内容
	private String content;
	//作者
	private String author;
	//发布日期
	private Date publisurDate;
	//点击次数
	private Integer clickTimes;
	//所属栏目 文章和栏目之间关系为多对一关系
	private Category category;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getPublisurDate() {
		return publisurDate;
	}
	public void setPublisurDate(Date publisurDate) {
		this.publisurDate = publisurDate;
	}
	public Integer getClickTimes() {
		return clickTimes;
	}
	public void setClickTimes(Integer clickTimes) {
		this.clickTimes = clickTimes;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "Article [id=" + id + ", title=" + title + ", content="
				+ content + ", author=" + author + ", publisurDate="
				+ publisurDate + ", clickTimes=" + clickTimes + ", category="
				+ category + "]";
	}
	
	
}
