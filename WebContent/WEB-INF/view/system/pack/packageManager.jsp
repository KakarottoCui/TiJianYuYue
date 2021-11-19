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
				<label class="layui-form-label">套餐编号:</label>
				<div class="layui-input-inline" style="padding: 5px">
					<input type="text" name="id" autocomplete="off"
						class="layui-input layui-input-inline" placeholder="请输入用户名称"
						style="height: 30px; border-radius: 10px">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">套餐名称:</label>
				<div class="layui-input-inline" style="padding: 5px">
					<input type="text" name="packagename" autocomplete="off"
						class="layui-input layui-input-inline" placeholder="请输入套餐名称"
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
					<label class="layui-form-label">套餐编号:</label>
					<div class="layui-input-inline">
						<input type="hidden" name="userid"> <input id="packageid" type="text"
							name="id" lay-verify="required" placeholder="请输入套餐编号"
							autocomplete="off" class="layui-input">
					</div>
				</div>
				<div class="layui-inline">
					<label class="layui-form-label">套餐名称:</label>
					<div class="layui-input-inline">
						<input type="text" id="packagename" name="packagename" lay-verify="required"
							placeholder="请输入套餐名称" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
<!-- 				<div class="layui-inline"> -->
<!-- 					<label class="layui-form-label">项目编号:</label> -->
<!-- 					<div class="layui-input-inline"> -->
<!-- 						<select multiple id="department" name="pid" lay-verify="required"> -->
<!-- 						</select> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<div class="layui-inline">
					<label class="layui-form-label">项目编号:</label>
					<div class="layui-input-inline">
						<div class="layui-input-inline" id="tag_ids2">
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
        dtree: '${pageContext.request.contextPath}/layui_ext/dist/dtree',
       	selectN: '${pageContext.request.contextPath}/layui_extends/selectN',
        selectM: '${pageContext.request.contextPath}/layui_extends/selectM',
    }).use(['jquery', 'layer', 'form', 'table', 'dtree', 'selectN','selectM'], function () {
        var $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;
        var table = layui.table;
        var dtree = layui.dtree;
        var selectN = layui.selectN
        var selectM = layui.selectM;
        
     
        //渲染数据表格
        tableIns = table.render({
            elem: '#userTable'   //渲染的目标对象
            , url: '/examination/package/loadAllPackage.action' //数据接口
            , title: '用户数据表'//数据导出来的标题
            , toolbar: "#userToolBar"   //表格的工具条
            , height: 'full-210'
            , cellMinWidth: 100 //设置列的最小默认宽度
            , page: true  //是否启用分页
            , cols: [[   //列表数据
                {field: 'id', title: 'ID', align: 'center',width:'100'}
                , {field: 'packagename', title: '套餐名称', align: 'center',width:'150'}
                , {field: 'pname', title: '项目名称', align: 'center',width:'150',templet: function (d) {
                	var dd = JSON.parse(d.pid);
                	var htm = "";
                	if (dd != null && dd.length > 0) {
                		for (var i = 0; i < dd.length; i ++) {
                			if (i == dd.length - 1) {
                				htm += dd[i].pname;
                			}else {
                				htm += dd[i].pname + ";";
                			}
                		}
                	}
                	return htm;
//                 	if (d.ptype == "1") {
//                 		return '<font>彩超</font>';
//                 	}else if (d.ptype == "2") {
//                 		return '<font>影像检查</font>';
//                 	}else if (d.ptype == "3") {
//                 		return '<font>基本检查</font>';
//                 	}else if (d.ptype == "4") {
//                 		return '<font>检验</font>';
//                 	}else {
//                 		return '';
//                 	}
                }}
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
        var tagIns2;

		var htmls = '<option value="">请选择</option>'; //全局变量
		$.ajax({
			url : '/examination/project/loadAllProject.action',
			type : "post",
			dataType : "json",
			contentType : "application/json",
			async : false,//这得注意是同步
			success : function(result) {
				resultData = result.data;
				 //多选标签-所有配置
		        tagIns2 = selectM({
		          //元素容器【必填】
		          elem: '#tag_ids2'
		          
		          //候选数据【必填】
		          ,data: resultData
		          
		          //默认值
		          ,selected: [] 			
		          
		          //最多选中个数，默认5
		    			,max : 10
		          
		    			//input的name 不设置与选择器相同(去#.)
		    			,name: 'tag2'
		    			
		    			//值的分隔符
		    			,delimiter: ','
		          
		    			//候选项数据的键名
		    			,field: {idName:'pid',titleName:'pname'}
		          
		          
		        });
				
// 				for ( var x in resultData) {
// 					htmls += '<option value = "' + resultData[x].pid + '">'
// 							+ resultData[x].pname
// 							+ '</option>'
// 				}
// 				$("#department").html(htmls);
			}
		});
// 		form.render('select');

						//模糊查询
						$("#doSearch")
								.click(
										function() {
											var params = $("#searchFrm")
													.serialize();
											//alert(params);
											tableIns
													.reload({
														url : "/examination/package/loadAllPackage.action?"
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
																		+ data.packagename
																		+ '】这个套餐么？',
																function(index) {
																	//向服务端发送删除指令
																	$
																			.post(
																					"/examination/package/deletePackage.action",
																					{
																						id : data.id
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
										title : '添加套餐',
										content : $("#saveOrUpdateDiv"),
										area : [ '750px', '480px' ],
										success : function(index) {
											//清空表单数据
											$("#dataFrm")[0].reset();
											url = "/examination/package/addPackage.action";
										}
									});
						}

						//打开修改页面
						function openUpdateUser(data) {
							mainIndex = layer
									.open({
										type : 1,
										title : '修改套餐',
										content : $("#saveOrUpdateDiv"),
										area : [ '750px', '380px' ],
										success : function(index) {
											form.val("dataFrm", data);
// 											$('#packageid').val(data.id);
// 											$('#packagename').val(data.packagename);
// 											var df = JSON.parse(data.pid);
// 											if (df != null && df.length > 0) {
// 												for (var i  = 0; i < df.length; i ++ ) {
// 													tagIns2.selected.push(df[i].pid);
// 												}
// 											}
// 											console.log($('#tag_ids2'));
// 											console.log(JSON.stringify(tagIns2.selected));
											url = "/examination/package/updatePackage.action";
										}
									});
						}

						//保存
						form.on("submit(doSubmit)", function(obj) {
							//序列化表单数据
// 							var params = $("#dataFrm").serialize();
							var params = {
								id: $('#packageid').val(),
								packagename: $('#packagename').val(),
								pid: JSON.stringify(tagIns2.selected),
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
</script>
</body>
</html>
