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
		    $(document).ready(function() {                                                  
				window.contextPath = '${ctx}';
		        Highcharts.setOptions({                                                     
		            global: {                                                               
		                useUTC: false                                                       
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
		                        var series = this.series[0];                                
		                        setInterval(function() {                                    
		                            var x = (new Date()).getTime(); // current time         
		                            $.ajax({url :window.contextPath + '/manager/system/cpuinfo.do',
		                            		type: 'GET',
		                            		dataType: 'json',
		                            		success: function(data) {
		                            			if (series.curIndex) {
			                            			var y = data[series.curIndex].combined.replace('%', '') / 1;
						                            series.addPoint([x, y], true, true);                    	
		                            			} else {
			                            			var y = data[0].combined.replace('%', '') / 1;
						                            series.addPoint([x, y], true, true);                    
		                            			}
		                            		},
		                            		error: function(data) {
		                            			console.log('错误信息');
		                            			
		                            		}
		                            });
		                           
		                            $.ajax({url :window.contextPath + '/manager/system/cpuinfolist.do',
	                            		type: 'GET',
	                            		dataType: 'html',
	                            		success: function(data) {
	                            			$('#infoarea').html(data);
	                            		},
	                            		error: function(data) {
	                            			console.log('错误信息');
	                            			
	                            		}
	                            });
		                        }, 1000);                                                   
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
		                enabled: false                                                      
		            },                                                                      
		            exporting: {                                                            
		                enabled: true                                                      
		            },                                                                      
		            series: [{                                                              
		                name: '系统使用率',                                                
		                data: (function() {                                                 
		                    // generate an array of random data                             
		                    var data = [],                                                  
		                        time = (new Date()).getTime(), i;                                                          
		                                                                                    
		                    for (i = -20; i <= 0; i++) {                                    
		                        data.push({                                                 
		                            x: time + i * 1000,                                     
		                            y: 0                                        
		                        });                                                         
		                    }                            
		                    console.log(data);
		                    return data;                                                    
		                })()                                                                
		            }]                                                                      
		        });                                                                         
		    });                                                                             
		                                                                                    
		});                                                                                 				
			

function cpuselect() {
	var val = $('#cpuselect').val();
	var chart = $('#container').highcharts();
	for (i = 0; i < chart.series[0].data.length; i++) {
		chart.series[0].curIndex = val;
		chart.series[0].data[i].y = 0;
	}
	chart.redraw();
	
}
</script>
</head>
<body class="container">
	<div id="infoarea">${information}</div>
	<form class="form-horizontal">
		<div class="form-group">
	    	<label for="inputEmail3" class="col-sm-2 control-label">请选择一个CPU查看：</label>
	    	<div class="col-sm-10">
	      		<select class="form-control" onchange="cpuselect()">
					<c:forEach var="cp" items="${cputotal}" varStatus="status">
						<option value="${status.index}">第 ${status.index} 个 CPU</option>		
					</c:forEach>
				</select>
	    	</div>
	  	</div>
	</form>
	<div id="container" style="min-width: 700px; height: 400px"></div>
</body>
</html>