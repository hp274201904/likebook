<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/5
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <link rel="stylesheet" href="static/style.css" />
    <link rel="icon" href="${pageContext.request.contextPath}/static/likebook.png"
          mce_href="${pageContext.request.contextPath}/static/likebook.png" type="image/x-icon" />
    <title>登录</title>
</head>
<body>
<div class="container">
    <form action="selectUser" class="login-form" method="post">
        <h2>爱读图书</h2>
        <input type="text" name="userName" placeholder="用户名"/>
        <input type="password" name="password" placeholder="密码"/>
        <div class="col-sm-offset-2 col-sm-10"><font color="red" >${msg}</font></div>
        <button type="submit">登录</button>
        <button type="button" onclick="window.location.href='register.jsp'">注册</button>
    </form>
</div>
</div>
</body>
</html>
