<%--
  Created by IntelliJ IDEA.
  User: 10260
  Date: 2024/1/3
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page language="java" contentType="text/html; charset=UTF-8"--%>
<%--         pageEncoding="UTF-8"%>--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>--%>
<%--<%@ page isELIgnored="false" %>--%>
<%--<script src="//unpkg.com/element-ui@2.15.14/lib/index.js"></script>--%>
<html>
<script src="//unpkg.com/vue@2/dist/vue.js"></script>
<script src="//unpkg.com/element-ui@2.15.14/lib/index.js"></script>
<link rel="stylesheet"  href="//unpkg.com/element-ui@2.15.14/lib/theme-chalk/index.css">
<link rel="stylesheet" type="text/css" href="css/head_new.css">
<link rel="stylesheet" type="text/css" href="css/data.css">
<script src="js/tab.js"></script>
<head>
    <title>Title</title>
</head>
<body>
<div class="body-tab" id="app_Data">
    <div class="body_table" v-if="testDataShow">
         <iframe src="tab_table.jsp"  scrolling="no" style="border: 0;border-radius: 10px;" class="body-button"></iframe>
<%--        <div class="body-button">--%>
<%--            <button class="tab active"  onclick="tab(event,'tab1')">成功</button>--%>
<%--            <button class="tab" onclick="tab(event,'tab2')">失败</button>--%>
<%--            <button class="tab" onclick="tab(event,'tab3')">随便</button>--%>
<%--        </div>--%>
<%--        <div id="tab1" class="tab-content" style="display: block">--%>
<%--            <div class="table-style">--%>
<%--                 <sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver"--%>
<%--                   url="jdbc:mysql://localhost:3306/testRunningdata"--%>
<%--                   user="root"  password="123456"/>--%>
<%--                 <sql:query dataSource="${snapshot}" var="result">--%>
<%--                     SELECT * from test_report where test_result="成功";--%>
<%--                 </sql:query>--%>
<%--                <table>--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <th><div class="tr-th-name">编号</div></th>--%>
<%--                        <th><div class="tr-th-name">用例名</div></th>--%>
<%--                        <th><div class="tr-th-name">用例描述</div></th>--%>
<%--                        <th><div class="tr-th-name">运行时间</div></th>--%>
<%--                        <th><div class="tr-th-name">测试结果</div></th>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>
<%--                    <tbody>--%>
<%--                    <c:forEach var="row" items="${result.rows}">--%>
<%--                    <tr>--%>
<%--                        <td><c:out value="${row.test_id}"/></td>--%>
<%--                        <td><c:out value="${row.test_name}"/></td>--%>
<%--                        <td><c:out value="${row.test_explan}"/></td>--%>
<%--                        <td><c:out value="${row.test_time}"/></td>--%>
<%--                        <td><c:out value="${row.test_result}"/></td>--%>
<%--                    </tr>--%>
<%--                    </c:forEach>--%>
<%--                    </tbody>--%>
<%--                    <tfoot>--%>
<%--                    <tr>--%>
<%--                        <td>total</td>--%>
<%--                    </tr>--%>
<%--                    </tfoot>--%>
<%--                </table>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div id="tab2" class="tab-content" style="display: none">--%>
<%--            <div class="table-style">--%>
<%--                <table>--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <th><div class="tr-th-name">编号</div></th>--%>
<%--                        <th><div class="tr-th-name">用例名</div></th>--%>
<%--                        <th><div class="tr-th-name">用例描述</div></th>--%>
<%--                        <th><div class="tr-th-name">运行时间</div></th>--%>
<%--                        <th><div class="tr-th-name">测试结果</div></th>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>
<%--                    <tbody>--%>

<%--                    <% String[] data = new String[]{"1", "2","3","4","5"};--%>
<%--                        for(int i=0;i<data.length;i++){%>--%>
<%--                    <tr>--%>
<%--                        <td><%=data[i]%></td>--%>
<%--                        <td><%=data[i]%></td>--%>
<%--                        <td><%=data[i]%></td>--%>
<%--                        <td><%=data[i]%></td>--%>
<%--                        <td><%=data[i]%></td>--%>
<%--                    </tr>--%>
<%--                    <%}%>--%>
<%--                    </tbody>--%>
<%--                    <tfoot>--%>
<%--                    <tr>--%>
<%--                        <td>total</td>--%>
<%--                    </tr>--%>
<%--                    </tfoot>--%>
<%--                </table>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div id="tab3" class="tab-content" style="display: none">--%>
<%--            <div class="table-style">--%>
<%--                <table>--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <th><div class="tr-th-name">编号</div></th>--%>
<%--                        <th><div class="tr-th-name">用例名</div></th>--%>
<%--                        <th><div class="tr-th-name">用例描述</div></th>--%>
<%--                        <th><div class="tr-th-name">运行时间</div></th>--%>
<%--                        <th><div class="tr-th-name">测试结果</div></th>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>
<%--                    <tbody>--%>

<%--                    <% String[] Data_Message = new String[]{"1", "2","3","4","5"};--%>
<%--                        for(int i=0;i<Data_Message.length;i++){%>--%>
<%--                    <tr>--%>
<%--                        <td><%=Data_Message[i]%></td>--%>
<%--                        <td><%=Data_Message[i]%></td>--%>
<%--                        <td><%=Data_Message[i]%></td>--%>
<%--                        <td><%=Data_Message[i]%></td>--%>
<%--                        <td><%=Data_Message[i]%></td>--%>
<%--                    </tr>--%>
<%--                    <%}%>--%>
<%--                    </tbody>--%>
<%--                    <tfoot>--%>
<%--                    <tr>--%>
<%--                        <td>total</td>--%>
<%--                    </tr>--%>
<%--                    </tfoot>--%>
<%--                </table>--%>
<%--            </div>--%>
<%--        </div>--%>
    </div>
</div>
</body>
<script>
    let search = window.location.search;
    let urlParams = new URLSearchParams(search);
    let obj_testData = JSON.parse(urlParams.get('testData'));
    let obj_userMessageShow = urlParams.get('userMessageShow');
    var data_show = new Vue({
        el: '#app_Data',
        data(){
            return{
                userMessageShow:obj_userMessageShow,
                testDataShow:obj_testData,
            }
        }
    })
</script>
</html>
