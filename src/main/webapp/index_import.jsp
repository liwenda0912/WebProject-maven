<%--
  Created by IntelliJ IDEA.
  User: 10260
  Date: 2024/7/4
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="css/index.css">
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>
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
        <div id ="app_login">
            <div v-if="name_show==1" id="app_relogin" style="margin: auto">
                <el-avatar style="height: 80px;width: 80px;line-height: 5"> {{name_show}} </el-avatar>
                <p>欢迎用户{{name_show}}登录！</p>
                <el-button type="primary" @click="login_down()">退出登录</el-button>
            </div>
            <div v-else>
                <form method="post" action="LoginServlet" target="index_iframe">
                    <iframe src="login_input.jsp" scrolling="no" height="320px" width="350px" style="border: 0;margin: 5px">
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
    <el-dialog title="注册" :visible.sync="dialogFormVisible" style="text-align: center" :show-close="false" :center="true">
        <el-form :model="form">
            <el-form-item label="账号" :label-width="formLabelWidth" prop="input" >
                <el-input v-model="form.user_name" autocomplete="off" clearable ref="user"></el-input>
            </el-form-item>
            <el-form-item label="密码" :label-width="formLabelWidth" prop="input_passwd">
                <el-input v-model="form.register_passwd" autocomplete="off" clearable   show-password ref="passwd"></el-input>
            </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
            <el-button-group>
            <el-button type="primary" @click="registered()">注册</el-button>
            <el-button type="primary" @click="quit()">取消</el-button>
            </el-button-group>
        </div>
    </el-dialog>
</div>
<div id="black">
</div>
<script src="js/login.js"></script>
<style>
    .border-bar{
        margin-top: 10px;
    }
</style>
</body>
</html>
