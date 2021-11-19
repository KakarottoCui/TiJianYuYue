<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<meta charset="utf-8">
<title>团队体检管理</title>
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
				<label class="layui-form-label">编号:</label>
				<div class="layui-input-inline" style="padding: 5px">
					<input type="text" name="id" autocomplete="off"
						class="layui-input layui-input-inline" placeholder="请输入编号"
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
		<a class="layui-btn layui-btn-xs layui-btn-radius" lay-event="checkDetail">体检明细</a>
	</div>
	
	<!-- 体检明细的弹出层-->
	<div style="display: none; padding: 20px" id="checkDetailDiv">
		<form class="layui-form" lay-filter="dataFrm" id="dataFrm">
			<table class="layui-table" id="orderDetailTable">
				
			</table>

		</form>
	</div>

	<!-- 添加和修改的弹出层-->
	<div style="display: none; padding: 20px" id="saveOrUpdateDiv">
		<form class="layui-form" lay-filter="dataFrm" id="dataFrm">
			<div class="layui-form-item">
<!-- 				<div class="layui-inline"> -->
<!-- 					<label class="layui-form-label">编号:</label> -->
<!-- 					<div class="layui-input-inline"> -->
<!-- 						<input type="hidden" name="userid"> <input id="order1id" type="text" -->
<!-- 							name="oid" lay-verify="required" placeholder="请输入编号" -->
<!-- 							autocomplete="off" class="layui-input"> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<div class="layui-inline">
					<label class="layui-form-label">账号:</label>
					<div class="layui-input-inline">
						<input type="text" id="order1name" name="uname" lay-verify="required"
							placeholder="请输入体检人员账号，用：分割" autocomplete="off" class="layui-input">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">体检套餐:</label>
					<div class="layui-input-inline">
						<select id="packageid" name="id" >
						</select>
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">体检时间:</label>
					<div class="layui-input-inline">
						<input type="text" name="odatetime" id="odatetime" readonly="readonly"
                       class="layui-input layui-input-inline" lay-verify="required"
                       placeholder="yyyy-MM-dd" style="height: 30px;border-radius: 10px">
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">体检项目:</label>
					<div class="layui-input-inline">
						<div class="layui-input-inline" id="tag_ids2"></div>
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
    }).use(['jquery', 'layer', 'form', 'table', 'dtree', 'selectN','selectM', 'laydate'], function () {
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
            elem: '#birthday',
            type: 'date',
            trigger: 'click'
        });
        laydate.render({
            elem: '#odatetime',
            type: 'date',
            trigger: 'click'
        });
        
     
        //渲染数据表格
        tableIns = table.render({
            elem: '#userTable'   //渲染的目标对象
            , url: '/examination/order1/loadAllOrderForUser.action' //数据接口
            , title: '用户数据表'//数据导出来的标题
            , toolbar: "#userToolBar"   //表格的工具条
            , height: 'full-210'
            , cellMinWidth: 100 //设置列的最小默认宽度
            , page: true  //是否启用分页
            , cols: [[   //列表数据
                {field: 'oid', title: '编号', align: 'center',width:'100'}
                , {field: 'uname', title: '姓名', align: 'center',width:'100'}
                , {field: 'usex', title: '性别', align: 'center',width:'80',templet: function (d) {
                	 return d.usex == '1' ? '<font color=blue>男</font>' : '<font color=red>女</font>';
                }}
                , {field: 'uphone', title: '电话号码', align: 'center',width:'100'}
                , {field: 'birthday', title: '出生日期',  align: 'center',width:'120'}
                , {field: 'odatetime', title: '体检日期',  align: 'center',width:'120'}
                , {field: 'type', title: '预约类型',  align: 'center',width:'120'}
                , {field: 'adduser', title: '预约人',  align: 'center',width:'120'}
                , {field: 'addtime', title: '预约日期',  align: 'center',width:'180'}
                , {field: 'pid', title: '体检项目', align: 'center',width:'200',templet: function (d) {
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
                }}
                , {field: 'packagename', title: '体检套餐', align: 'center',width:'150'}
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
			}
		});
// 		form.render('select');
		var resultData1;

		var htmls = '<option value="">请选择</option>'; //全局变量
		$.ajax({
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
														url : "/examination/order1/loadAllOrderForUser.action?"
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
																		+ data.uname
																		+ '】这个体检预约信息么？',
																function(index) {
																	//向服务端发送删除指令
																	$
																			.post(
																					"/examination/order1/deleteOrder1.action",
																					{
																						oid : data.oid
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
											}else if (layEvent === 'checkDetail') {//体检明细
												openCheckDetail(data);
											}
										});

						var url;
						var mainIndex;

						//打开添加页面
						function openAddUser() {
							mainIndex = layer
									.open({
										type : 1,
										title : '体检预约',
										content : $("#saveOrUpdateDiv"),
										area : [ '750px', '480px' ],
										success : function(index) {
											//清空表单数据
											$("#dataFrm")[0].reset();
											url = "/examination/order1/addOrderTeam.action";
										}
									});
						}

						//打开修改页面
						function openUpdateUser(data) {
							mainIndex = layer
									.open({
										type : 1,
										title : '修改预约信息',
										content : $("#saveOrUpdateDiv"),
										area : [ '750px', '480px' ],
										success : function(index) {
											form.val("dataFrm", data);
											url = "/examination/order1/updateOrder1.action";
										}
									});
						}
						
						//打开体检明细页面
						function openCheckDetail(data) {
							var oid = data.oid;
							$.ajax({
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
													content : $("#checkDetailDiv"),
													area : ['800px','500px' ],
													success : function() {
														//清空表单数据
														$("#dataFrm")[0].reset();
														url = "/examination/result/updateProjectResult.action";
														var tttr = createTable(rr);
														$("#orderDetailTable").html(tttr);
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
											+ '" style="height:35px;width:100%;" readonly="readonly"/></td>'
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
									+ '<td colspan="3" style="padding: 0 0"><input type="text" id="finalResult"  value="'+data.finalresult==null?"":data.finalresult+'" style="height:35px;width:100%;" readonly="readonly"/></td>'
									+ '</tr>'
									+ '<tr>'
									+ '<td>医生签字</td>'
									+ '<td colspan="3" style="padding: 0 0"><input type="text" id="doctor"  value="'+data.doctor==null?"":data.doctor+'" style="height:35px;width:100%;" readonly="readonly"/></td>'
									+ '</tr>'
									+ '<td>报告下载</td>'
									+ reportStr
									+ '</tr>';
							return html;
						}

						//保存
						form.on("submit(doSubmit)", function(obj) {
							//序列化表单数据
// 							var params = $("#dataFrm").serialize();
							var params = {
								oid: $('#order1id').val(),
								uname: $('#order1name').val(),
								odatetime: $('#odatetime').val(),
								id: $('#packageid').val(),
								packagename: $("#packageid option:selected").text(),
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
