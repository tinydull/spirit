package com.kk.spirit.controller.manager;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.kk.spirit.utils.JSONUtil;
import com.kk.spirit.utils.UploadFile;

/**
 * 文件上传处理类
 * 
 * @author huangteng
 * @date 2016年5月12日
 */
@Controller
@RequestMapping("/file")
public class FileUploadController {

	@RequestMapping("/uploadImg")
	@ResponseBody
	public String upload2(HttpServletRequest request, MultipartFile file) throws IllegalStateException, IOException {
		String fileName = file.getOriginalFilename();
		fileName = hasID(fileName);
		System.out.println(fileName);
		File targetFile = new File(fileName);
		if (!targetFile.exists()) {
			targetFile.mkdirs();
		}
		// 保存
		try {
			file.transferTo(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		}

		UploadFile.upload(targetFile.getPath(), fileName);

		Map<String, Object> map = new HashMap<String, Object>();
		/*
		 * map.put("path",
		 * "http://127.0.0.1:8081/spirit/static/images/page/navbar-bg.png");
		 */
		// http://o7ex6y36h.bkt.clouddn.com/f8132cd1-e391-401d-b8ab-c25f37a7a1ad.JPG
		map.put("path", "http://o7ex6y36h.bkt.clouddn.com/" + targetFile);
		map.put("success", "true");
		return JSONUtil.writeJson(map);
	}

	@RequestMapping("/toUpload")
	public String toUpload() {

		return "/test/upload";
	}

	private String hasID(String src) {
		int i = src.lastIndexOf(".");
		src = src.substring(i, src.length());
		UUID uuid = UUID.randomUUID();
		String name = uuid.toString();
		return name + src;
	}

}
