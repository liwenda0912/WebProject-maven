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
    <link rel="stylesheet" href="//unpkg.com/element-ui@2.15.14/lib/theme-chalk/index.css">
    <script src="//unpkg.com/vue@2/dist/vue.js"></script>
    <script src="//unpkg.com/element-ui@2.15.14/lib/index.js"></script>
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
           <div id = app>
               <div v-if="name_show==1" id="app_relogin">
                   <p>{{name_show}}</p>
                   <button @click="login_down()">退出登录</button>
               </div>
              <div v-else>
                  <form action="LoginServlet" method="post">
                      <div id="input-name">
                          UserName:
                          <label>
<%--                              <el-input placeholder="请输入账号" v-model="input" clearable name="username" type="text"></el-input>--%>
                              <input type="text" placeholder="请输入名字" name="username">
                          </label>
                      </div>
                      <div id="input-passwd">
                          PassWord:
                          <label>
<%--                              <el-input placeholder="请输入密码" v-model="input" show-password name="passwd" type="password"></el-input>--%>
                              <input type="password" placeholder="请输入密码" name="passwd">
                              {{name_show}}
                          </label>
                      </div>
                      <div class="buttom_login">
                          <button @click="change_show()">Button</button>
                      </div>
                  </form>
              </div>

           </div>
        </div>
        <div id="show-msg">
            <%@include file="pubilc/uploadFile.jsp"%>
        </div>
    </div>

    <div id="black"></div>
    <div class="bottom">
        <%@ include file="pubilc/bottom.jsp"%>
    </div>
</div>
</body>
<!-- import Vue before Element -->
<script src="https://unpkg.com/vue@2/dist/vue.js"></script>
<!-- import JavaScript -->
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
<script>

    let name =JSON.parse(localStorage.getItem("name"))
    new Vue({
        el: '#app',
        data:{
            // isshow: true,
            // ishow: false,
            name_show:name
        },
        methods:{
            change_show(){
            },
            login_down(){
                localStorage.removeItem("name");
                this.$message({
                    message: '退出登录成功！',
                    center: true
            });
                setTimeout(()=>{
                    location.reload();
                },100)}
           },

    })

</script>
</html>
