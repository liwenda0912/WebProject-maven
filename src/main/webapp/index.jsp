<%--        <%@ page import="java.util.Objects" %>--%>
<%--        <%@ page import="Bean.User" %>&lt;%&ndash;--%>
<%--
  Created by IntelliJ IDEA.
  User: lwd
  Date: 2023/10/25
  Time: 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<link rel="stylesheet" type="text/css" href="css/index.css">
<head>
    <title>www.webapp.servlet.pop.com</title>
</head>
<body>
<div class="all-style">
    <div class="header">
        <%@ include file="pubilc/head.jsp"%>
    </div>
    <div class="border-bar">
        <div class="border-pie-1">
            <%@ include file="border.jsp"%>
        </div>
        <div class="border-bar-2">
            <%@ include file="border-bar.jsp"%>
        </div>
    </div>
    <div class="border-msg-2">
        <div id="input-msg">
            <form action="LoginServlet" method="post">
                <div id="input-name">
                    UserName:
                    <label>
                        <input type="text" placeholder="请输入名字" name="username">
                    </label>
                </div>
                <div id="input-passwd">
                    PassWord:
                    <label>
                        <input type="password" placeholder="请输入密码" name="passwd">
                    </label>
                </div>
                <div class="buttom_login">
                    <button type="submit">登录</button>
                </div>
            </form>
        </div>
        <div id="show-msg"></div>
    </div>

    <div id="black"></div>
    <div class="bottom">
        <%@ include file="pubilc/bottom.jsp"%>
    </div>
</div>
</body>
</html>
