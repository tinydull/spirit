package com.kk.spirit.utils;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import org.hyperic.sigar.CpuInfo;
import org.hyperic.sigar.CpuPerc;
import org.hyperic.sigar.FileSystem;
import org.hyperic.sigar.FileSystemUsage;
import org.hyperic.sigar.Mem;
import org.hyperic.sigar.Sigar;
import org.hyperic.sigar.SigarException;
import org.hyperic.sigar.Swap;

import com.kk.spirit.entity.Device;
import com.kk.spirit.entity.Memory;
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
//        System.out.println("用户名:    " + userName);
        sys.setSysname(userName == null ? "" : userName);
//        System.out.println("计算机名:    " + computerName);
        sys.setComname(computerName == null ? "" : computerName);
//        System.out.println("本地ip地址:    " + ip);
        sys.setSysip(ip == null ? "" : ip);
//        System.out.println("JVM可以使用的总内存:    " + r.totalMemory() / 1024L);
        sys.setTotalMemory(r.totalMemory() / 1024L);
//        System.out.println("JVM可以使用的剩余内存:    " + r.freeMemory() / 1024L);
        sys.setFreeMemory(r.freeMemory() / 1024L);
//        System.out.println("JVM可以使用的处理器个数:    " + r.availableProcessors());
        sys.setAvailableProcessors(r.availableProcessors());
//        System.out.println("Java的运行环境版本：    " + props.getProperty("java.version"));
        sys.setVersion(props.getProperty("java.version"));
//        System.out.println("Java的安装路径：    " + props.getProperty("java.home"));
        sys.setHome(props.getProperty("java.home"));
//        System.out.println("操作系统的名称：    " + props.getProperty("os.name"));
        sys.setOsname(props.getProperty("os.name"));
//        System.out.println("操作系统的构架：    " + props.getProperty("os.arch"));
        sys.setOsarch(props.getProperty("os.arch"));
