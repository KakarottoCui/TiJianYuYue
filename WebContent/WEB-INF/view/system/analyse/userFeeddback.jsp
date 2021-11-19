<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="utf-8">
	<title>用户反馈</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css" media="all" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/feedback.css" media="all" />
</head>
<body class="childrenBody">
<div class="comment-box">
	<div class="comment-edit-box">
		<form id="conmmentForm">
			<textarea class="comment-content" name="comment_content" id="comment_content" placeholder="用户反馈" maxlength="1000"></textarea>
			<div class="opt-box">
				<button type="button" class="layui-btn" onclick="submitReply('comment_content')">提交</button>
			</div>
		</form>
	</div>
	<div class="comment-list-container">
		<div class="comment-list-box" id="comment_list_box_id">
<!-- 			<ul> -->
<!-- 				<li> -->
<!-- 					<div> -->
<!-- 						<div class="comment-list"> -->
<!-- 							<div class="comment-list-name">我是评论人</div> -->
<!-- 							<div class="comment-list-date">2021-02-06</div> -->
<!-- 						</div> -->
<!-- 						<div style="width: 100%;">楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码 -->
<!-- 						</div> -->
<!-- 						<div style="margin-top: 10px"> -->
<!-- 							<a class="layui-btn layui-btn-xs" href="javascript:void(0);" onclick="openReplyTextarea('replyDivId')">回复</a> -->
<!-- 						</div> -->
<!-- 						<div id="replyDivId" style="display:none;"> -->
<!-- 							<form id="replyForm"> -->
<!-- 								<textarea class="comment-content" name="comment_content_reply" id="comment_content_reply" placeholder="用户反馈" maxlength="1000"></textarea> -->
<!-- 								<div class="opt-box"> -->
<!-- 								<button type="button" class="layui-btn layui-btn-warm" onclick="closeReplyTextarea('replyDivId')">取消回复</button> -->
<!-- 									<button type="button" class="layui-btn " onclick="submitReply()">提交</button> -->
<!-- 								</div> -->
<!-- 							</form> -->
<!-- 						</div> -->
<!-- 						<ul> -->
<!-- 							<li> -->
<!-- 								<div class="comment-reply-div"> -->
<!-- 									<div class="comment-list-reply"> -->
<!-- 										<div class="comment-list-reply-name">回复评论的人</div> -->
<!-- 										<div class="comment-list-reply-reply" >回复</div> -->
<!-- 										<div class="comment-list-reply-reply-name" >发表评论的人</div> -->
<!-- 										<div class="comment-list-reply-date">2021-02-06</div> -->
<!-- 									</div> -->
<!-- 									<div style="width: 100%;">楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码楼主求源码 -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
<!-- 				</li> -->
<!-- 			</ul> -->
			
		</div>
	</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/echarts/js/jquery-3.1.1.min.js"></script>
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
    
	//模糊查询
	$("#comment_replay_id").click(function() {
		alert("电力回复");
		$("#replyDivId").toggle();
	});



	var url;
	var mainIndex;


});

//页面初始化加载
$(function() { 
	feedbackDetail();
});


//打开对应的回复框
function openReplyTextarea(_id) {
	$("#" + _id).show();
}

//关闭对应的回复框
function closeReplyTextarea(_id) {
	$("#" + _id).hide();
}

//提交回复的请求
function submitReply(_id) {
	var content = $("#" + _id).val();
	if (content == null || content == undefined || content == "") {
		alert("请输入反馈内容");
		return;
	}
	var parentId = -1;
	if (_id.indexOf("comment_content") > -1) {
		
	}else {
		parentId = _id.split("_")[3];
	}
	
	$.ajax({
		url : '/examination/comment/addComment.action',
		type : "post",
		dataType : "json",
		async : false,//这得注意是同步
		data : {
			parentId: -1,
			content: content,
		},
		success : function(result) {
			if (result) {
				$("#" + _id).val("");
				feedbackDetail();
			}
		}
	});
}

//查看反馈
function feedbackDetail(data) {
	$.ajax({
		url : '/examination/comment/loadAllCommentByUserId.action',
		type : "post",
		dataType : "json",
		async : false,//这得注意是同步
		data : {
		},
		success : function(result) {
			if (result) {
				var rr = result.data;
				console.log(result);
				var tttr = createTable(rr);
				$("#comment_list_box_id").html("");
				$("#comment_list_box_id").append(tttr);
			}
		}
	});

}

//生成反馈的内容
function createTable(data) {
	var projectStr = "";
	var html = "";
// 	var dataArr = JSON.parse(data);
	var dataArr = data;
	if (dataArr != null && dataArr.length > 0) {
		for (var i = 0; i < dataArr.length; i++) {
			var childHtml = "";
			var o = dataArr[i];
			var childArr = o.children;
			if (childArr != null && childArr.length > 0) {
				for (var j = 0; j < childArr.length; j++) {
					var c = childArr[j];
					childHtml += '<ul>'
					+ '	<li>'
					+ '		<div class="comment-reply-div">'
					+ '			<div class="comment-list-reply">'
					+ '				<div class="comment-list-reply-name">' + c.nickName + '</div>'
					+ '				<div class="comment-list-reply-reply" >回复</div>'
					+ '				<div class="comment-list-reply-reply-name" >' + o.nickName + '</div>'
					+ '				<div class="comment-list-reply-date">' + c.addtime + '</div>'
					+ '			</div>'
					+ '			<div style="width: 100%;margin-top: 10px;margin-bottom: 10px;">' + c.content
					+ '			</div>'
					+ '		</div>'
					+ '	</li>'
					+ '</ul>'
				}
			}
			var id = "replyDivId" + o.id;
			var comment_content_reply_id = "comment_content_reply" + o.id;
			html += '<ul style="border: 1px #009688 solid;margin-top: 10px;">'
				+ '<li>'
				+ '<div>'
				+ '<div class="comment-list">'
				+ '	<div class="comment-list-name">' + o.nickName + '</div>'
				+ '	<div class="comment-list-date">' + o.addtime + '</div>'
				+ '</div>'
				+ '<div style="width: 100%;margin-top: 10px;margin-left: 10px;margin-bottom: 10px;">' + o.content
				+ '</div>'
// 				+ '<div style="margin: 10px;">'
// 				+ '	<a class="layui-btn layui-btn-xs" href="javascript:void(0);" onclick="openReplyTextarea('+"'"+id+"'"+')">回复</a>'
// 				+ '</div>'
				+ '<div id="'+id+'" style="display:none;margin-top: 10px;">'
				+ '	<form id="replyForm">'
				+ '		<textarea class="comment-content" name="comment_content_reply" id="comment_content_reply" placeholder="用户反馈" maxlength="1000"></textarea>'
				+ '		<div class="opt-box">'
				+ '		<button type="button" class="layui-btn layui-btn-warm" onclick="closeReplyTextarea('+"'"+id+"'"+')">取消回复</button>'
				+ '			<button type="button" class="layui-btn " onclick="submitReply('+"'"+comment_content_reply_id+"'"+')">提交</button>'
				+ '		</div>'
				+ '	</form>'
				+ '</div>'
				+ childHtml
				+ '</div>'
				+ '</li>'
				+ '</ul>';
		}
	}
	return html;
}


</script>
</body>
</html>