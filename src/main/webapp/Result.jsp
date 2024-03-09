<%--
  Created by IntelliJ IDEA.
  User: 10260
  Date: 2024/1/26
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="//unpkg.com/element-ui@2.15.14/lib/theme-chalk/index.css">
<link rel="stylesheet" href="css/result.css">
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="app">
  <el-result icon="error" :title="message_1" subTitle="失败" v-if="obj==error">
    <template slot="extra">
      <el-button type="primary" size="medium" @click="change_show()">返回</el-button>
    </template>
  </el-result>
  <el-result icon="success" :title="message_1" subTitle="成功" v-else-if="obj==success">
    <template slot="extra">
      <el-button type="primary" size="medium" @click="change_show()">返回</el-button>
    </template>
  </el-result>
  <el-result icon="alert" :title="message_1" subTitle="消息提示" v-else="obj==alert">
    <template slot="extra">
      <el-button type="primary" size="medium" @click="change_show()">返回</el-button>
    </template>
  </el-result>
</div>
</body>
<!-- import Vue before Element -->
<script src="//unpkg.com/vue@2/dist/vue.js"></script>
<script src="//unpkg.com/element-ui@2.15.14/lib/index.js"></script>

<script>
  let search = window.location.search;
  let urlParams = new URLSearchParams(search);
  let obj = JSON.parse(urlParams.get('data'));
  let obj_message_login = urlParams.get('message');
  console.log("状态码："+obj,"这是信息："+obj_message_login)
  new Vue({
    el: '#app',
    data: {
      success:1,
      error:2,
      alert:0,
      obj:obj,
      message_1:obj_message_login
    },
    methods: {
      change_show(){
        window.location.href="index.jsp";
        if (obj===this.success){
          localStorage.setItem("name",JSON.stringify(obj))
          console.log(JSON.parse(localStorage.getItem("name")))
        }
      },
      render:{
        document
      }
    }
  })
</script>
</html>
