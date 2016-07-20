<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:include page="../include.jsp"></jsp:include>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<script type="text/javascript">
	$(function () {
		window.contextPath = '${ctx}';
	    $('#container').highcharts({
		    chart: {
		    	backgroundColor: null,
		        type: 'gauge',
		        plotBackgroundColor: null,
		        plotBackgroundImage: null,
		        plotBorderWidth: 0,
		        plotShadow: false
		    },
		    title: {
		        text: '内存使用情况'
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
		        max: 100,
		        
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
		            text: ' %'
		        },
		        plotBands: [{
		            from: 0,
		            to: 60,
		            color: '#55BF3B' // green
		        }, {
		            from: 60,
		            to: 80,
		            color: '#DDDF0D' // yellow
		        }, {
		            from: 80,
		            to: 100,
		            color: '#DF5353' // red
		        }]        
		    },
		
		    series: [{
		        name: '使用量',
		        data: [0],
		        tooltip: {
		            valueSuffix: ' %'
		        }
		    }]
		}, 
		// Add some life
		function (chart) {
			if (!chart.renderer.forExport) {
			    setInterval(function () {
			    	var point = chart.series[0].points[0];
			        $.ajax({url: window.contextPath + '/manager/system/memoryinfo.do',
			        		type: 'GET',
			        		dataType:'html',
			        		success:function(data) {
			        			$('#infoarea').html(data);
			        			var newVal = $('#memoryuserpercent').val();
			        			point.y = newVal;
			        			point.update(newVal);
			        		},
			        		error:function(data) {
			        			
			        		}
			        });
			    }, 2000);
			}
		});
	});				

</script>
</head>
<body class="container">
	<div id="infoarea">
		${information}
	</div>
	<div id="container" style="min-width:700px;height:400px"></div>
</body>
</html>