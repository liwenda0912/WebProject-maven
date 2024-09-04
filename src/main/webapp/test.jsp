<%--&lt;%&ndash;package Controller;&ndash;%&gt;--%>
<%--&lt;%&ndash;import Utils.sqlConnect;&ndash;%&gt;--%>

<%--&lt;%&ndash;import javax.Controller.*;&ndash;%&gt;--%>
<%--&lt;%&ndash;import javax.Controller.http.*;&ndash;%&gt;--%>
<%--&lt;%&ndash;import javax.Controller.annotation.*;&ndash;%&gt;--%>
<%--&lt;%&ndash;import java.io.IOException;&ndash;%&gt;--%>
<%--&lt;%&ndash;import java.io.PrintWriter;&ndash;%&gt;--%>
<%--&lt;%&ndash;import java.sql.ResultSet;&ndash;%&gt;--%>
<%--&lt;%&ndash;import java.sql.SQLException;&ndash;%&gt;--%>
<%--&lt;%&ndash;import java.util.Objects;&ndash;%&gt;--%>
<%--&lt;%&ndash;//import static java.lang.System.out;&ndash;%&gt;--%>

<%--&lt;%&ndash;@WebServlet(name = "LoginServlet", value = "/LoginServlet")&ndash;%&gt;--%>
<%--&lt;%&ndash;public class LoginServlet extends HttpServlet {&ndash;%&gt;--%>
<%--&lt;%&ndash;@Override&ndash;%&gt;--%>
<%--&lt;%&ndash;protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {&ndash;%&gt;--%>
<%--&lt;%&ndash;request.setAttribute("key",0);&ndash;%&gt;--%>
<%--&lt;%&ndash;request.getRequestDispatcher("index.jsp").forward(request, response);&ndash;%&gt;--%>
<%--&lt;%&ndash;}&ndash;%&gt;--%>

<%--&lt;%&ndash;@Override&ndash;%&gt;--%>
<%--&lt;%&ndash;protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {&ndash;%&gt;--%>
<%--&lt;%&ndash;String UserName = request.getParameter("username");&ndash;%&gt;--%>
<%--&lt;%&ndash;String Passwd = request.getParameter("passwd");&ndash;%&gt;--%>
<%--&lt;%&ndash;sqlConnect sql =new sqlConnect();&ndash;%&gt;--%>
<%--&lt;%&ndash;if(UserName.isEmpty()){&ndash;%&gt;--%>
<%--&lt;%&ndash;String data= "{\"notice\":\"0\",\"message_register\":\"账号为空\"}";&ndash;%&gt;--%>
<%--&lt;%&ndash;response.setContentType("application/json;charset=UTF-8");&ndash;%&gt;--%>
<%--&lt;%&ndash;response.getWriter().write(data);&ndash;%&gt;--%>
<%--&lt;%&ndash;}else {&ndash;%&gt;--%>
<%--&lt;%&ndash;try {&ndash;%&gt;--%>
<%--&lt;%&ndash;ResultSet data =  sql.getSelect();&ndash;%&gt;--%>
<%--&lt;%&ndash;System.out.print(data);&ndash;%&gt;--%>
<%--&lt;%&ndash;while (data.next()){&ndash;%&gt;--%>
<%--&lt;%&ndash;if (Objects.equals(UserName, data.getString("username"))) {&ndash;%&gt;--%>
<%--&lt;%&ndash;if (!Objects.equals(Passwd, data.getString("password"))) {&ndash;%&gt;--%>
<%--&lt;%&ndash;String message= "{\"notice\":\"2\",\"message_login\":\"登录成功！\"}";&ndash;%&gt;--%>
<%--&lt;%&ndash;response.setContentType("application/json;charset=UTF-8");&ndash;%&gt;--%>
<%--&lt;%&ndash;response.getWriter().write(message);&ndash;%&gt;--%>
<%--&lt;%&ndash;} else {&ndash;%&gt;--%>
<%--&lt;%&ndash;// 设置session中的值&ndash;%&gt;--%>
<%--&lt;%&ndash;String message= "{\"notice\":\"1\",\"message_login\":\"密码为空！\"}";&ndash;%&gt;--%>
<%--&lt;%&ndash;response.setContentType("application/json;charset=UTF-8");&ndash;%&gt;--%>
<%--&lt;%&ndash;response.getWriter().write(message);&ndash;%&gt;--%>
<%--&lt;%&ndash;}&ndash;%&gt;--%>
<%--&lt;%&ndash;} else {&ndash;%&gt;--%>
<%--&lt;%&ndash;String message= "{\"notice\":\"2\",\"message_login\":\"账号不存在！\"}";&ndash;%&gt;--%>
<%--&lt;%&ndash;response.setContentType("application/json;charset=UTF-8");&ndash;%&gt;--%>
<%--&lt;%&ndash;response.getWriter().write(message);&ndash;%&gt;--%>
<%--&lt;%&ndash;}&ndash;%&gt;--%>
<%--&lt;%&ndash;}&ndash;%&gt;--%>
<%--&lt;%&ndash;} catch (ClassNotFoundException | SQLException e) {&ndash;%&gt;--%>
<%--&lt;%&ndash;throw new RuntimeException(e);&ndash;%&gt;--%>
<%--&lt;%&ndash;}&ndash;%&gt;--%>
<%--&lt;%&ndash;}&ndash;%&gt;--%>

<%--&lt;%&ndash;}&ndash;%&gt;--%>
<%--&lt;%&ndash;}&ndash;%&gt;--%>
<%--&lt;%&ndash;<%@ page language="java" contentType="text/html; charset=UTF-8"&ndash;%&gt;--%>
<%--&lt;%&ndash;         pageEncoding="UTF-8"%>&ndash;%&gt;--%>
<%--&lt;%&ndash;<%@ page import="java.io.*,java.util.*,java.sql.*"%>&ndash;%&gt;--%>
<%--&lt;%&ndash;<%@ page import="javax.Controller.http.*,javax.Controller.*" %>&ndash;%&gt;--%>
<%--&lt;%&ndash;<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>&ndash;%&gt;--%>
<%--&lt;%&ndash;<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8"%>--%>
<%--<script src="https://cdn.bootcss.com/echarts/4.1.0.rc2/echarts.js" type="text/javascript" charset="utf-8"></script>--%>
<link rel="stylesheet"  href="//unpkg.com/element-ui@2.15.14/lib/theme-chalk/index.css">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--<html>--%>
<%--<head>--%>
<%--    <title></title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div id="container" style="width: 500px;height: 500px">--%>
<%--</div>--%>
<%--&lt;%&ndash;<!--&ndash;%&gt;--%>
<%--&lt;%&ndash;JDBC 驱动名及数据库 URL&ndash;%&gt;--%>
<%--&lt;%&ndash;数据库的用户名与密码，需要根据自己的设置&ndash;%&gt;--%>
<%--&lt;%&ndash;useUnicode=true&characterEncoding=utf-8 防止中文乱码&ndash;%&gt;--%>
<%--&lt;%&ndash; -->&ndash;%&gt;--%>
<%--&lt;%&ndash;<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"&ndash;%&gt;--%>
<%--&lt;%&ndash;                   url="jdbc:mysql://localhost:3306/RUNOOB?useUnicode=true&characterEncoding=utf-8"&ndash;%&gt;--%>
<%--&lt;%&ndash;                   user="root"  password="123456"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;<!--&ndash;%&gt;--%>
<%--&lt;%&ndash;插入数据&ndash;%&gt;--%>
<%--&lt;%&ndash; -->&ndash;%&gt;--%>
<%--&lt;%&ndash;<sql:update dataSource="${snapshot}" var="result">&ndash;%&gt;--%>
<%--&lt;%&ndash;    INSERT INTO websites (name,url,alexa,country) VALUES ('菜鸟教程移动站', 'http://m.runoob.com', 5093, 'CN');&ndash;%&gt;--%>
<%--&lt;%&ndash;</sql:update>&ndash;%&gt;--%>
<%--&lt;%&ndash;<sql:query dataSource="${snapshot}" var="result">&ndash;%&gt;--%>
<%--&lt;%&ndash;    SELECT * from websites;&ndash;%&gt;--%>
<%--&lt;%&ndash;</sql:query>&ndash;%&gt;--%>
<%--&lt;%&ndash;<h1>JSP 数据库实例 - 菜鸟教程</h1>&ndash;%&gt;--%>
<%--&lt;%&ndash;<table border="1" width="100%">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <th>ID</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <th>站点名</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <th>站点地址</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <c:forEach var="row" items="${result.rows}">&ndash;%&gt;--%>
<%--&lt;%&ndash;        <tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <td><c:out value="${row.id}"/></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <td><c:out value="${row.name}"/></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <td><c:out value="${row.url}"/></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </c:forEach>&ndash;%&gt;--%>
<%--&lt;%&ndash;</table>&ndash;%&gt;--%>
<%--<script>--%>
<%--    // 基于准备好的dom，初始化echarts实例--%>
<%--    data_1 = [820, 0, 901, 934, 1290, 1330, 1320]--%>
<%--    var myChart = echarts.init(document.getElementById('container'),"line");--%>
<%--    // 指定图表的配置项和数据--%>
<%--    var option_1 = {--%>
<%--        title: {--%>
<%--            text: 'ECharts 线形图示例'--%>
<%--        },--%>
<%--        tooltip: {--%>
<%--            trigger: 'axis'--%>
<%--        },--%>
<%--        legend: {--%>
<%--            data:['销量']--%>
<%--        },--%>
<%--        grid: {--%>
<%--            left: '3%',--%>
<%--            right: '4%',--%>
<%--            bottom: '3%',--%>
<%--            containLabel: true--%>
<%--        },--%>
<%--        toolbox: {--%>
<%--            right:15,--%>
<%--            feature: {--%>
<%--                saveAsImage: {}--%>
<%--            }--%>
<%--        },--%>
<%--        xAxis: {--%>
<%--            type: 'category',--%>
<%--            boundaryGap: false,--%>
<%--            data: ['周一','周二','周三','周四','周五','周六','周日']--%>
<%--        },--%>
<%--        yAxis: {--%>
<%--            type: 'value'--%>
<%--        },--%>
<%--        series: [--%>
<%--            {--%>
<%--                areaStyle:{},--%>
<%--                name:'销量',--%>
<%--                type:'line',--%>
<%--                data:data_1--%>
<%--            }--%>
<%--        ]--%>
<%--    };--%>

<%--    // 使用刚指定的配置项和数据显示图表。--%>
<%--    myChart.setOption(option_1);--%>
<%--</script>--%>
<%--</body>--%>

<%--</html>--%>



<script src="//unpkg.com/vue@2/dist/vue.js"></script>
<script src="//unpkg.com/element-ui@2.15.14/lib/index.js"></script>
<div id="app">
    <template>
        <el-tabs v-model="activeName" type="card" @tab-click="handleClick">
            <el-tab-pane label="用户管理" name="first">用户管理</el-tab-pane>
            <el-tab-pane label="配置管理" name="second">配置管理</el-tab-pane>
            <el-tab-pane label="角色管理" name="third">角色管理</el-tab-pane>
            <el-tab-pane label="定时任务补偿" name="fourth">定时任务补偿</el-tab-pane>
        </el-tabs>
    </template>
</div>
<script>
    var Main = {
        data() {
            return {
                activeName: 'first'
            };
        },
        methods: {
            handleClick(tab, event) {
                // tab._uid=5;
                console.log(tab._uid, event);
            }
        }
    };
    var Ctor = Vue.extend(Main)
    new Ctor().$mount('#app')
</script>
