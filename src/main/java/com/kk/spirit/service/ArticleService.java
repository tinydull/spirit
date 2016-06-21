package com.kk.spirit.service;

import java.util.List;

import com.kk.spirit.entity.Article;
import com.kk.spirit.entity.Comment;
/**
 * 文章管理
 * <功能详细描述>
 * 
 * @author  huangteng
 * @date  2016年5月19日
 */
public interface ArticleService {

	/**
	 * 根据类别查询文章列表
	 * <功能详细描述>
	 */
	public List<Article> queryArticles(String id);
	/**
	 * 根据文章ID查询文章
	 * <功能详细描述>
	 */
	public Article queryArticleById(String id);
	/**
	 * 保存文章
	 * <功能详细描述>
	 */
	public int save(Article article);
	/**
	 * 更新文章的浏览量信息
	 * <功能详细描述>
	 */
	public int updatePV(Article article);
	/**
	 * 删除文章（逻辑删除，移动到回收站）
	 * <功能详细描述>
	 */
	public int delete(Article article);
	
	public List<Comment> queryCommentsByArticleId(String id);
	
	public int insertComment(Comment comment);
}
