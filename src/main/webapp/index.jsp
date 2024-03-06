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
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<html>

<head>
    <title>www.webapp.servlet.pop.com</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
    <script src="https://cdn.bootcdn.net/ajax/libs/vue-router/2.6.0/vue-router.js"></script>
    <!-- import Vue before Element -->
<%--    <script src="https://unpkg.com/vue@2/dist/vue.js"></script>--%>
<%--    <!-- import JavaScript -->--%>
<%--    <script src="https://unpkg.com/element-ui/lib/index.js"></script>--%>
    <script src="//unpkg.com/vue@2/dist/vue.js"></script>
    <script src="//unpkg.com/element-ui@2.15.14/lib/index.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>

<body>
<%String username = (String) request.getAttribute("username"); %>
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
        <div id="input-msg" >
           <div id ="app">
               <div v-if="name_show==1" id="app_relogin">
                   <p>{{name_show}}</p>
                   <button type="button" v-on:click="login_down()">退出登录</button>
               </div>
              <div v-else>
                  {{name_show}}
                  <form method="post" action="LoginServlet">
                      <iframe src="login_input.jsp" scrolling="no" height="320px" width="350px" style="border: 0">
                      </iframe>
                  </form>
              </div>
           </div>
        </div>
        <div id="show-msg">
            <%@include file="pubilc/uploadFile.jsp"%>
<%--            <iframe src="pubilc/uploadFile.jsp" scrolling="no" height="260px" width="800px" style="border: 0"></iframe>--%>
        </div>
    </div>
    <div id="app-1">
        <!-- Form -->
        <el-dialog title="注册" :visible.sync="dialogFormVisible" style="text-align: center">
            <el-form :model="form">
                <el-form-item label="账号" :label-width="formLabelWidth" >
                    <el-input v-model="form.name" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="密码" :label-width="formLabelWidth" >
                    <el-input v-model="form.passwd" autocomplete="off"></el-input>
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button type="primary" @click="registered()">注册</el-button>
                <el-button type="primary" @click="quit()">取消</el-button>
            </div>
        </el-dialog>
    </div>
    <div id="black">
    </div>
    <div class="bottom">
        <%@ include file="pubilc/bottom.jsp"%>
    </div>
</div>
</body>
<script src="https://unpkg.com/vue-router@4"></script>
<script src="js/login.js"></script>
</html>
