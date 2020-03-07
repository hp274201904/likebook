<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/5
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>注册</title>
    <link href="Wopop_files/style_log.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="Wopop_files/style.css">
    <link rel="stylesheet" type="text/css" href="Wopop_files/userpanel.css">
    <link rel="stylesheet" type="text/css" href="Wopop_files/jquery.ui.all.css">
    <script src="js/jquery-3.1.1.js"></script>
    <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css"  rel="stylesheet">
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <style>
        button{margin-right: 90px;}
    </style>

</head>
<body class="login" mycollectionplug="bind">
<form action="insertUser">
<div class="login_m">
    <div class="login_logo"><img src="Wopop_files/logo21.png" width="350" height="100" ></div>
    <div class="login_boder">

        <div class="login_padding" id="login_model" >

            <h2>用户名</h2>
            <label>
                <input type="text" id="username" name="userName" class="txt_input txt_input2">
            </label>
            <h2>密码</h2>
            <label>
                <input type="password" name="password" id="password" class="txt_input">
            </label>
            <div class="col-sm-offset-2 col-sm-10">${msg}</div>
            <div class="rem_sub">
                     <button type="submit" class="btn btn-default">注册</button></a>
                    <a href="index.jsp"> <button type="button" class="btn btn-default">登录</button></a>
            </div>
        </div>
    </div>
</div>
</form>
</body>
</html>
