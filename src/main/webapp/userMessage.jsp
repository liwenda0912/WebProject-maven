<%--
  Created by IntelliJ IDEA.
  User: 10260
  Date: 2024/3/11
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page isELIgnored="false" %>
<link rel="stylesheet" type="text/css" href="css/userMessage.css">
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="tab_userMessage">
    <div class="table-style">

<%--        <sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"--%>
<%--                           url="jdbc:mysql://localhost:3306/testRunningdata"--%>
<%--                           user="root"  password="123456"/>--%>
<%--        <sql:query dataSource="${snapshot}" var="result">--%>
<%--            SELECT * from users;--%>
<%--        </sql:query>--%>
<%--        <table>--%>
<%--            <thead>--%>
<%--            <tr>--%>
<%--                <th><div class="tr-th-name">id</div></th>--%>
<%--                <th><div class="tr-th-name">用户名</div></th>--%>
<%--                <th><div class="tr-th-name">密码</div></th>--%>
<%--                <th><div class="tr-th-name">操作</div></th>--%>
<%--            </tr>--%>
<%--            </thead>--%>
<%--            <tbody>--%>
<%--            <c:forEach var="row" items="${result.rows}">--%>
<%--                <tr>--%>
<%--                    <td><c:out value="${row.id}"/></td>--%>
<%--                    <td><c:out value="${row.username}"/></td>--%>
<%--                    <td><c:out value="${row.password}"/></td>--%>
<%--                    <td><a href="">修改密码</a></td>--%>
<%--                </tr>--%>
<%--            </c:forEach>--%>
<%--            </tbody>--%>
<%--            <tfoot>--%>
<%--            <tr>--%>
<%--                <td>total</td>--%>
<%--            </tr>--%>
<%--            </tfoot>--%>
<%--        </table>--%>
    </div>
</div>
</body>
</html>
