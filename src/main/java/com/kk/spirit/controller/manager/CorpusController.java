package com.kk.spirit.controller.manager;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.kk.spirit.entity.Corpus;
import com.kk.spirit.service.CorpusService;
import com.kk.spirit.utils.JSONUtil;
/**
 * 
 * <功能详细描述>
 * 
 * @author  huangteng
 * @date  2016年5月11日
 */
@Controller
@RequestMapping("/manager/corpus")
public class CorpusController {

	@Autowired
	private CorpusService corpusService;
	
	/**
	 * 文集列表展示
	 * <功能详细描述>
	 */
	@ResponseBody
	@RequestMapping("/list")
	public String list() {
		List<Corpus> list = corpusService.queryCorpus();
		
		return JSONUtil.writeJson(list);
	}
	
	/**
	 * 新建或者修改的文集--保存
	 * <功能详细描述>
	 */
	@RequestMapping("/save")
	@ResponseBody
	public String save(Corpus corpus) {
		int f = corpusService.save(corpus);
		if (f == 1) {
			return "true";			
		}else {
			return "false";
		}
		
		
	}
	
	/**
	 * 文集--删除（移动到回收站）
	 * <功能详细描述>
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(Corpus corpus) {
		corpusService.delete(corpus);
		return "true";
	}
}
