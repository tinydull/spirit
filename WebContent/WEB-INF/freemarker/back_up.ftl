<!-- 计算机信息 -->
<div class='row'>
		<h2>计算机以及虚拟机信息</h2>
		<div class='col-md-6'>
			<table class='table table-condensed table-striped table-bordered'>
				<tr>
					<td>用户名</td>
					<td>${sys.sysname}</td>
			</tr>
			<tr>
				<td>计算机名</td>
				<td>${sys.comname}</td>
			</tr>
			<tr>
				<td>本地IP地址</td>
				<td>${sys.sysip}</td>
			</tr>
			<tr>
				<td>操作系统的名称</td>
				<td>${sys.osname}</td>
			</tr>
			<tr>
				<td>操作系统的构架</td>
				<td>${sys.osarch}</td>
			</tr>
			<tr>
				<td>操作系统的版本</td>
				<td>${sys.osversion}</td>
			</tr>
		</table>
	</div>
	<div class='col-md-6'>
		<table class='table table-condensed table-striped table-bordered'>
			<tr>
				<td>JVM可以使用的总内存</td>
				<td>${sys.totalMemory}</td>
			</tr>
			<tr>
				<td>JVM可以使用的剩余内存</td>
				<td>${sys.freeMemory}</td>
			</tr>
			<tr>
				<td>JVM可以使用的处理器个数</td>
				<td>${sys.availableProcessors}</td>
			</tr>
			<tr>
				<td>Java的运行环境版本</td>
				<td>${sys.version}</td>
			</tr>
			<tr>
				<td>Java的安装路径</td>
				<td>${sys.home}</td>
			</tr>
			<tr>
				<td>其他</td>
				<td>暂无</td>
			</tr>
		</table>
	</div>
</div>
<!-- 内存信息 -->
<div class='row'>
	<h2>内存以及交换区信息（K）</h2>
	<div class='col-md-6'>
		<table class='table table-condensed table-striped table-bordered'>
			<tr>
				<td>内存总量</td>
				<td>${mem.mtotal}</td>
			</tr>
			<tr>
				<td>当前内存使用量</td>
				<td>${mem.mused}</td>
			</tr>
			<tr>
				<td>当前内存剩余量</td>
				<td>${mem.mfree}</td>
			</tr>
		</table>
	</div>
	<div class='col-md-6'>
		<table class='table table-condensed table-striped table-bordered'>
			<tr>
				<td>交换区总量</td>
				<td>${mem.stotal}</td>
			</tr>
			<tr>
				<td>当前交换区使用量</td>
				<td>${mem.sused}</td>
			</tr>
			<tr>
				<td>当前交换区剩余量</td>
				<td>${mem.sfree}</td>
			</tr>
		</table>
	</div>
</div>
<!-- CPU信息  -->
<div class='row'>
	<h2>CPU信息</h2>
	<#list cpus as cpu>
		<div class='col-md-3'>
		<table class='table table-condensed table-striped table-bordered'>
			<tr>
				<td>CPU的总量MHz</td>
				<td>${cpu.mhz}</td>
			</tr>
			<tr>
				<td>CPU生产商</td>
				<td>${cpu.vendor}</td>
			</tr>
			<tr>
				<td>CPU类别</td>
				<td>${cpu.model}</td>
			</tr>
			<tr>
				<td>CPU缓存数量</td>
				<td>${cpu.size}</td>
			</tr>
			<tr>
				<td>CPU用户使用率</td>
				<td>${cpu.user}</td>
			</tr>
			<tr>
				<td>CPU系统使用率</td>
				<td>${cpu.sys}</td>
			</tr>
			<tr>
				<td>CPU当前等待率</td>
				<td>${cpu.wait}</td>
			</tr>
			<tr>
				<td>CPU当前错误率</td>
				<td>${cpu.nice}</td>
			</tr>
			<tr>
				<td>CPU当前空闲率</td>
				<td>${cpu.idle}</td>
			</tr>
			<tr>
				<td>CPU总的使用率</td>
				<td>${cpu.combined}</td>
			</tr>
		</table>
		</div>
  	</#list>
</div>