//        System.out.println("操作系统的版本：    " + props.getProperty("os.version"));
        sys.setOsversion(props.getProperty("os.version"));
        return sys;
    }

	public static List<com.kk.spirit.entity.CpuInfo> cpu() {
		List<com.kk.spirit.entity.CpuInfo> cpus = new ArrayList<>();
		try {
			Sigar sigar = new Sigar();
			CpuInfo infos[];
			infos = sigar.getCpuInfoList();
			CpuPerc cpuList[] = null;
			cpuList = sigar.getCpuPercList();
			for (int i = 0; i < infos.length; i++) {// 不管是单块CPU还是多CPU都适用
				com.kk.spirit.entity.CpuInfo cpu = new com.kk.spirit.entity.CpuInfo();
				CpuInfo info = infos[i];
//				System.out.println("第" + (i + 1) + "块CPU信息");
//            	System.out.println("CPU的总量MHz:    " + info.getMhz());// CPU的总量MHz
            	cpu.setMhz(info.getMhz());
//            	System.out.println("CPU生产商:    " + info.getVendor());// 获得CPU的卖主，如：Intel
            	cpu.setVendor("");
//            	System.out.println("CPU类别:    " + info.getModel());// 获得CPU的类别，如：Celeron
            	cpu.setModel(info.getModel());
//            	System.out.println("CPU缓存数量:    " + info.getCacheSize());// 缓冲存储器数量
            	cpu.setSize(info.getCacheSize());
//            	System.out.println("CPU用户使用率:    " + CpuPerc.format(cpuList[i].getUser()));// 用户使用率
            	cpu.setUser(CpuPerc.format(cpuList[i].getUser()));
//                System.out.println("CPU系统使用率:    " + CpuPerc.format(cpuList[i].getSys()));// 系统使用率
                cpu.setSys(CpuPerc.format(cpuList[i].getSys()));
//                System.out.println("CPU当前等待率:    " + CpuPerc.format(cpuList[i].getWait()));// 当前等待率
                cpu.setWait(CpuPerc.format(cpuList[i].getWait()));
//                System.out.println("CPU当前错误率:    " + CpuPerc.format(cpuList[i].getNice()));// 当前错误率
                cpu.setNice(CpuPerc.format(cpuList[i].getNice()));
//                System.out.println("CPU当前空闲率:    " + CpuPerc.format(cpuList[i].getIdle()));// 当前空闲率
                cpu.setIdle(CpuPerc.format(cpuList[i].getIdle()));
//                System.out.println("CPU总的使用率:    " + CpuPerc.format(cpuList[i].getCombined()));// 总的使用率
                cpu.setCombined(CpuPerc.format(cpuList[i].getCombined()));
                cpus.add(cpu);
			}
		} catch (SigarException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cpus;
    }
	
	public static Memory memory()  {
		Memory memory = new Memory();
		try {
			Sigar sigar = new Sigar();
	        Mem mem = sigar.getMem();
	        // 内存总量
//	        System.out.println("内存总量:    " + mem.getTotal() / 1024L + "K av");
	        memory.setMtotal(mem.getTotal() / 1024L);
	        // 当前内存使用量
//	        System.out.println("当前内存使用量:    " + mem.getUsed() / 1024L + "K used");
	        memory.setMused(mem.getUsed() / 1024L);
	        // 当前内存剩余量
//	        System.out.println("当前内存剩余量:    " + mem.getFree() / 1024L + "K free");
	        memory.setMfree(mem.getFree() / 1024L);
	        Swap swap = sigar.getSwap();
	        // 交换区总量
//	        System.out.println("交换区总量:    " + swap.getTotal() / 1024L + "K av");
	        memory.setStotal(swap.getTotal() / 1024L);
	        // 当前交换区使用量
//	        System.out.println("当前交换区使用量:    " + swap.getUsed() / 1024L + "K used");
	        memory.setSused(swap.getUsed() / 1024L);
	        // 当前交换区剩余量
//	        System.out.println("当前交换区剩余量:    " + swap.getFree() / 1024L + "K free");
	        memory.setSfree(swap.getFree() / 1024L);
	        
	        memory.setPercent(memory.getMused() * 100 / memory.getMtotal());
	        
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return memory;
    }
	
	public static List<Device> file() {
		List<Device> devices = new ArrayList<Device>();
        Sigar sigar = new Sigar();
        FileSystem fslist[] = null;
		try {
			fslist = sigar.getFileSystemList();
		} catch (SigarException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        for (int i = 0; i < fslist.length; i++) {
        	Device dev = new Device();
//            System.out.println("分区的盘符名称" + i);
            FileSystem fs = fslist[i];
            // 分区的盘符名称
//            System.out.println("盘符名称:    " + fs.getDevName());
            dev.setDevname(fs.getDevName());
            // 分区的盘符名称
//            System.out.println("盘符路径:    " + fs.getDirName());
            dev.setDirname(fs.getDirName());
//            System.out.println("盘符标志:    " + fs.getFlags());//
            dev.setFlag(fs.getFlags());
            // 文件系统类型，比如 FAT32、NTFS
//            System.out.println("盘符类型:    " + fs.getSysTypeName());
            dev.setSystypename(fs.getSysTypeName());
            // 文件系统类型名，比如本地硬盘、光驱、网络文件系统等
//            System.out.println("盘符类型名:    " + fs.getTypeName());
            // 文件系统类型
//            System.out.println("盘符文件系统类型:    " + fs.getType());
            FileSystemUsage usage = null;
//            System.out.println("fs.getType()：" + fs.getType());
            switch (fs.getType()) {
            case 0: // TYPE_UNKNOWN ：未知
                break;
            case 1: // TYPE_NONE
                break;
            case 2: // TYPE_LOCAL_DISK : 本地硬盘
            	try {
					usage = sigar.getFileSystemUsage(fs.getDirName());
				} catch (SigarException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                // 文件系统总大小
//                System.out.println(fs.getDevName() + "总大小:    " + usage.getTotal() + "KB");
                dev.setTotal(usage.getTotal());
                // 文件系统剩余大小
//                System.out.println(fs.getDevName() + "剩余大小:    " + usage.getFree() + "KB");
                dev.setFree(usage.getFree());
                // 文件系统可用大小
//                System.out.println(fs.getDevName() + "可用大小:    " + usage.getAvail() + "KB");
                dev.setAvail(usage.getAvail());
                // 文件系统已经使用量
//                System.out.println(fs.getDevName() + "已经使用量:    " + usage.getUsed() + "KB");
                dev.setUsed(usage.getUsed());
                double usePercent = usage.getUsePercent() * 100D;
                // 文件系统资源的利用率
                System.out.println(fs.getDevName() + "资源的利用率:    " + String.format("%.1f", usePercent) + "%");
                dev.setPeruser(String.format("%.1f", usePercent));
                dev.setUseper(String.format("%.1f", usePercent));
//                System.out.println(fs.getDevName() + "读出：    " + usage.getDiskReads());
                dev.setDiskreads(usage.getDiskReads());
//                System.out.println(fs.getDevName() + "写入：    " + usage.getDiskWrites());
                dev.setDiskwrites(usage.getDiskWrites());
                devices.add(dev);
                break;
            case 3:// TYPE_NETWORK ：网络
                break;
            case 4:// TYPE_RAM_DISK ：闪存
                break;
            case 5:// TYPE_CDROM ：光驱
                break;
            case 6:// TYPE_SWAP ：页面交换
                break;
            }
            
        }
        return devices;
    }
	
	public static void main(String[] args) throws Exception {
		
//				cpu();
//				memory();
//				property();
				System.out.println(JSONUtil.writeJson(file()));
			
		
	}
}
