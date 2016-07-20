package com.kk.spirit.controller.manager;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kk.spirit.entity.CpuInfo;
import com.kk.spirit.entity.Memory;
import com.kk.spirit.entity.SystemInfo;
import com.kk.spirit.utils.JSONUtil;
import com.kk.spirit.utils.SystemInfoUtil;

import freemarker.core.ParseException;
import freemarker.template.Configuration;
import freemarker.template.MalformedTemplateNameException;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateNotFoundException;

@Controller
@RequestMapping("/manager/system")
public class SystemController {

	@RequestMapping(value="/systeminfo", produces="text/html;charset=UTF-8")
    @ResponseBody
    public String systeminfo(HttpServletRequest req) throws IOException, TemplateException {
    	Configuration conf = new Configuration();
    	conf.setDefaultEncoding("UTF-8");
    	conf.setServletContextForTemplateLoading(req.getServletContext(), "/WEB-INF/freemarker/");
//		conf.setDirectoryForTemplateLoading(new File("C:\\Users\\huangteng\\git\\spirit123\\WebContent\\WEB-INF\\freemarker\\"));
		Template temp = conf.getTemplate("sysinfo.ftl");
		SystemInfo sys = SystemInfoUtil.property();
    	Map<String, Object> model = new HashMap<String, Object>();
		model.put("sys", sys);
		String html = FreeMarkerTemplateUtils.processTemplateIntoString(temp, model);
    	return html;
    }
	
	@RequestMapping("/memory")
	public ModelAndView memory(HttpServletRequest req) throws TemplateNotFoundException, MalformedTemplateNameException, ParseException, IOException, TemplateException {
		ModelAndView mv = new ModelAndView("manager/sys/memory");
		Configuration conf = new Configuration();
    	conf.setDefaultEncoding("UTF-8");
//		conf.setDirectoryForTemplateLoading(new File("C:\\Users\\huangteng\\git\\spirit123\\WebContent\\WEB-INF\\freemarker\\"));
    	conf.setServletContextForTemplateLoading(req.getServletContext(), "/WEB-INF/freemarker/");
		Template temp = conf.getTemplate("memory.ftl");
    	Memory memory = SystemInfoUtil.memory();
    	Map<String, Object> model = new HashMap<String, Object>();
		model.put("mem", memory);
    	String html = FreeMarkerTemplateUtils.processTemplateIntoString(temp, model);
    	mv.addObject("information", html);
		return mv;
	}
	
	@RequestMapping("/cpu")
	public ModelAndView cpu(HttpServletRequest req) throws TemplateNotFoundException, MalformedTemplateNameException, ParseException, IOException, TemplateException {
		ModelAndView mv = new ModelAndView("manager/sys/cpu");
		Configuration conf = new Configuration();
    	conf.setDefaultEncoding("UTF-8");
//		conf.setDirectoryForTemplateLoading(new File("C:\\Users\\huangteng\\git\\spirit123\\WebContent\\WEB-INF\\freemarker\\"));
    	conf.setServletContextForTemplateLoading(req.getServletContext(), "/WEB-INF/freemarker/");
		Template temp = conf.getTemplate("cpu.ftl");
    	List<CpuInfo> cpus = SystemInfoUtil.cpu();
    	Map<String, Object> model = new HashMap<String, Object>();
		model.put("cpus", cpus);
		String html = FreeMarkerTemplateUtils.processTemplateIntoString(temp, model);
		mv.addObject("information", html);
		return mv;
	}
	
	
    @RequestMapping(value="/memoryinfo", produces="text/html;charset=UTF-8")
    @ResponseBody
    public String memoryinfo(HttpServletRequest req) throws IOException, TemplateException {
    	Configuration conf = new Configuration();
    	conf.setDefaultEncoding("UTF-8");
//		conf.setDirectoryForTemplateLoading(new File("C:\\Users\\huangteng\\git\\spirit123\\WebContent\\WEB-INF\\freemarker\\"));
    	conf.setServletContextForTemplateLoading(req.getServletContext(), "/WEB-INF/freemarker/");
		Template temp = conf.getTemplate("memory.ftl");
    	Memory memory = SystemInfoUtil.memory();
    	Map<String, Object> model = new HashMap<String, Object>();
		model.put("mem", memory);
		String html = FreeMarkerTemplateUtils.processTemplateIntoString(temp, model);
    	return html;
    }
    
    @RequestMapping(value="/cpuinfo", produces="text/html;charset=UTF-8")
    @ResponseBody
    public String cpuinfo(HttpServletRequest req) throws IOException, TemplateException {
    	Configuration conf = new Configuration();
    	conf.setDefaultEncoding("UTF-8");
//		conf.setDirectoryForTemplateLoading(new File("C:\\Users\\huangteng\\git\\spirit123\\WebContent\\WEB-INF\\freemarker\\"));
    	conf.setServletContextForTemplateLoading(req.getServletContext(), "/WEB-INF/freemarker/");
    	List<CpuInfo> cpus = SystemInfoUtil.cpu();
//    	Template temp = conf.getTemplate("cpu.ftl");
//    	Map<String, Object> model = new HashMap<String, Object>();
//		model.put("cpus", cpus);
//		String html = FreeMarkerTemplateUtils.processTemplateIntoString(temp, model);
    	return JSONUtil.writeJson(cpus);
    }
	
	
}
