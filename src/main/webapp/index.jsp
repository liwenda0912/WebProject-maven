<%--        <%@ page import="java.util.Objects" %>--%>
<%--        <%@ page import="entity.User" %>&lt;%&ndash;--%>
<%--
  Created by IntelliJ IDEA.
  User: lwd
  Date: 2023/10/25
  Time: 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<html>
<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
<link rel="stylesheet" type="text/css" href="css/head_new.css">
<script src="https://cdn.bootcdn.net/ajax/libs/vue-router/2.6.0/vue-router.js"></script>
<!-- import Vue before Element -->
<%--    <script src="https://unpkg.com/vue@2/dist/vue.js"></script>--%>
<%--    <!-- import JavaScript -->--%>
<%--    <script src="https://unpkg.com/element-ui/lib/index.js"></script>--%>
<script src="//unpkg.com/vue@2/dist/vue.js"></script>
<script src="//unpkg.com/element-ui@2.15.14/lib/index.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<head>
    <title>www.webapp.servlet.pop.com</title>

</head>
<body>
<%String username = (String) request.getAttribute("username"); %>
<div class="all-style">
    <div class="header">
        <%@ include file="pubilc/head_new.jsp"%>
    </div>
    <div id="index_app" class="border">
     <div class="index" v-if="index_show">
         <iframe id="index_iframe" src="index_import.jsp" scrolling="no" style="border: 0;width: 100%;height: 100%"></iframe>
     </div>
     <div class="work_platform_data" v-else-if="test_data">
        <iframe src="data.jsp?testData=true&userMessageShow=false" scrolling="no" style="border: 0;width: 100%;height: 100%"></iframe>
     </div>
     <div v-else-if="userMessage">
         <iframe  src="userMessage.jsp" scrolling="no" style="border: 0;width: 100%;height: 100%"></iframe>
     </div>
    </div>
    <div class="bottom">
        <%@ include file="pubilc/bottom.jsp"%>
    </div>
</div>
</body>
<script src="https://unpkg.com/vue-router@4"></script>
<script src="js/indexpageshow.js"></script>
</html>
