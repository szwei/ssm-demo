<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Echarts饼图</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
</head>
<script type="text/javascript" src="static/echarts/jquery-1.8.3.js"></script>
<script type="text/javascript" src="static/echarts/echarts.js"></script>
<body>
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="height:400px"></div>
     	<script type="text/javascript">
		
		// 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
        // 指定图表的配置项和数据
                option = {
                	    title : {
                	        text: '部门人员分析',
                	        subtext: '纯属虚构',
                	        x:'center'
                	    },
                	    tooltip : {
                	        trigger: 'item',
                	        formatter: "{a} <br/>{b} : {c} ({d}%)"
                	    },
                	    legend: {
                	        orient : 'vertical',
                	        x : 'left',
                	        data:[]
                	    },
                	    toolbox: {
                	        show : true,
                	        feature : {
                	            mark : {show: true},
                	            dataView : {show: true, readOnly: false},
                	            magicType : {
                	                show: true, 
                	                type: ['pie', 'funnel'],
                	                option: {
                	                    funnel: {
                	                        x: '25%',
                	                        width: '50%',
                	                        funnelAlign: 'left',
                	                        max: 1548
                	                    }
                	                }
                	            },
                	            restore : {show: true},
                	            saveAsImage : {show: true}
                	        }
                	    },
                	    calculable : true,
                	    series : [
                	        {
                	            name:'部门信息',
                	            type:'pie',
                	            radius : '55%',
                	            center: ['50%', '60%'],
                	            data:[]
                	        }
                	    ]
                	};
		 
		myChart.showLoading();	//数据加载完之前先显示一段简单的loading动画
		 
		 var title1=[];	//风速数组
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
	                	  title1.push(result.extend.depts[i].deptName)	//挨个取出温度、湿度、压强等值并填入前面声明的温度、湿度、压强等数组
      	                   data.push({
      	                	   value:result.extend.depts[i].deptNum,
      	                	   name:result.extend.depts[i].deptName
      	                	  });
	                 
	                }
	                myChart.hideLoading();	//隐藏加载动画
	                myChart.setOption({		//载入数据
   	                	legend: {
   	   		             data: title1	//填入X轴数据
   	   		         },
   	   		         series:[{
   			   		             data: data
   	   		         		}]
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