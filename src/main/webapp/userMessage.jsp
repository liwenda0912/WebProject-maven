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
<script src="//unpkg.com/vue@2/dist/vue.js"></script>
<script src="//unpkg.com/element-ui@2.15.14/lib/index.js"></script>
<link rel="stylesheet"  href="//unpkg.com/element-ui@2.15.14/lib/theme-chalk/index.css">
<%--<link rel="stylesheet" type="text/css" href="css/userMessage.css">--%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="tab_userMessage">
    <div class="table-style" id="app_tabs">
        <el-tabs type="border-card">
            <el-tab-pane label="用户管理">
                <el-table
                        :data="tableData"
                        style="width: 100%"
                        height="560px">
                    <el-table-column
                            fixed
                            prop="date"
                            label="日期"
                            width="150">
                    </el-table-column>
                    <el-table-column
                            prop="name"
                            label="姓名"
                            width="120">
                    </el-table-column>
                    <el-table-column
                            prop="province"
                            label="省份"
                            width="120">
                    </el-table-column>
                    <el-table-column
                            prop="city"
                            label="市区"
                            width="120">
                    </el-table-column>
                    <el-table-column
                            prop="address"
                            label="地址"
                            width="300">
                    </el-table-column>
                    <el-table-column
                            prop="zip"
                            label="邮编"
                            width="120">
                    </el-table-column>
                    <el-table-column
                            label="操作"
                            width="100">
                        <template slot-scope="scope">
                            <el-button @click="handleClick(scope.row)" type="text" size="small">查看</el-button>
                            <el-button type="text" size="small">编辑</el-button>
                        </template>
                    </el-table-column>
                </el-table>
            </el-tab-pane>
        </el-tabs>
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
<script >
    var User = {
        methods: {
            handleClick(row) {
                console.log(row);
            }
        },
        data() {
            return {
                tableData: [{
                    date: '2016-05-02',
                    name: '王小虎',
                    province: '上海',
                    city: '普陀区',
                    address: '上海市普陀区金沙江路 1518 弄',
                    zip: 200333
                }, {
                    date: '2016-05-04',
                    name: '王小虎',
                    province: '上海',
                    city: '普陀区',
                    address: '上海市普陀区金沙江路 1517 弄',
                    zip: 200333
                }, {
                    date: '2016-05-01',
                    name: '王小虎',
                    province: '上海',
                    city: '普陀区',
                    address: '上海市普陀区金沙江路 1519 弄',
                    zip: 200333
                }, {
                    date: '2016-05-03',
                    name: '王小虎',
                    province: '上海',
                    city: '普陀区',
                    address: '上海市普陀区金沙江路 1516 弄',
                    zip: 200333
                }]
            }
        }
    }
    var Ctor = Vue.extend(User)
    new Ctor().$mount('#app_tabs')
</script>
</body>
</html>
