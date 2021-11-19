<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<meta charset="utf-8">
<title>个人体检管理</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Access-Control-Allow-Origin" content="*">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<%--<link rel="icon" href="favicon.ico">--%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/layui/css/layui.css"
	media="all" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/public.css" media="all" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/layui_ext/dtree/dtree.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/layui_ext/dtree/font/dtreefont.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/checkknowledge.css" media="all" />
</head>
<body class="childrenBody">

	<!-- 搜索条件开始 -->
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 20px;">
		<legend>查询条件</legend>
	</fieldset>
	<form class="layui-form" method="post" id="searchFrm">

		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">标题:</label>
				<div class="layui-input-inline" style="padding: 5px">
					<input type="text" name="title" autocomplete="off"
						class="layui-input layui-input-inline" placeholder="请输入标题"
						style="height: 30px; border-radius: 10px">
				</div>
			</div>
			<div class="layui-inline">
				<button type="button"
					class="layui-btn layui-btn-normal layui-icon layui-icon-search layui-btn-radius layui-btn-sm"
					id="doSearch" style="margin-top: 4px">查询</button>
				<button type="reset"
					class="layui-btn layui-btn-warm layui-icon layui-icon-refresh layui-btn-radius layui-btn-sm"
					style="margin-top: 4px">重置</button>
			</div>
		</div>

	</form>

	<!-- 数据表格开始 -->
	<table class="layui-hide" id="checkkonwledgeTable"
		lay-filter="checkkonwledgeTable"></table>
	<div id="checkkonwledgeBar" style="display: none;">
		<a class="layui-btn layui-btn-xs layui-btn-radius" lay-event="view">查看</a>
	</div>

	<!-- 查看的弹出层-->
	<div style="display: none; padding: 20px" id="viewDiv">
		<h1 class="title tac" id="titleId"></h1>
		<div class="tac">
			<span class="time" id="timeId">2020-03-23 17:19:36</span>
		</div>
		<hr />
		<p id="contentId"></p>
		
	</div>

	<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
	<script type="text/javascript">
		var tableIns;
		layui
				.extend(
						{
							dtree : '${pageContext.request.contextPath}/layui_ext/dist/dtree',
							selectN : '${pageContext.request.contextPath}/layui_extends/selectN',
							selectM : '${pageContext.request.contextPath}/layui_extends/selectM',
						})
				.use(
						[ 'jquery', 'layer', 'form', 'table', 'dtree',
								'selectN', 'selectM', 'laydate' ],
						function() {
							var $ = layui.jquery;
							var layer = layui.layer;
							var form = layui.form;
							var table = layui.table;
							var dtree = layui.dtree;
							var selectN = layui.selectN
							var selectM = layui.selectM;
							var laydate = layui.laydate;
							//渲染时间
							laydate.render({
								elem : '#birthday',
								type : 'date',
								trigger : 'click'
							});
							laydate.render({
								elem : '#odatetime',
								type : 'date',
								trigger : 'click'
							});

							//渲染数据表格
							tableIns = table
									.render({
										elem : '#checkkonwledgeTable' //渲染的目标对象
										,
										url : '/examination/checkknowledge/loadAllCheckKnowledge.action' //数据接口
										,
										title : '用户数据表'//数据导出来的标题
										,
										toolbar : "#checkkonwledgeToolBar" //表格的工具条
										,
										height : 'full-210',
										cellMinWidth : 100 //设置列的最小默认宽度
										,
										page : true //是否启用分页
										,
										cols : [ [ //列表数据
										{
											field : 'id',
											title : '编号',
											align : 'center',
											width : '100'
										}, {
											field : 'title',
											title : '标题',
											align : 'center',
											width : '300'
										}, {
											field : 'addtime',
											title : '发布日期',
											align : 'center',
											width : '120'
										}, {
											fixed : 'right',
											title : '操作',
											toolbar : '#checkkonwledgeBar',
											align : 'center',
											width : '350'
										}

										] ],
										done : function(data, curr, count) {
											//不是第一页时，如果当前返回的数据为0那么就返回上一页
											if (data.data.length == 0
													&& curr != 1) {
												tableIns.reload({
													page : {
														curr : curr - 1
													}
												})
											}
										}
									})

							var resultData;
							var tagIns2;

							var htmls = '<option value="">请选择</option>'; //全局变量
							$
									.ajax({
										url : '/examination/checkknowledge/loadAllCheckKnowledge.action',
										type : "post",
										dataType : "json",
										contentType : "application/json",
										async : false,//这得注意是同步
										success : function(result) {
											resultData = result.data;

										}
									});
							// 		form.render('select');
							var resultData1;

							var htmls = '<option value="">请选择</option>'; //全局变量
							$
									.ajax({
										url : '/examination/package/loadAllPackage.action',
										type : "post",
										dataType : "json",
										contentType : "application/json",
										async : false,//这得注意是同步
										success : function(result) {
											resultData = result.data;
											console.log(result);
											for ( var x in resultData) {
												htmls += '<option value = "' + resultData[x].id + '">'
														+ resultData[x].packagename
														+ '</option>'
											}
											$("#packageid").html(htmls);
										}
									});
							form.render('select');

							//模糊查询
							$("#doSearch")
									.click(
											function() {
												var params = $("#searchFrm")
														.serialize();
												//alert(params);
												tableIns
														.reload({
															url : "/examination/checkknowledge/loadAllCheckKnowledge.action?"
																	+ params,
															page : {
																curr : 1
															}
														})
											});


							//监听行工具事件
							table.on('tool(checkkonwledgeTable)',function(obj) {
								var data = obj.data; //获得当前行数据
								var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
								if (layEvent === 'view') { //查看
									//编辑，打开修改界面
									openViewKnowledge(data);
								}
							});

							var url;
							var mainIndex;

				

							//打开修改页面
							function openViewKnowledge(data) {
								mainIndex = layer.open({
									type : 1,
									title : '查看体检小知识',
									content : $("#viewDiv"),
									area : [ '600px', '700px' ],
									success : function(index) {
										$("#titleId").html("");
										$("#titleId").html(data.title);
										$("#timeId").html("");
										$("#timeId").html(data.addtime);
										$("#contentId").html("");
										$("#contentId").html(data.context);
									}
								});
							}
						});
	</script>
</body>
</html>
