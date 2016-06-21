package com.kk.spirit.controller.manager;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kk.spirit.entity.Article;
import com.kk.spirit.service.ArticleService;
import com.kk.spirit.utils.JSONUtil;
/**
 * 文章管理界面
 * 
 */
@Controller
@RequestMapping("/manager/article")
public class ArticleController {

	@Autowired
	private ArticleService articleService;
	/**
	 * 文章列表
	 * <功能详细描述>
	 */
	@RequestMapping(value="/list",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String list(String id) {
		List<Article> list = articleService.queryArticles(id);
		return JSONUtil.writeJson(list);
	}
	
	@RequestMapping("/queryArticleById")
	@ResponseBody
	public Article queryArticleById(String id){
		
		Article article = articleService.queryArticleById(id);
		return article;
	}
	/**
	 * 保存
	 * <功能详细描述>
	 */
	@RequestMapping("/save")
	@ResponseBody
	public String save(Article article) {
		articleService.save(article);
		return "true";
	}
	/**
	 * 删除
	 * <功能详细描述>
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(Article article) {
		articleService.delete(article);
		return "true";
	}
	
	
	
}
