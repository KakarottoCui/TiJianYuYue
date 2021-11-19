<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<meta charset="utf-8">
<title>体检项目管理</title>
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
</head>
<body class="childrenBody">

	<!-- 搜索条件开始 -->
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 20px;">
		<legend>查询条件</legend>
	</fieldset>
	<!-- 数据表格开始 -->
	<table class="layui-hide" id="userTable" lay-filter="userTable"></table>
	<div id="userToolBar" style="display: none;">
		<button type="button" class="layui-btn layui-btn-sm layui-btn-radius"
			lay-event="add">增加</button>
	</div>
	<div id="userBar" style="display: none;">
		<a class="layui-btn layui-btn-xs layui-btn-radius" lay-event="edit">体检明细</a>
		<!-- 		<a class="layui-btn layui-btn-danger layui-btn-xs layui-btn-radius" -->
		<!-- 			lay-event="del">不通过</a> -->
	</div>

	<!-- 添加和修改的弹出层-->
	<div style="display: none; padding: 20px" id="saveOrUpdateDiv">
		<form class="layui-form" lay-filter="dataFrm" id="dataFrm">
			<table class="layui-table" id="orderDetailTable">
				<colgroup>
					<col width="200">
					<col width="200">
					<col width="200">
					<col width="200">
					<col>
				</colgroup>
				<tbody>
				</tbody>
			</table>

			<div class="layui-form-item">
				<div class="layui-input-block"
					style="text-align: center; padding-right: 120px">
					<button type="button"
						class="layui-btn layui-btn-normal layui-btn-md layui-icon layui-icon-release layui-btn-radius"
						lay-filter="doSubmit" lay-submit="">提交</button>
					<button type="button" class="layui-btn" id="upload">
						<i class="layui-icon">&#xe67c;</i>上传报告
					</button>
					<button type="button" class="layui-btn layui-btn-normal"
						id="choose">选择文件</button>
				</div>
			</div>
		</form>
	</div>

	<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
	<script type="text/javascript">
		var tableIns;
		layui
				.extend(
						{
							dtree : '${pageContext.request.contextPath}/layui_ext/dist/dtree'
						})
				.use(
						[ 'jquery', 'layer', 'form', 'table', 'dtree' ],
						function() {
							var $ = layui.jquery;
							var layer = layui.layer;
							var form = layui.form;
							var table = layui.table;
							var dtree = layui.dtree;
							//渲染数据表格
							tableIns = table
									.render({
										elem : '#userTable' //渲染的目标对象
										,
										url : '/examination/order1/loadAllOrder1ForDoctor.action' //数据接口
										,
										title : '个人体检预约表'//数据导出来的标题
										//             , toolbar: "#userToolBar"   //表格的工具条
										,
										height : 'full-210',
										cellMinWidth : 100 //设置列的最小默认宽度
										,
										page : true //是否启用分页
										,
										cols : [ [ //列表数据
												{
													field : 'oid',
													title : 'ID',
													align : 'center',
													width : '100'
												},
												{
													field : 'uname',
													title : '姓名',
													align : 'center',
													width : '150'
												},
												{
													field : 'usex',
													title : '性别',
													align : 'center',
													width : '150',
													templet : function(d) {
														if (d.usex == "1") {
															return '<font>男</font>';
														} else if (d.usex == "0") {
															return '<font>女</font>';
														} else {
															return '';
														}
													}
												},
												{
													field : 'uphone',
													title : '电话',
													align : 'center',
													width : '150'
												},
												{
													field : 'birthday',
													title : '出生日期',
													align : 'center',
													width : '150'
												},
												{
													field : 'odatetime',
													title : '体检日期',
													align : 'center',
													width : '150'
												},
												{
													field : 'pname',
													title : '体检项目',
													align : 'center',
													width : '150',
													templet : function(d) {
														var dd = JSON
																.parse(d.pid);
														var htm = "";
														if (dd != null
																&& dd.length > 0) {
															for (var i = 0; i < dd.length; i++) {
																if (i == dd.length - 1) {
																	htm += dd[i].pname;
																} else {
																	htm += dd[i].pname
																			+ ";";
																}
															}
														}
														return htm;
													}
												},
												{
													field : 'packagename',
													title : '体检套餐',
													align : 'center',
													width : '150'
												},
												{
													field : 'status',
													title : '状态',
													align : 'center',
													width : '150',
													templet : function(d) {
														if (d.status == "0") {
															return '预约待审核';
														} else if (d.status == "-1") {
															return '预约未通过';
														} else if (d.status == "1") {
															return '预约通过';
														} else {
															return '';
														}
													}
												}, {
													fixed : 'right',
													title : '操作',
													toolbar : '#userBar',
													align : 'center',
													width : '300'
												} ] ],
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

							//模糊查询
							$("#doSearch")
									.click(
											function() {
												var params = $("#searchFrm")
														.serialize();
												//alert(params);
												tableIns
														.reload({
															url : "/examination/order1/loadAllProject.action?"
																	+ params,
															page : {
																curr : 1
															}
														})
											});

							//监听头部工具栏事件
							table.on("toolbar(userTable)", function(obj) {
								switch (obj.event) {
								case 'add':
									openAddUser();
									break;
								case 'deleteBatch':
									deleteBatch();
									break;
								}
							});

							//监听行工具事件
							table.on('tool(userTable)', function(obj) {
								var data = obj.data; //获得当前行数据
								var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
								if (layEvent === 'del') { //删除
									forbidOrder1(data);
								} else if (layEvent === 'edit') { //编辑
									//通过个人体检预约申请
									orderDetail(data);
								} else if (layEvent === 'selectUserRole') {//分配权限
									openselectUserRole(data);
								}
							});

							var url;
							var mainIndex;
							//查看个人的体检明细
							function orderDetail(data) {
								var oid = data.oid;
								$
										.ajax({
											url : '/examination/result/queryResult.action',
											type : "post",
											dataType : "json",
											async : false,//这得注意是同步
											data : {
												oid : oid
											},
											success : function(result) {
												if (result) {
													var rr = result.data[0];
													mainIndex = layer
															.open({
																type : 1,
																title : '体检明细',
																content : $("#saveOrUpdateDiv"),
																area : [
																		'800px',
																		'500px' ],
																success : function() {
																	//清空表单数据
																	$("#dataFrm")[0]
																			.reset();
																	url = "/examination/result/updateProjectResult.action";
																	var tttr = createTable(rr);
																	$(
																			"#orderDetailTable tbody")
																			.html(
																					tttr);
																}
															});
												}
											}
										});

							}
							var ids = [];//所有项目的id集合
							function createTable(data) {
								var projectStr = "";
								var jsonObj = JSON.parse(data.projectresult);
								ids = jsonObj;
								if (jsonObj != null && jsonObj.length > 0) {
									for (var i = 0; i < jsonObj.length; i++) {
										var o = jsonObj[i];
										// 					ids.push(o.pid + o.pname);
										projectStr += '<tr>'
												+ '<td>'
												+ o.pname
												+ '</td>'
												+ '<td colspan="3" style="padding: 0 0"><input type="text" id="'
												+ o.pid
												+ o.pname
												+ '"   value="'
												+ (o.result == undefined ? ""
														: o.result)
												+ '" style="height:35px;width:100%;" /></td>'
												+ '</tr>';
									}
								}

								var reportStr = '<td colspan="3" style="padding: 0 0">暂无报告</td>';
								if (data.fileId != null) {
									reportStr = '<td colspan="3" style="padding: 0 0"><button type="button" class="layui-btn  layui-btn-xs" onclick="download('
											+ data.oid
											+ ')">报告下载</button></td>';
								}

								var usex = "男";
								if (data.usex == "0") {
									usex = "女";
								} else if (data.usex == "1") {
									usex = "男";
								}
								var html = '<tr>'
										+ '<td>姓名:</td>'
										+ '<td  style="padding: 0 0"><input type="text" id="uname"  readonly="readonly" value="'
										+ data.uname
										+ '" style="height:35px;width:100%;" /></td>'
										+ '<td>就诊号:</td>'
										+ '<td style="padding: 0 0"><input type="text"  id="oid" readonly="readonly" value="'
										+ data.oid
										+ '" style="height:35px;width:100%;" /></td>'
										+ '</tr>'
										+ '<tr>'
										+ '<td>性别</td>'
										+ '<td colspan="3" style="padding: 0 0"><input id="usex" type="text"  readonly="readonly" value="'
										+ usex
										+ '" style="height:35px;width:100%;" /></td>'
										+ '</tr>'

										+ projectStr
										// 		        + '<tr>'
										// 		        + '<td colspan="4">体检项目</td>'
										// 		        + '</tr>'
										// 		        + '<tr>'
										// 		        + '<td>身高</td>'
										// 		        + '<td colspan="3" style="padding: 0 0"><input type="text" name="uname"  value="" style="height:35px;width:100%;" /></td>'
										// 		        + '</tr>'
										// 		        + '<tr>'
										// 		        + '<td>体重</td>'
										// 		        + '<td colspan="3" style="padding: 0 0"><input type="text" name="uname"  value="" style="height:35px;width:100%;" /></td>'
										// 		        + '</tr>'
										// 		        + '<tr>'
										// 		        + '<td>血压</td>'
										// 		        + '<td colspan="3" style="padding: 0 0"><input type="text" name="uname"  value="" style="height:35px;width:100%;" /></td>'
										// 		        + '</tr>'
										+ '<tr>'
										+ '<td>总结</td>'
										+ '<td colspan="3" style="padding: 0 0"><input type="text" id="finalResult"  value="'+(data.finalresult==null?'':data.finalresult)+'" style="height:35px;width:100%;" /></td>'
										+ '</tr>'
										+ '<tr>'
										+ '<td>医生签字</td>'
										+ '<td colspan="3" style="padding: 0 0"><input type="text" id="doctor"  value="'+(data.doctor==null?'':data.doctor)+'" style="height:35px;width:100%;" /></td>'
										+ '</tr>'
										+ '<td>报告下载</td>'
										+ reportStr
										+ '</tr>';
								return html;
							}
							//保存
							form.on("submit(doSubmit)", function(obj) {
								//序列化表单数据
								//				var params = $("#dataFrm").serialize();
								var uname = $('#uname').val();
								var oid = $('#oid').val();
								var usex = $('#usex').val();

								if (ids.length > 0) {
									for (var i = 0; i < ids.length; i++) {
										var idss = ids[i];
										var key = idss.pid + idss.pname;
										var keyv = $('#' + key).val();
										idss.result = keyv;
									}
								}
								var projectResult = JSON.stringify(ids);
								var finalResult = $('#finalResult').val();
								var doctor = $('#doctor').val();
								var params = {
									uname : uname,
									oid : oid,
									usex : usex,
									projectresult : projectResult,
									finalresult : finalResult,
									doctor : doctor
								};
								$.post(url, params, function(obj) {
									layer.msg(obj.msg);
									//关闭弹出层
									layer.close(mainIndex)
									//刷新数据 表格
									tableIns.reload();
								})
							});

						});

		layui.use('upload', function() {
			var upload = layui.upload;
			var $ = layui.jquery;
			//获取要提交的表单的数据
// 			var oid = $('#oid').val();
			//执行实例
			var uploadInst = upload.render({
				elem : '#choose', //绑定元素
				url : '/examination/result/uploadFile.action', //上传接口
				auto : false,
				accept : 'file',
				data: {oid: function (){
					return $('#oid').val();
				}},
				bindAction : '#upload',
				done : function(res) {
					//上传完毕回调
					layui.use('layer', function() {
						var layer = layui.layer;
						layer.msg(res.url, {
							time : 3000, //3s后自动关闭
							icon : 1
						});
						//关闭弹出层
						layer.close(mainIndex);
						//刷新数据 表格
						tableIns.reload();
					});
				},
				error : function() {
					//请求异常回调
					layer.msg("报告上传失败");
				}
			});
		});
		

		function download(id) {
			var link = document.createElement('a');
			link.href = "/examination/result/downloadFile.action?id=" + id;
			link.click();
		}
	</script>
</body>
</html>
