<%--
  Created by IntelliJ IDEA.
  User: 10260
  Date: 2024/2/4
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%--<link rel="stylesheet" href="//unpkg.com/element-ui@2.15.14/lib/theme-chalk/index.css">--%>
<%--<script src="//unpkg.com/vue@2/dist/vue.js"></script>--%>
<%--<script src="//unpkg.com/element-ui@2.15.14/lib/index.js"></script>--%>
  <!-- import CSS :action="ruleForm.input_servlet" method="post" -->
<html>
<head>
  <title>input</title>
  <link rel="stylesheet" href="https://unpkg.com/element-ui@2.15.14/lib/theme-chalk/index.css">
  <script src="https://unpkg.com/vue@2/dist/vue.js"></script>
  <script src="https://unpkg.com/element-ui@2.15.14/lib/index.js"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<style>
  *{
    padding: 0;
    margin: 0;
  }
  .buttom_show{
    padding-left: 120px;
  }
  button:active{
    background-color: cadetblue;
    box-shadow: 0 0 10px cadetblue;
    transform: translateY(4px);
  }
  .bottom_register{
    margin: 0;
    padding-left: 136px;
  }
</style>
<body>
<div id="APP_input" >
  <el-form :model="ruleForm" :rules="rules" ref="ruleForm">
  <div id="input-name" >
      <el-form-item label="UserName:" prop="input">
        <el-input placeholder="请输入账号" v-model="ruleForm.input" clearable name="username" ></el-input>
      </el-form-item>
  </div>
  <div id="input-passwd">
    <el-form-item label="PassWord:" prop="input_passwd">
      <el-input placeholder="请输入密码" v-model="ruleForm.input_passwd" show-password name="passwd"></el-input>
      <%--                              <label>--%>
      <%--                                  <input type="password" placeholder="请输入密码" name="passwd">--%>
      <%--                              </label>--%>
    </el-form-item>
  </div>
  <div class="buttom_login">
    <el-form-item class="buttom_show" style="margin: 0">
      <el-button type="primary"  @click="submit('ruleForm')" >登录</el-button>
    <%--      <button  ">Button</button>--%>
    </el-form-item>
  </div>
  </el-form>
</div>
<div id="app-2" class="bottom_register">
  <el-button type="text" @click="register()">注 册</el-button>
</div>
</body>
<script src="./js/input.js" type="module"></script>
</html>

