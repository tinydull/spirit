<!-- CPU信息  -->
<div class='row'>
	<h2>CPU信息</h2>
	<#list cpus as cpu>
		<#if (cpu_index= 0)>
		<div class='col-md-12'>
			<table class='table table-condensed table-striped table-bordered'>
				<tr>
					<td>CPU的总量MHz</td>
					<td>${cpu.mhz}</td>
					<td>CPU生产商</td>
					<td>${cpu.vendor}</td>
				</tr>
				<tr>
					<td>CPU类别</td>
					<td>${cpu.model}</td>
					<td>CPU缓存数量</td>
					<td>${cpu.size}</td>
				</tr>
			</table>
		</div>
		</#if>
		<div class='col-md-3'>
		<table class='table table-condensed table-striped table-bordered'>
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


