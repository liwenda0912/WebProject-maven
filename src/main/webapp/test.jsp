<%--package servlet;--%>
<%--import Utils.sqlConnect;--%>

<%--import javax.servlet.*;--%>
<%--import javax.servlet.http.*;--%>
<%--import javax.servlet.annotation.*;--%>
<%--import java.io.IOException;--%>
<%--import java.io.PrintWriter;--%>
<%--import java.sql.ResultSet;--%>
<%--import java.sql.SQLException;--%>
<%--import java.util.Objects;--%>
<%--//import static java.lang.System.out;--%>

<%--@WebServlet(name = "LoginServlet", value = "/LoginServlet")--%>
<%--public class LoginServlet extends HttpServlet {--%>
<%--@Override--%>
<%--protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {--%>
<%--request.setAttribute("key",0);--%>
<%--request.getRequestDispatcher("index.jsp").forward(request, response);--%>
<%--}--%>

<%--@Override--%>
<%--protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {--%>
<%--String UserName = request.getParameter("username");--%>
<%--String Passwd = request.getParameter("passwd");--%>
<%--sqlConnect sql =new sqlConnect();--%>
<%--if(UserName.isEmpty()){--%>
<%--String data= "{\"notice\":\"0\",\"message_register\":\"账号为空\"}";--%>
<%--response.setContentType("application/json;charset=UTF-8");--%>
<%--response.getWriter().write(data);--%>
<%--}else {--%>
<%--try {--%>
<%--ResultSet data =  sql.getSelect();--%>
<%--System.out.print(data);--%>
<%--while (data.next()){--%>
<%--if (Objects.equals(UserName, data.getString("username"))) {--%>
<%--if (!Objects.equals(Passwd, data.getString("password"))) {--%>
<%--String message= "{\"notice\":\"2\",\"message_login\":\"登录成功！\"}";--%>
<%--response.setContentType("application/json;charset=UTF-8");--%>
<%--response.getWriter().write(message);--%>
<%--} else {--%>
<%--// 设置session中的值--%>
<%--String message= "{\"notice\":\"1\",\"message_login\":\"密码为空！\"}";--%>
<%--response.setContentType("application/json;charset=UTF-8");--%>
<%--response.getWriter().write(message);--%>
<%--}--%>
<%--} else {--%>
<%--String message= "{\"notice\":\"2\",\"message_login\":\"账号不存在！\"}";--%>
<%--response.setContentType("application/json;charset=UTF-8");--%>
<%--response.getWriter().write(message);--%>
<%--}--%>
<%--}--%>
<%--} catch (ClassNotFoundException | SQLException e) {--%>
<%--throw new RuntimeException(e);--%>
<%--}--%>
<%--}--%>

<%--}--%>
<%--}--%>
<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--         pageEncoding="UTF-8"%>--%>
<%--<%@ page import="java.io.*,java.util.*,java.sql.*"%>--%>
<%--<%@ page import="javax.servlet.http.*,javax.servlet.*" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>--%>

<%--<html>--%>
<%--<head>--%>
<%--    <title>SELECT 操作</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<!----%>
<%--JDBC 驱动名及数据库 URL--%>
<%--数据库的用户名与密码，需要根据自己的设置--%>
<%--useUnicode=true&characterEncoding=utf-8 防止中文乱码--%>
<%-- -->--%>
<%--<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"--%>
<%--                   url="jdbc:mysql://localhost:3306/RUNOOB?useUnicode=true&characterEncoding=utf-8"--%>
<%--                   user="root"  password="123456"/>--%>
<%--<!----%>
<%--插入数据--%>
<%-- -->--%>
<%--<sql:update dataSource="${snapshot}" var="result">--%>
<%--    INSERT INTO websites (name,url,alexa,country) VALUES ('菜鸟教程移动站', 'http://m.runoob.com', 5093, 'CN');--%>
<%--</sql:update>--%>
<%--<sql:query dataSource="${snapshot}" var="result">--%>
<%--    SELECT * from websites;--%>
<%--</sql:query>--%>
<%--<h1>JSP 数据库实例 - 菜鸟教程</h1>--%>
<%--<table border="1" width="100%">--%>
<%--    <tr>--%>
<%--        <th>ID</th>--%>
<%--        <th>站点名</th>--%>
<%--        <th>站点地址</th>--%>
<%--    </tr>--%>
<%--    <c:forEach var="row" items="${result.rows}">--%>
<%--        <tr>--%>
<%--            <td><c:out value="${row.id}"/></td>--%>
<%--            <td><c:out value="${row.name}"/></td>--%>
<%--            <td><c:out value="${row.url}"/></td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--</table>--%>
<%--</body>--%>
<%--</html>--%>



