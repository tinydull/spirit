//package com.kk.spirit.controller.manager;
//
//import java.util.List;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.ModelAndView;
//import com.kk.spirit.entity.Article;
//import com.kk.spirit.entity.Comment;
//import com.kk.spirit.service.ArticleService;
//
///**
// * 首页控制器
// * 
// */
//@Controller
//@RequestMapping("/")
//public class IndexController {
//
//	@Autowired
//	private ArticleService articleService;
//
//	/**
//	 * 首页功能 文章列表 
//	 * <功能详细描述>
//	 */
//	@RequestMapping("/")
//	public ModelAndView index(String offset) {
//		ModelAndView mv = new ModelAndView("index");
//		mv.addObject("getNext", "false");
//		List<Article> list = articleService.queryArticles(null);
//		if (!list.isEmpty()) {
//			if (list.size() > 10) {
//				list = list.subList(0, 10);
//				mv.addObject("offset", 10);
//				mv.addObject("getNext", "true");
//			}
//		}
//		mv.addObject("list", list);
//		return mv;
//	}
//
//	/**
//	 * 文章详情页面
//	 * <功能详细描述>
//	 */
//	@RequestMapping("/detail")
//	public ModelAndView detail(String id) {
//		ModelAndView mv = new ModelAndView("detail");
//		Article article = articleService.queryArticleById(id);
//		
//		if (null != article) {
//			if (null != article.getPv()) {
//				article.setPv(article.getPv() + 1);
//			} else {
//				article.setPv(1);
//			}
//		}
//		articleService.updatePV(article);
//		mv.addObject("article", article);
//		return mv;
//	}
//	
//	@RequestMapping("/addComment")
//	@ResponseBody
//	public String addComment(Comment comment) {
//		articleService.insertComment(comment);
//		return "true";
//	}
//	
//	
//	
//	/**
//	 * 
//	 * 关于页面
//	 * <功能详细描述>
//	 */
//	@RequestMapping("/about")
//	public ModelAndView info(String info) {
//		ModelAndView mv = new ModelAndView("about");
//		return mv;
//	}
//	
//}
