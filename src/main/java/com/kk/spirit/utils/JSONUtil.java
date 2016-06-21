package com.kk.spirit.utils;

import com.alibaba.fastjson.JSON;
/**
 * 
 * JSON工具类
 * 
 * @author  huangteng
 * @date  2016年6月21日
 */
public class JSONUtil {
	/**
	 * 
	 * 格式化为JSON类型的字符串
	 */
	public static String writeJson(Object obj) {
		return JSON.toJSONString(obj);
	}
	
}
