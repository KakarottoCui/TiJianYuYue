<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="loginHtml">
<head>
<meta charset="utf-8">
<title>登录--医院体检管理系统</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="icon" href="${pageContext.request.contextPath}/favicon.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css" media="all" />
</head>
<body class="loginBody">
	<form class="layui-form">
		<div class="login_face">
			<img src="${pageContext.request.contextPath}/images/face.jpg" class="userAvatar">
		</div>
		<div class="layui-form-item input-item">
			<label for="userName">用户名</label> <input type="text"
				placeholder="请输入用户名" autocomplete="off" id="userName" name="userName"
				class="layui-input" lay-verify="required ">
		</div>
		<div class="layui-form-item input-item">
			<label for="password">密码</label> <input type="password"
				placeholder="请输入密码" autocomplete="off" id="password" name="password"
				class="layui-input" lay-verify="required ">
		</div>
		<div class="layui-form-item input-item">
<!-- 			<label class="layui-form-label">角色</label> -->
<!-- 			<div class="layui-input-block "> -->
				<label for="role"></label>
				<input type="radio" name="role" value="2" title="系统管理员" checked> <input
					type="radio" name="role" value="3" title="医生"  ><input
					type="radio" name="role" value="4" title="体检人员" >
<!-- 			</div> -->
		</div>
		<!-- 		<div class="layui-form-item input-item" id="imgCode"> -->
		<!-- 			<label for="code">验证码</label> -->
		<!-- 			<input type="text" placeholder="请输入验证码" autocomplete="off" id="code" class="layui-input"> -->
		<!-- 			<img src="${pageContext.request.contextPath}/images/code.jpg"> -->
		<!-- 		</div> -->
		<div class="layui-form-item">
			<button class="layui-btn layui-block" lay-filter="login" lay-submit>登录</button>
		</div>
		<p><a href="${pageContext.request.contextPath}/login/toregister.action" class="fl">立即注册</a></p>
		<div class="layui-form-item layui-row">
			<a href="javascript:;"
				class="seraph icon-qq layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>
			<a href="javascript:;"
				class="seraph icon-wechat layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>
			<a href="javascript:;"
				class="seraph icon-sina layui-col-xs4 layui-col-sm4 layui-col-md4 layui-col-lg4"></a>
		</div>
	</form>
	<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/login.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/cache.js"></script>
</body>
</html>