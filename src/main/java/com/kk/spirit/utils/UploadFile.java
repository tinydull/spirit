package com.kk.spirit.utils;

import com.qiniu.util.Auth;
import java.io.IOException;
import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;

public class UploadFile {
	// 设置好账号的ACCESS_KEY和SECRET_KEY
	static String ACCESS_KEY = "TagrdOqL_pPwji0ltqUJdQJ0zeAC6QdEfPWC4_xX";
	static String SECRET_KEY = "oQBC6tWN92gWt4noLna71pdbh4Ek8YaaFwZk2BA9";
	// 要上传的空间
	static String bucketname = "blog";
	// 上传到七牛后保存的文件名
	static String key = "my-java.png";
	// 密钥配置
	static Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
	// 创建上传对象
	UploadManager uploadManager = new UploadManager();

	// 简单上传，使用默认策略，只需要设置上传的空间名就可以了
	public static String getUpToken() {
		return auth.uploadToken(bucketname);
	}

	public static void upload(String file, String key) throws IOException {
		java.security.Security.addProvider(new com.sun.crypto.provider.SunJCE());
		try {
			// 创建上传对象
			UploadManager uploadManager = new UploadManager();
			// 调用put方法上传
			Response res = uploadManager.put(file, key, getUpToken());
			// 打印返回的信息
			System.out.println(res.bodyString());
		} catch (QiniuException e) {
			Response r = e.response;
			// 请求失败时打印的异常的信息
			System.out.println(r.toString());
			try {
				// 响应的文本信息
				System.out.println(r.bodyString());
			} catch (QiniuException e1) {
				// ignore
			}
		}
	}

}