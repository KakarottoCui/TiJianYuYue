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
<!-- 	<form class="layui-form" method="post" id="searchFrm"> -->

<!-- 		<div class="layui-form-item"> -->
<!-- 			<div class="layui-inline"> -->
<!-- 				<label class="layui-form-label">项目编号:</label> -->
<!-- 				<div class="layui-input-inline" style="padding: 5px"> -->
<!-- 					<input type="text" name="pid" autocomplete="off" -->
<!-- 						class="layui-input layui-input-inline" placeholder="请输入用户名称" -->
<!-- 						style="height: 30px; border-radius: 10px"> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="layui-inline"> -->
<!-- 				<label class="layui-form-label">项目名称:</label> -->
<!-- 				<div class="layui-input-inline" style="padding: 5px"> -->
<!-- 					<input type="text" name="pname" autocomplete="off" -->
<!-- 						class="layui-input layui-input-inline" placeholder="请输入用户登陆账号" -->
<!-- 						style="height: 30px; border-radius: 10px"> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="layui-inline"> -->
<!-- 				<button type="button" -->
<!-- 					class="layui-btn layui-btn-normal layui-icon layui-icon-search layui-btn-radius layui-btn-sm" -->
<!-- 					id="doSearch" style="margin-top: 4px">查询</button> -->
<!-- 				<button type="reset" -->
<!-- 					class="layui-btn layui-btn-warm layui-icon layui-icon-refresh layui-btn-radius layui-btn-sm" -->
<!-- 					style="margin-top: 4px">重置</button> -->
<!-- 			</div> -->
<!-- 		</div> -->

<!-- 	</form> -->

	<!-- 数据表格开始 -->
	<table class="layui-hide" id="userTable" lay-filter="userTable"></table>
	<div id="userToolBar" style="display: none;">
		<button type="button" class="layui-btn layui-btn-sm layui-btn-radius"
			lay-event="add">增加</button>
	</div>
	<div id="userBar" style="display: none;">
		<a class="layui-btn layui-btn-xs layui-btn-radius" lay-event="edit">通过</a>
		<a class="layui-btn layui-btn-danger layui-btn-xs layui-btn-radius"
			lay-event="del">不通过</a>
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
						<input type="radio" name="dsex" value="0" checked="checked"
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
            , url: '/examination/order1/getAllApproveOrder.action' //数据接口
            , title: '个人体检预约表'//数据导出来的标题
//             , toolbar: "#userToolBar"   //表格的工具条
            , height: 'full-210'
            , cellMinWidth: 100 //设置列的最小默认宽度
            , page: true  //是否启用分页
            , cols: [[   //列表数据
                {field: 'oid', title: 'ID', align: 'center',width:'100'}
                , {field: 'uname', title: '姓名', align: 'center',width:'150'}
                , {field: 'usex', title: '性别', align: 'center',width:'150',templet: function (d) {
                	if (d.usex == "1") {
                		return '<font>男</font>';
                	}else if (d.usex == "0") {
                		return '<font>女</font>';
                	}else {
                		return '';
                	}
                }}
                , {field: 'uphone', title: '电话', align: 'center',width:'150'}
                , {field: 'birthday', title: '出生日期', align: 'center',width:'150'}
                , {field: 'odatetime', title: '体检日期', align: 'center',width:'150'}
                , {field: 'pname', title: '体检项目', align: 'center',width:'150',templet: function (d) {
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
                , {field: 'status', title: '状态', align: 'center',width:'150',templet: function (d) {
                	if (d.status == "0") {
                		return '预约待审核';
                	}else if (d.status == "-1") {
                		return '预约未通过';
                	}else if (d.status == "1") {
                		return '预约通过';
                	}else {
                		return '';
                	}
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
        

		//模糊查询
		$("#doSearch").click(function() {
			var params = $("#searchFrm").serialize();
			//alert(params);
			tableIns.reload({
				url : "/examination/order1/loadAllProject.action?" + params,
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
		table.on('tool(userTable)',function(obj) {
			var data = obj.data; //获得当前行数据
			var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
			if (layEvent === 'del') { //删除
				forbidOrder1(data);
			} else if (layEvent === 'edit') { //编辑
				//通过个人体检预约申请
				allowOrder1(data);
			} else if (layEvent === 'selectUserRole') {//分配权限
				openselectUserRole(data);
			}
		});

		var url;
		var mainIndex;


		//通过个人体检预约申请
		function allowOrder1(data) {
			var url = "/examination/order1/allowOrder1.action";
			var params = {
				oid: data.oid,
			}
			$.post(url, params, function(obj) {
				layer.msg(obj.msg);
				//刷新数据 表格
				tableIns.reload();
			})
		}
		//不通过个人体检预约申请
		function forbidOrder1(data) {
			var url = "/examination/order1/forbidOrder1.action";
			var params = {
				oid: data.oid,
			}
			$.post(url, params, function(obj) {
				layer.msg(obj.msg);
				//刷新数据 表格
				tableIns.reload();
			})
		}


	});
</script>
</body>
</html>
