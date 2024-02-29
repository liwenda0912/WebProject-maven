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
  <el-result icon="error" title="输入的账号密码错误！请重新输入" subTitle="输入的账号密码错误！请重新输入" v-if="obj==error">
    <template slot="extra">
      <el-button type="primary" size="medium" @click="change_show()">返回</el-button>
    </template>
  </el-result>

  <el-result icon="success" title="登录成功" subTitle="登录成功！" v-else-if="obj==success">
    <template slot="extra">
      <el-button type="primary" size="medium" @click="change_show()">返回</el-button>
    </template>
  </el-result>
  <el-result icon="alert" title="信息提示" subTitle="请根据提示进行操作!" v-else="obj==alert">
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
  // console.log(obj)
  new Vue({
    el: '#app',
    data: {
      success:1,
      error:2,
      alert:0,
      obj:obj
    },
    methods: {
      change_show(){
        window.location.href="index.jsp";
        if (obj===this.success){
          localStorage.setItem("name",JSON.stringify(obj))
          console.log(JSON.parse(localStorage.getItem("name")))
        }
      }
    }
  })
</script>
</html>
