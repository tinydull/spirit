package com.kk.spirit.dao;

import java.util.List;

import com.kk.spirit.entity.Article;
import com.kk.spirit.entity.Comment;

public interface ArticleDao {

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
	 * 新增文章保存
	 * 
	 */
	public int insert(Article article);

	/**
	 * 修改文章信息
	 * 
	 */
	public int update(Article article);

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
	 * 查询文章对应的所有评论
	 * 
	 */
	public List<Comment> queryCommentsByArticleId(String id);

	/**
	 * 插入评论 <功能详细描述>
	 */
	public int insertComment(Comment comment);
}
