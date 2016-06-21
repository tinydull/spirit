package com.kk.spirit.service;

import java.util.List;

import com.kk.spirit.entity.Article;
import com.kk.spirit.entity.Comment;
/**
 * 文章管理
 * 
 * 
 * @author  huangteng
 * @date  2016年5月19日
 */
public interface ArticleService {

	/**
	 * 根据类别查询文章列表
	 * 
	 */
	public List<Article> queryArticles(String id);
	/**
	 * 根据文章ID查询文章
	 * 
	 */
	public Article queryArticleById(String id);
	/**
	 * 保存文章
	 * 
	 */
	public int save(Article article);
	/**
	 * 更新文章的浏览量信息
	 * 
	 */
	public int updatePV(Article article);
	/**
	 * 删除文章（逻辑删除，移动到回收站）
	 * 
	 */
	public int delete(Article article);
	/**
	 * 
	 * 查询对应文章的评论列表
	 */
	public List<Comment> queryCommentsByArticleId(String id);
	/**
	 * 
	 * 插入文章的评论信息
	 */
	public int insertComment(Comment comment);
}
