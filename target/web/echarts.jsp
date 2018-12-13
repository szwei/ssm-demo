<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Echarts图表</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>

</head>
<script type="text/javascript" src="static/echarts/jquery-1.8.3.js"></script>
<script type="text/javascript" src="static/echarts/echarts.js"></script>
<body>
	<!-- 显示Echarts图表 -->
		<div style="height:410px;min-height:100px;margin:0 auto;" id="main"></div>						
 	<script type="text/javascript">
		
		// 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
        // 指定图表的配置项和数据
        var option = {
            title: {	//图表标题
                text: 'test数据图表'
            },
            tooltip: {
                trigger: 'axis', //坐标轴触发提示框，多用于柱状、折线图中
                
            },
            dataZoom: [
                 {
                     type: 'slider',	//支持鼠标滚轮缩放
                     start: 0,			//默认数据初始缩放范围为10%到90%
                     end: 100
                 },
                 {
                     type: 'inside',	//支持单独的滑动条缩放
                     start: 0,			//默认数据初始缩放范围为10%到90%
                     end: 100
                 }
            ],
           /*  legend: {	//图表上方的类别显示           	
            	show:true,
            	data:['人数']
            }, */
      
            
           toolbox: {
               feature: {
                 dataView: {show: true, readOnly: false},
                 magicType: {show: true, type: ['line', 'bar']},
                 restore: {show: true},
                 saveAsImage: {show: true}
               }
             },
            xAxis:  {	//X轴       	
                type : 'category',
                data : []	//先设置数据值为空，后面用Ajax获取动态数据填入
            },
            yAxis : [	//Y轴（这里我设置了两个Y轴，左右各一个）
						{
	                         type : 'value',
	                         name : '人数',
	                         axisLabel : {
	                             formatter: '{value}'	//控制输出格式
	                         }
	                     }
	                 
            ],
            series : [	//系列（内容）列表                      
						{
		                    name:'人数',
		                    type:'bar',	
		                    itemStyle: {
		                        normal: {
		                            color: function(params) {
		                                // build a color map as your need.
		                                var colorList = [
		                                  '#C1232B','#B5C334','#FCCE10','#E87C25','#27727B',
		                                   '#FE8463','#9BCA63','#FAD860','#F3A43B','#60C0DD',
		                                   '#D7504B','#C6E579','#F4E001','#F0805A','#26C0C0'
		                                ];
		                                return colorList[params.dataIndex%12]
		                            },
		                            label: {
		                                show: true,
		                                position: 'top',
		                                formatter: '{b}\n{c}'
		                            }
		                        }
		                    },
		    				
		                    data:[]		//数据值通过Ajax动态获取
		                } 
            ]
        };
		 
		myChart.showLoading();	//数据加载完之前先显示一段简单的loading动画
		 
		 var num=[];	//风速数组
		 var data=[];		//时间数组
		 
         $.ajax({	//使用JQuery内置的Ajax方法
         type : "post",		//post请求方式
         async : true,		//异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
         url : "${APP_PATH}/depts",	//请求发送到ShowInfoIndexServlet处
         dataType : "json",		//返回数据形式为json
         success : function(result) {
        	 //请求成功时执行该函数内容，result即为服务器返回的json对象
	         if (result.extend.depts != null && result.extend.depts.length > 0) {
	                for(var i=0;i<result.extend.depts.length;i++){       
	                   num.push(result.extend.depts[i].deptNum);		//挨个取出温度、湿度、压强等值并填入前面声明的温度、湿度、压强等数组
	                   data.push(result.extend.depts[i].deptName);
	                 
	                }
	                myChart.hideLoading();	//隐藏加载动画
	                myChart.setOption({		//载入数据
	   		         xAxis: {
	   		             data: data	//填入X轴数据
	   		         },
	   		         series: [	//填入系列（内容）数据
	   		               		{
			   		             // 根据名字对应到相应的系列
			   		             name: '人数',
			   		             data: num
	   		         		}
	   		        ]
	   		     });
	                
	         }
	         else {
	        	 //返回的数据为空时显示提示信息
	        	 alert("图表请求数据为空，可能服务器暂未录入近五天的观测数据，您可以稍后再试！");
	          	 myChart.hideLoading();
	         }
         
		},
     	error : function(errorMsg) {
     		//请求失败时执行该函数
         	alert("图表请求数据失败，可能是服务器开小差了");
         	myChart.hideLoading();    	
     	}
    })

    myChart.setOption(option);	//载入图表
		 
    </script> 
    
    
</body>
</html>