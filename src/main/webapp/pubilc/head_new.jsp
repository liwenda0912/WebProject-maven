<%--
  Created by IntelliJ IDEA.
  User: 10260
  Date: 2024/7/2
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script src="//unpkg.com/vue@2/dist/vue.js"></script>
<script src="//unpkg.com/element-ui@2.15.14/lib/index.js"></script>
<link rel="stylesheet"  href="//unpkg.com/element-ui@2.15.14/lib/theme-chalk/index.css">


<head>
  <title>Title</title>
</head>
<body>
<div id="app_head">
  <div class="head_element">
    <el-menu
            :default-active="activeIndex2"
            class="el-menu-demo"
            mode="horizontal"
            @select="handleSelect"
            background-color="#545c64"
            text-color="#fff"
            active-text-color="#ffd04b">
      <el-menu-item index="1">首页</el-menu-item>
      <el-submenu index="2">
        <template slot="title">我的工作台</template>
        <el-menu-item index="2-1">测试用例</el-menu-item>
        <el-menu-item index="2-2">测试计划</el-menu-item>
        <el-menu-item index="2-3">测试报告</el-menu-item>
        <el-submenu index="2-4">
          <template slot="title">测试脚本</template>
          <el-menu-item index="2-4-1">测试数据</el-menu-item>
          <el-menu-item index="2-4-2">测试脚本</el-menu-item>
          <el-menu-item index="2-4-3">测试结果</el-menu-item>
        </el-submenu>
      </el-submenu>
      <el-menu-item index="3" disabled>消息中心</el-menu-item>
      <el-menu-item index="4">用户管理</el-menu-item>
      <el-menu-item index="5"><a href="https://www.ele.me" target="_blank">饿了么</a></el-menu-item>
    </el-menu>
  </div>
</div>
</body>
<script>
  var Head = new Vue({
  el: '#app_head',
  data() {
    return {
      activeIndex: '1',
      activeIndex2: '1'
    };
  },
  methods: {
    //进行导航传参
    handleSelect(key, keyPath) {
      // console.log(key, keyPath)
      //     console.log(key)
          window.top.postMessage(key, '*');
    }
  }
})</script>
</html>
