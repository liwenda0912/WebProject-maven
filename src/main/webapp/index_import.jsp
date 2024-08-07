<%--
  Created by IntelliJ IDEA.
  User: 10260
  Date: 2024/7/4
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="//unpkg.com/vue@2/dist/vue.js"></script>
<script src="//unpkg.com/element-ui@2.15.14/lib/index.js"></script>
<link rel="stylesheet" type="text/css" href="css/index.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.0.0/crypto-js.min.js"></script>
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
            <div v-if="name_show==1" id="app_relogin" style="margin-top: 60px;
   text-align: center;
    height: 50%;">
                <el-avatar style="height: 80px;width: 80px;line-height: 80px"> {{name_show}} </el-avatar>
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
        <form action="UploadServlet">
            <%@include file="pubilc/uploadFile.jsp"%>
        </form>
        <%--            <iframe src="pubilc/uploadFile.jsp" scrolling="no" height="260px" width="800px" style="border: 0"></iframe>--%>
    </div>
</div>
<div id="app-1">
    <!-- Form -->
    <transition name="el-zoom-in-bottom">
    <el-dialog title="注册" :visible.sync="dialogFormVisible" style="text-align: center" :show-close="false" :center="true">
        <el-form :model="ruleForm" :rules="rules" ref="ruleForm">
            <el-form-item label="账号:" :label-width="formLabelWidth" prop="user_name" >
                <el-input v-model="ruleForm.user_name" autocomplete="off" clearable ref="user"></el-input>
            </el-form-item>
            <el-form-item label="密码:" :label-width="formLabelWidth" prop="register_passwd">
                <el-input v-model="ruleForm.register_passwd" autocomplete="off" clearable   show-password ref="passwd"></el-input>
            </el-form-item>
            <div  class="dialog-footer" style="text-align: center">
                <el-form-item>
                    <el-button type="primary" @click="registered('ruleForm')">注册</el-button>
                    <el-button type="primary" @click="quit()">取消</el-button>
                </el-form-item>
            </div>
        </el-form>
    </el-dialog>
    </transition>
</div>
<div id="black">
</div>
<script src="js/login.js"></script>
<style>
    .border-bar{
        margin-top: 10px;
    }
    .dialog-footer button{
        box-shadow: 0 0 8px grey;
    }
</style>
</body>
</html>
