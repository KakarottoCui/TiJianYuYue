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
	<form class="layui-form" method="post" id="searchFrm">

		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">项目编号:</label>
				<div class="layui-input-inline" style="padding: 5px">
					<input type="text" name="pid" autocomplete="off"
						class="layui-input layui-input-inline" placeholder="请输入用户名称"
						style="height: 30px; border-radius: 10px">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">项目名称:</label>
				<div class="layui-input-inline" style="padding: 5px">
					<input type="text" name="pname" autocomplete="off"
						class="layui-input layui-input-inline" placeholder="请输入用户登陆账号"
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
	<table class="layui-hide" id="userTable" lay-filter="userTable"></table>
	<div id="userToolBar" style="display: none;">
		<button type="button" class="layui-btn layui-btn-sm layui-btn-radius"
			lay-event="add">增加</button>
	</div>
	<div id="userBar" style="display: none;">
		<a class="layui-btn layui-btn-xs layui-btn-radius" lay-event="edit">编辑</a>
		<a class="layui-btn layui-btn-danger layui-btn-xs layui-btn-radius"
			lay-event="del">删除</a>
	</div>

	<!-- 添加和修改的弹出层-->
	<div style="display: none; padding: 20px" id="saveOrUpdateDiv">
		<form class="layui-form" lay-filter="dataFrm" id="dataFrm">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">项目编号:</label>
					<div class="layui-input-inline">
						<input type="hidden" name="userid"> <input type="text"
							name="pid" lay-verify="required" placeholder="请输入项目编号"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">项目名称:</label>
					<div class="layui-input-inline">
						<input type="text" name="pname" lay-verify="required"
							placeholder="请输入项目名称" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">项目类型:</label>
					<div class="layui-input-inline">
						<select name="ptype" lay-verify="required">
							<option value=""></option>
							<option value="1">彩超</option>
							<option value="2">影像检查</option>
							<option value="3">基本检查</option>
							<option value="4">检验</option>
						</select>
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">适用性别:</label>
					<div class="layui-input-inline">
						<input type="radio" name="psex" value="0" checked="checked"
							title="通用"><input type="radio" name="dsex" value="1"
							title="男"> <input type="radio" name="dsex" value="2"
							title="女">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">所属科室:</label>
					<div class="layui-input-inline">
						<select id="department" name="department" lay-verify="required">
						</select>
					</div>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-input-block"
					style="text-align: center; padding-right: 120px">
					<button type="button"
						class="layui-btn layui-btn-normal layui-btn-md layui-icon layui-icon-release layui-btn-radius"
						lay-filter="doSubmit" lay-submit="">提交</button>
					<button type="reset"
						class="layui-btn layui-btn-warm layui-btn-md layui-icon layui-icon-refresh layui-btn-radius">重置
					</button>
				</div>
			</div>
		</form>
	</div>

	<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
	<script type="text/javascript">
    var tableIns;
    layui.extend({
        dtree: '${pageContext.request.contextPath}/layui_ext/dist/dtree'
    }).use(['jquery', 'layer', 'form', 'table', 'dtree'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;
        var dtree = layui.dtree;
        //渲染数据表格
        tableIns = table.render({
            elem: '#userTable'   //渲染的目标对象
            , url: '/examination/project/loadAllProject.action' //数据接口
            , title: '用户数据表'//数据导出来的标题
            , toolbar: "#userToolBar"   //表格的工具条
            , height: 'full-210'
            , cellMinWidth: 100 //设置列的最小默认宽度
            , page: true  //是否启用分页
            , cols: [[   //列表数据
                {field: 'pid', title: 'ID', align: 'center',width:'100'}
                , {field: 'pname', title: '项目名称', align: 'center',width:'150'}
                , {field: 'ptype', title: '项目类别', align: 'center',width:'150',templet: function (d) {
                	if (d.ptype == "1") {
                		return '<font>彩超</font>';
                	}else if (d.ptype == "2") {
                		return '<font>影像检查</font>';
                	}else if (d.ptype == "3") {
                		return '<font>基本检查</font>';
                	}else if (d.ptype == "4") {
                		return '<font>检验</font>';
                	}else {
                		return '';
                	}
                }}
                , {field: 'psex', title: '适用性别', align: 'center', width:'120',templet: function (d) {
                        return d.psex == '1' ? '<font color=blue>男</font>' : d.psex == '0' ? '<font color=green>通用</font>' : '<font color=red>女</font>';
                    }}
                , {field: 'departmentname', title: '所属科室', align: 'center',width:'150'}
                , {fixed: 'right', title: '操作', toolbar: '#userBar', align: 'center',width:'300'}
            ]],
            done:function (data, curr, count) {
                //不是第一页时，如果当前返回的数据为0那么就返回上一页
                if(data.data.length==0&&curr!=1){
                    tableIns.reload({
                        page:{
                            curr:curr-1
                        }
                    })
                }
            }
        })
        
       
	
		var resultData;

		var htmls = '<option value="">请选择</option>'; //全局变量
		$.ajax({
			url : '/examination/user/loadAllDepartment.action',
			type : "post",
			dataType : "json",
			contentType : "application/json",
			async : false,//这得注意是同步
			success : function(result) {
				resultData = result.data;
				console.log(result);
				for ( var x in resultData) {
					htmls += '<option value = "' + resultData[x].id + '">'
							+ resultData[x].name
							+ '</option>'
				}
				$("#department").html(htmls);
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
														url : "/examination/project/loadAllProject.action?"
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
						table
								.on(
										'tool(userTable)',
										function(obj) {
											var data = obj.data; //获得当前行数据
											var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
											if (layEvent === 'del') { //删除
												layer
														.confirm(
																'真的删除【'
																		+ data.pname
																		+ '】这个体检项目么？',
																function(index) {
																	//向服务端发送删除指令
																	$
																			.post(
																					"/examination/project/deleteProject.action",
																					{
																						pid : data.pid
																					},
																					function(
																							res) {
																						layer
																								.msg(res.msg);
																						//刷新数据表格
																						tableIns
																								.reload();
																					})
																});
											} else if (layEvent === 'edit') { //编辑
												//编辑，打开修改界面
												openUpdateUser(data);
											} else if (layEvent === 'selectUserRole') {//分配权限
												openselectUserRole(data);
											}
										});

						var url;
						var mainIndex;

						//打开添加页面
						function openAddUser() {
							mainIndex = layer
									.open({
										type : 1,
										title : '添加体检项目',
										content : $("#saveOrUpdateDiv"),
										area : [ '750px', '480px' ],
										success : function(index) {
											//清空表单数据
											$("#dataFrm")[0].reset();
											url = "/examination/project/addProject.action";
										}
									});
						}

						//打开修改页面
						function openUpdateUser(data) {
							mainIndex = layer
									.open({
										type : 1,
										title : '修改医生信息',
										content : $("#saveOrUpdateDiv"),
										area : [ '750px', '380px' ],
										success : function(index) {
											form.val("dataFrm", data);
											url = "/examination/project/updateProject.action";
										}
									});
						}

						//保存
						form.on("submit(doSubmit)", function(obj) {
							//序列化表单数据
							var params = $("#dataFrm").serialize();
							$.post(url, params, function(obj) {
								layer.msg(obj.msg);
								//关闭弹出层
								layer.close(mainIndex)
								//刷新数据 表格
								tableIns.reload();
							})
						});

					});
</script>
</body>
</html>
