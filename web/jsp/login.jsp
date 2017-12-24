<%--
  Created by IntelliJ IDEA.
  User: quinn_norris
  Date: 2017/10/22
  Time: 下午7:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if IE 9 ]>
<html class="ie9"><![endif]-->
<head>
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta name="format-detection" content="telephone=no">
    <meta charset="UTF-8">
    <meta name="description" content="Violate Responsive Admin Template">
    <meta name="keywords" content="Super Admin, Admin, Template, Bootstrap">
    <title>MoreTime——用户登录</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/form.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/generics.css" rel="stylesheet">
    <link href="css/qncss.css" rel="stylesheet">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/icheck.js"></script>
    <script src="js/functions.js"></script>
    <script src="js/login.js"></script>
    <script src="js/md5.js"></script>
</head>
<body id="skin-blur-violate">
<section id="login">
    <header>
        <h1>MORE TIME</h1>
        <p>The time of life is short , to spend that shortness basely , it would be too long . </p>
        <p class="names">—— William Shakespeare</p>
    </header>
    <div class="clearfix"></div>

    <!-- Login -->
    <div class="loginsetting">
        <div class="box tile animated active" id="box-login">
            <h2 class="m-t-0 m-b-15">Login 登陆</h2>
            <input type="text" class="login-control m-b-10" id="logphone" placeholder="手机号码">
            <input type="password" class="login-control" id="logpw" placeholder="密码">
            <div style="height: 20px">
            </div>
            <small><p id="tipl" hidden></p></small>
            <button class="btn btn-sm m-r-5" onclick="sign_login()"><span id="signins">Sign In 登陆</span></button>
            <small>
                <a class="box-switcher" data-switch="box-register" href="">注册账号</a> 或
                <a class="box-switcher" data-switch="box-reset" href="">忘记密码</a>
            </small>
        </div>
    </div>

    <!-- Register -->
    <div class="loginsetting">
        <div class="box animated tile" id="box-register">
            <h2 class="m-t-0 m-b-15">Register 注册</h2>
            <input type="text" class="login-control m-b-10" id="phone" placeholder="手机号码">
            <input type="text" class="login-control m-b-10" id="username" placeholder="用户名">
            <input type="password" class="login-control m-b-10" id="pw" placeholder="密码">
            <input type="password" class="login-control m-b-20" id="re_pw" placeholder="重复密码">
            <small><p id="tip" hidden></p></small>
            <button class="btn btn-sm m-r-5" onclick="sign_up()">Register 注册</button>
            <small><a class="box-switcher" data-switch="box-login" href="">前往登陆</a></small>
        </div>
    </div>

    <!-- Forgot Password -->
    <div class="loginsetting">
        <div class="box animated tile" id="box-reset">
            <h2 class="m-t-0 m-b-15">Reset Password 重设密码</h2>
            <p>输入你已经绑定的邮箱。</br>我们会向该邮箱发送邮件并以此重新设置你的密码。</br><span style="color: red">该功能暂不能使用</span></p>
            <input type="email" id="foremail" class="login-control m-b-20" placeholder="Email Address">
            <small><p id="tip2" hidden></p></small>
            <button class="btn btn-sm m-r-5" onclick="for_pw()">Reset Password 密码重置</button>
            <small><a class="box-switcher" data-switch="box-login" href="">前往登陆</a></small>
        </div>
    </div>
</section>
</body>
</html>
