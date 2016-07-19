<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>主页</title>
<jsp:include page="include.jsp"></jsp:include>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<script type="text/javascript" src="http://cdn.hcharts.cn/jquery/jquery-1.8.3.min.js"></script> 
<script type="text/javascript" src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script> 
<script type="text/javascript" src="http://cdn.hcharts.cn/highcharts/exporting.js"></script> 
<script type="text/javascript" src="http://cdn.hcharts.cn/highcharts/highcharts-more.js"></script>

<style>

</style>
<script type="text/javascript">


$(function () {
	
    $('#container').highcharts({
	
	    chart: {
	        type: 'gauge',
	        plotBackgroundColor: null,
	        plotBackgroundImage: null,
	        plotBorderWidth: 0,
	        plotShadow: false
	    },
	    
	    title: {
	        text: 'Speedometer'
	    },
	    
	    pane: {
	        startAngle: -150,
	        endAngle: 150,
	        background: [{
	            backgroundColor: {
	                linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
	                stops: [
	                    [0, '#FFF'],
	                    [1, '#333']
	                ]
	            },
	            borderWidth: 0,
	            outerRadius: '109%'
	        }, {
	            backgroundColor: {
	                linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
	                stops: [
	                    [0, '#333'],
	                    [1, '#FFF']
	                ]
	            },
	            borderWidth: 1,
	            outerRadius: '107%'
	        }, {
	            // default background
	        }, {
	            backgroundColor: '#DDD',
	            borderWidth: 0,
	            outerRadius: '105%',
	            innerRadius: '103%'
	        }]
	    },
	       
	    // the value axis
	    yAxis: {
	        min: 0,
	        max: 200,
	        
	        minorTickInterval: 'auto',
	        minorTickWidth: 1,
	        minorTickLength: 10,
	        minorTickPosition: 'inside',
	        minorTickColor: '#666',
	
	        tickPixelInterval: 30,
	        tickWidth: 2,
	        tickPosition: 'inside',
	        tickLength: 10,
	        tickColor: '#666',
	        labels: {
	            step: 2,
	            rotation: 'auto'
	        },
	        title: {
	            text: 'km/h'
	        },
	        plotBands: [{
	            from: 0,
	            to: 120,
	            color: '#55BF3B' // green
	        }, {
	            from: 120,
	            to: 160,
	            color: '#DDDF0D' // yellow
	        }, {
	            from: 160,
	            to: 200,
	            color: '#DF5353' // red
	        }]        
	    },
	
	    series: [{
	        name: 'Speed',
	        data: [80],
	        tooltip: {
	            valueSuffix: ' km/h'
	        }
	    }]
	
	}, 
	// Add some life
	function (chart) {
		if (!chart.renderer.forExport) {
		    setInterval(function () {
		        var point = chart.series[0].points[0],
		            newVal,
		            inc = Math.round((Math.random() - 0.5) * 20);
		        
		        newVal = point.y + inc;
		        if (newVal < 0 || newVal > 200) {
		            newVal = point.y - inc;
		        }
		        
		        point.update(newVal);
		        
		    }, 3000);
		}
	});
});				



</script>
</head>
<body class="container-fluid">
	<div class="row">
		<h2>计算机以及虚拟机信息</h2>
		<div class="col-md-6">
			<table class="table table-condensed">
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
		<div class="col-md-6">
			<table class="table table-condensed">
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
	<div class="row">
		<h2>内存以及交换区信息</h2>
		<div class="col-md-6">
			<table class="table table-condensed">
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
		<div class="col-md-6">
			<table class="table table-condensed">
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
	<div class="row">
		<h2>CPU信息展示</h2>
		<div id="container" style="min-width:700px;height:400px"></div>
	</div>
</body>
</html>







