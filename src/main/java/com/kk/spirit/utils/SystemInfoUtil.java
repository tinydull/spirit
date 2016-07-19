package com.kk.spirit.utils;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Map;
import java.util.Properties;

import com.kk.spirit.entity.SystemInfo;

public class SystemInfoUtil {

	
	public static SystemInfo property() {
		SystemInfo sys = new SystemInfo();
		
        Runtime r = Runtime.getRuntime();
        Properties props = System.getProperties();
        InetAddress addr = null;
		try {
			addr = InetAddress.getLocalHost();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        String ip = addr.getHostAddress();
        Map<String, String> map = System.getenv();
        String userName = map.get("USERNAME");// 获取用户名
        String computerName = map.get("COMPUTERNAME");// 获取计算机名
        System.out.println("用户名:    " + userName);
        sys.setSysname(userName);
        System.out.println("计算机名:    " + computerName);
        sys.setComname(computerName);
        System.out.println("本地ip地址:    " + ip);
        sys.setSysip(ip);
        System.out.println("JVM可以使用的总内存:    " + r.totalMemory());
        sys.setTotalMemory(r.totalMemory());
        System.out.println("JVM可以使用的剩余内存:    " + r.freeMemory());
        sys.setFreeMemory(r.freeMemory());
        System.out.println("JVM可以使用的处理器个数:    " + r.availableProcessors());
        sys.setAvailableProcessors(r.availableProcessors());
        System.out.println("Java的运行环境版本：    " + props.getProperty("java.version"));
        sys.setVersion(props.getProperty("java.version"));
        System.out.println("Java的安装路径：    " + props.getProperty("java.home"));
        sys.setHome(props.getProperty("java.home"));
        System.out.println("操作系统的名称：    " + props.getProperty("os.name"));
        sys.setOsname(props.getProperty("os.name"));
        System.out.println("操作系统的构架：    " + props.getProperty("os.arch"));
        sys.setOsarch(props.getProperty("os.arch"));
        System.out.println("操作系统的版本：    " + props.getProperty("os.version"));
        sys.setOsversion(props.getProperty("os.version"));
        return sys;
    }

	public static void main(String[] args) {
			property();
	}
}
