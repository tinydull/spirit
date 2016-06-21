package com.kk.spirit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kk.spirit.dao.ArticleDao;
import com.kk.spirit.entity.Article;
import com.kk.spirit.entity.Comment;
import com.kk.spirit.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	private ArticleDao articleDao;
	
	@Override
	public List<Article> queryArticles(String id) {
		// TODO Auto-generated method stub
		return articleDao.queryArticles(id);
	}

	@Override
	public int save(Article article) {
		// TODO Auto-generated method stub
		article.setWords(countWords(article.getMd()));
		if (null != article.getId() && !"".equals(article.getId())) {
			return articleDao.update(article);
		}else {
			return articleDao.insert(article);
		}
		
	}

	@Override
	public Article queryArticleById(String id) {
		// TODO Auto-generated method stub
		Article article = articleDao.queryArticleById(id);
		List<Comment> list = articleDao.queryCommentsByArticleId(id);
		if (null != list && !list.isEmpty()) {
			article.setComments(list);
		}
		return article;
	}

	@Override
	public int updatePV(Article article) {
		// TODO Auto-generated method stub
		return articleDao.updatePV(article);
	}

	
	private static int countWords(String str) {
		if (str == null || str.length() <= 0) {
			return 0;
		}
		int len = 0;
		char c;
		for (int i = str.length() - 1; i >= 0; i--) {
			c = str.charAt(i);
			if ((c >= '0' && c <= '9') || (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')) {
				// 字母, 数字
				len += 0.5;
			} else {
				if (Character.isLetter(c)) { // 中文
					len++;
				} else { // 符号或控制字符
					len += 0.5;
				}
			}
		}
		return len;
	}

	@Override
	public int delete(Article article) {
		// TODO Auto-generated method stub
		return articleDao.delete(article);
	}

	@Override
	public List<Comment> queryCommentsByArticleId(String id) {
		// TODO Auto-generated method stub
		return articleDao.queryCommentsByArticleId(id);
	}

	@Override
	public int insertComment(Comment comment) {
		// TODO Auto-generated method stub
		return articleDao.insertComment(comment);
	}
}
