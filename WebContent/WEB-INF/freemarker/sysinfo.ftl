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

