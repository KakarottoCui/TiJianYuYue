<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="utf-8">
	<title>个人资料</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css" media="all" />
</head>
<body class="childrenBody">
<form class="layui-form layui-row" lay-filter="dataFrm" id="dataFrm">
	<div class="layui-col-md12 layui-col-xs12">
		<div id="mychart1" style="width:1600px;height: 800px;"></div>
	</div>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/page/user/userInfo.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/cacheUserInfo.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/echarts/js/echarts.min.js"></script>
<script type="text/javascript">
    var tableIns;
    layui.extend({
//         echarts: '${pageContext.request.contextPath}/echarts/js/echarts.min'
    }).use(['jquery', 'layer', 'form', 'table'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
		var dias = [];
		var maleData = [];
		var femaleData = [];
		
		//向后台发送请求
		$.post("/examination/result/queryAnalyseResult.action", {}, function (res) {
			var re = res.data;
			dias = re.xAxis;
			maleData = re.male;
			femaleData = re.female;
			var myCharts3 = echarts.init(document.getElementById('mychart1')); 
	        myCharts3.setOption({
	        	 title: {
	        	        text: '男女患病比例'
	        	    },
	        	    tooltip: {
	        	        trigger: 'axis'
	        	    },
	        	    legend: {
	        	        data: ['男', '女']
	        	    },
	        	    grid: {
	        	        left: '3%',
	        	        right: '4%',
	        	        bottom: '3%',
	        	        containLabel: true
	        	    },
	        	    toolbox: {
	        	        feature: {
	        	            saveAsImage: {}
	        	        }
	        	    },
	        	    xAxis: {
	        	        boundaryGap: true,
	        	        data: dias
	        	    },
	        	    yAxis: {
	        	        type: 'value'
	        	    },
	        	    series: [
	        	        {
	        	            name: '男',
	        	            type: 'bar',
	        	            data: maleData
	        	        },
	        	        {
	        	            name: '女',
	        	            type: 'bar',
	        	            data: femaleData
	        	        }
	        	    ]
	        	
	        });
			
        })
		
		
        
 
        


    });

</script>
</body>
</html>