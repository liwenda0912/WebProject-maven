<%--
  Created by IntelliJ IDEA.
  User: 10260
  Date: 2024/1/26
  Time: 10:03
  To change this template use File | Settings | File Templates.

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <!-- import CSS -->
  <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">
</head>
<body>
<div style="color: aliceblue">
  <div id="app">
    <el-button @click="visible = true">Button</el-button>
    <el-dialog :visible.sync="visible" title="Hello world">
      <p>Try Element</p>
    </el-dialog>
  </div>
</div>

</body>
<!-- import Vue before Element -->
<script src="https://unpkg.com/vue@2/dist/vue.js"></script>
<!-- import JavaScript -->
<script src="https://unpkg.com/element-ui/lib/index.js"></script>
<script>
  new Vue({
    el: '#app',
    data: function() {
      // return { visible: true }
    }
  })
</script>
</html>
--%>
<template>
  <div v-show="isVisible">这是一个被v-show控制的元素</div>
</template>

<script>
  export default {
    data() {
      return {
        condition: true // 设置初始条件为true
      }
    },
    computed: {
      isVisible() {
        // 根据condition的值返回不同的结果
        return !!this.condition;
      }
    }
  }
</script>