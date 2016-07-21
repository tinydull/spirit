package com.kk.test.freemark;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;
import org.springframework.web.servlet.ModelAndView;

import com.kk.spirit.entity.CpuInfo;
import com.kk.spirit.entity.Device;
import com.kk.spirit.entity.Memory;
import com.kk.spirit.entity.SystemInfo;
import com.kk.spirit.utils.SystemInfoUtil;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class TestFreemarker {

	@Test
	public void testFreemarker() throws IOException, TemplateException {
		Configuration conf = new Configuration();
		
		conf.setDirectoryForTemplateLoading(new File("C:\\Users\\huangteng\\git\\spirit123\\WebContent\\WEB-INF\\freemarker\\"));
		Template temp = conf.getTemplate("sysinfo.ftl");
		
		SystemInfo sys = SystemInfoUtil.property();
    	Memory memory = SystemInfoUtil.memory();
    	List<CpuInfo> cpus = SystemInfoUtil.cpu();
    	List<Device> devices = SystemInfoUtil.file();
    	Map<String, Object> model = new HashMap<String, Object>();
		model.put("sys", sys);
		model.put("mem", memory);
		model.put("cpus", cpus);
		model.put("devices", devices);
		String html = FreeMarkerTemplateUtils.processTemplateIntoString(temp, model);
		System.out.println(html);
	}
}
