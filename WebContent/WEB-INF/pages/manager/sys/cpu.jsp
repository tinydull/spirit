<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>CPU使用情况</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:include page="../include.jsp"></jsp:include>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<script type="text/javascript">                                                           
		    $(document).ready(function() {                                                  
				window.contextPath = '${ctx}';
		        Highcharts.setOptions({                                                     
		            global: {                                                               
		                useUTC: false                                                       
		            }                                                                       
		        });
				var series = [];
				$.ajax({url :window.contextPath + '/manager/system/cpuinfo.do',
					type: 'GET',
					dataType: 'json',
					async: false,
					success: function(data) {
						for (var j in data) {
							var kk = {
								name: '系统使用率1',
								data: (function() {
									// generate an array of random data
									var data = [],
											time = (new Date()).getTime();

									for (var i = -10; i <= 0; i++) {
										data.push({
											x: time + i * 1000,
											y: 0
										});
									}
									return data;
								})()
							};
							series.push(kk);
						}
					},
					error: function(data) {
						console.log(data);
					}
				});
				
		        var chart = $('#container').highcharts({                                                
		            chart: {                                                                
		                type: 'spline',                                                     
		                animation: Highcharts.svg, // don't animate in old IE               
		                marginRight: 10,                                                    
		                events: {                                                           
		                    load: function() {                                              
		                        // set up the updating of the chart each second             
		                        var series = this.series;                                
		                        setInterval(function() {                                    
		                            var x = (new Date()).getTime(); // current time         
		                            $.ajax({url :window.contextPath + '/manager/system/cpuinfo.do',
		                            		type: 'GET',
		                            		dataType: 'json',
		                            		success: function(data) {
		                            			//console.log(data);
		                            			for (var i in data) {
		                            				var y = data[i].combined.replace('%', '') / 1;
		                            				//console.log("第" + i + "个：Y=" + y);
						                            series[i].addPoint([x, y], true, true);   
		                            			}
		                            		},
		                            		error: function(data) {
		                            			for (var i in data) {
		                            				var y = data[i].combined.replace('%', '') / 1;
		                            				//console.log("第" + i + "个：Y=" + y);
						                            series[i].addPoint([x, y], true, true);   
		                            			}
		                            		}
		                            });
		                           
		                            $.ajax({url :window.contextPath + '/manager/system/cpuinfolist.do',
	                            		type: 'GET',
	                            		dataType: 'html',
	                            		success: function(data) {
	                            			$('#infoarea').html(data);
	                            		},
	                            		error: function(data) {
	                            			console.log('错误信息' + data);
	                            			console.log(data);
	                            		}
	                            });
		                        }, 2000);                                                   
		                    }                                                               
		                }                                                                   
		            },                                                                      
		            title: {                                                                
		                text: 'CPU使用率'                                            
		            },                                                                      
		            xAxis: {                                                                
		                type: 'datetime',                                                   
		                tickPixelInterval: 150                                              
		            },                                                                      
		            yAxis: {                                                                
		                title: {                                                            
		                    text: '使用率（%）'                                                   
		                },                                                                  
		                plotLines: [{                                                       
		                    value: 0,                                                       
		                    width: 1,                                                       
		                    color: '#808080'                                                
		                }],
		                min: 0,
	                    max: 100
		            },                                                                      
		            tooltip: {                                                              
		                formatter: function() {                                             
		                        return '<b>'+ this.series.name +'</b><br/>'+                
		                        Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
		                        Highcharts.numberFormat(this.y, 1) + ' %';                         
		                }                                                                   
		            },                                                                      
		            legend: {                                                               
		                enabled: true                                                      
		            },                                                                      
		            exporting: {                                                            
		                enabled: true                                                      
		            },                                                                      
		            series: series
		        });                                                                         
		    });                                                                             

</script>
</head>
<body class="container">
	<%-- CPU信息展示区域 --%>
	<div id="infoarea">${information}</div>
	<%-- CPU信息动态折线图 --%>
	<div id="container" style="height: 300px"></div>
</body>
</html>