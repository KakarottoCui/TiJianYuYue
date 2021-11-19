<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>注册页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/style.css" media="all">
    <!-- <link rel="icon" href="../frame/static/image/code.png"> -->
</head>
<body>
 
<div class="login-main">
    <header class="layui-elip" style="width: 82%">体检人员注册</header>
 
    <!-- 表单选项 -->
    <form class="layui-form" id="dataFrm">
        <div class="layui-input-inline">
            <!-- 用户名 -->
            <div class="layui-inline" style="width: 85%">
                <input type="text" id="user" name="uid" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
            </div>
            <!-- 对号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="ri" style="color: green;font-weight: bolder;" hidden></i>
            </div>
            <!-- 错号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="wr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
            </div>
        </div>
        <div class="layui-input-inline">
            <!-- 用户名 -->
            <div class="layui-inline" style="width: 85%">
                <input type="text" id="user" name="uname" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
            </div>
            <!-- 对号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="ri" style="color: green;font-weight: bolder;" hidden></i>
            </div>
            <!-- 错号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="wr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
            </div>
        </div>
            <!-- 密码 -->
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="password" id="pwd" name="upassword" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
            <!-- 对号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="pri" style="color: green;font-weight: bolder;" hidden></i>
            </div>
            <!-- 错号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="pwr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
            </div>
        </div>
            <!-- 确认密码 -->
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="password" id="rpwd" name="reupassword" required  lay-verify="required" placeholder="请确认密码" autocomplete="off" class="layui-input">
            </div>
            <!-- 对号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="rpri" style="color: green;font-weight: bolder;" hidden></i>
            </div>
            <!-- 错号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="rpwr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
            </div>
        </div>
 		<div class="layui-input-inline">
            <!-- 用户名 -->
        		<input type="radio" name="usex" value="1" title="男" checked>
				<input type="radio" name="usex" value="0" title="女" >
        </div>
        <div class="layui-input-inline">
            <!-- 用户名 -->
            <div class="layui-inline" style="width: 85%">
                <input type="text" id="uidcard" name="uidcard" required  lay-verify="required" placeholder="请输入身份证号" autocomplete="off" class="layui-input">
            </div>
            <!-- 对号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="ri" style="color: green;font-weight: bolder;" hidden></i>
            </div>
            <!-- 错号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="wr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
            </div>
        </div>
        <div class="layui-input-inline">
            <!-- 用户名 -->
            <div class="layui-inline" style="width: 85%">
                <input type="text" id="uphone" name="uphone" required  lay-verify="required" placeholder="请输入联系方式" autocomplete="off" class="layui-input">
            </div>
            <!-- 对号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="ri" style="color: green;font-weight: bolder;" hidden></i>
            </div>
            <!-- 错号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="wr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
            </div>
        </div>
        <div class="layui-input-inline">
            <!-- 用户名 -->
            <div class="layui-inline" style="width: 85%">
                <input type="text" name="birthday" id="birthday"  class="layui-input layui-input-inline"
                       placeholder="yyyy-MM-dd" style="height: 30px;border-radius: 10px">
            </div>
            <!-- 对号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="ri" style="color: green;font-weight: bolder;" hidden></i>
            </div>
            <!-- 错号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="wr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
            </div>
        </div>
        <div class="layui-input-inline">
            <!-- 用户名 -->
            <div class="layui-inline" style="width: 85%">
                <input type="text" id="user" name="address" required  lay-verify="required" placeholder="请输入家庭住址" autocomplete="off" class="layui-input">
            </div>
            <!-- 对号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="ri" style="color: green;font-weight: bolder;" hidden></i>
            </div>
            <!-- 错号 -->
            <div class="layui-inline">
                <i class="layui-icon" id="wr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
            </div>
        </div>
 
        <div class="layui-input-inline login-btn" style="width: 85%">
            <button type="submit" lay-submit lay-filter="sub" class="layui-btn">注册</button>
        </div>
        <hr style="width: 85%" />
        <p style="width: 85%"><a href="${pageContext.request.contextPath}/login/toLogin.action" class="fl">已有账号？立即登录</a></p>
    </form>
</div>

<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['form','jquery','layer','laydate'], function () {
        var form   = layui.form;
        var $      = layui.jquery;
        var layer  = layui.layer;
        var laydate = layui.laydate;
        
        
      //渲染时间
        laydate.render({
            elem:'#birthday',
            type:'datetime'
        });
        
        //添加表单失焦事件
        //验证表单
//         $('#user').blur(function() {
//             var user = $(this).val();
//             var url = "/examination/login/checkUser.action";
//         	var params = {
//         			userName: user
//         	};
//         	$.post(url, params, function (obj) {
//         		alert(obj);
//             })
 
//         });
 
        // you code ...
        // 为密码添加正则验证
//         $('#pwd').blur(function() {
//                 var reg = /^[\w]{6,12}$/;
//                 if(!($('#pwd').val().match(reg))){
//                     //layer.msg('请输入合法密码');
//                     $('#pwr').removeAttr('hidden');
//                     $('#pri').attr('hidden','hidden');
//                     layer.msg('请输入合法密码');
//                 }else {
//                     $('#pri').removeAttr('hidden');
//                     $('#pwr').attr('hidden','hidden');
//                 }
//         });
 
        //验证两次密码是否一致
        $('#rpwd').blur(function() {
                if($('#pwd').val() != $('#rpwd').val()){
                    $('#rpwr').removeAttr('hidden');
                    $('#rpri').attr('hidden','hidden');
                    layer.msg('两次输入密码不一致!');
                }else {
                    $('#rpri').removeAttr('hidden');
                    $('#rpwr').attr('hidden','hidden');
                };
        });
 
        //
        //添加表单监听事件,提交注册信息
        form.on('submit(sub)', function() {
        	var url = "/examination/user/addUser.action";
        	var params = $("#dataFrm").serialize();
        	$.post(url, params, function (obj) {
                layer.msg(obj.msg);
                /* window.location = "/examination/login/toLogin.action"; */
                //关闭弹出层
//                 layer.close(mainIndex)
//                 //刷新数据 表格
//                 tableIns.reload();
            })
            //防止页面跳转
            return false;
        });
 
    });
</script>
</body>
</html>