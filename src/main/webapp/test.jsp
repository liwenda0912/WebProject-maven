<%--&lt;%&ndash;&lt;%&ndash;&ndash;%&gt;--%>
<%--&lt;%&ndash;  Created by IntelliJ IDEA.&ndash;%&gt;--%>
<%--&lt;%&ndash;  User: 10260&ndash;%&gt;--%>
<%--&lt;%&ndash;  Date: 2024/1/26&ndash;%&gt;--%>
<%--&lt;%&ndash;  Time: 10:03&ndash;%&gt;--%>
<%--&lt;%&ndash;  To change this template use File | Settings | File Templates.&ndash;%&gt;--%>
<%--&lt;%&ndash;&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;<%@ page contentType="text/html;charset=UTF-8" language="java" %>&ndash;%&gt;--%>
<%--&lt;%&ndash;<!DOCTYPE html>&ndash;%&gt;--%>
<%--<html>--%>
<%--<head>--%>
<%--  <meta charset="UTF-8">--%>
<%--  <!-- import CSS -->--%>
<%--  <link rel="stylesheet" type="text/css" href="css/index.css">--%>
<%--  <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">--%>
<%--  <link rel="stylesheet" href="//unpkg.com/element-ui@2.15.14/lib/theme-chalk/index.css">--%>
<%--  <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css">--%>
<%--</head>--%>
<%--<body>--%>
<%--<script src="//unpkg.com/vue@2/dist/vue.js"></script>--%>
<%--<script src="//unpkg.com/element-ui@2.15.14/lib/index.js"></script>--%>
<%--&lt;%&ndash;<div id="app">&ndash;%&gt;--%>
<%--&lt;%&ndash;  <el-input&ndash;%&gt;--%>
<%--&lt;%&ndash;          placeholder="请输入内容"&ndash;%&gt;--%>
<%--&lt;%&ndash;          v-model="input"&ndash;%&gt;--%>
<%--&lt;%&ndash;          clearable>&ndash;%&gt;--%>
<%--&lt;%&ndash;  </el-input>&ndash;%&gt;--%>
<%--&lt;%&ndash;  {{input}}&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--&lt;%&ndash;<script>&ndash;%&gt;--%>
<%--&lt;%&ndash;  var Main = {&ndash;%&gt;--%>
<%--&lt;%&ndash;    data() {&ndash;%&gt;--%>
<%--&lt;%&ndash;      return {&ndash;%&gt;--%>
<%--&lt;%&ndash;        input: ''&ndash;%&gt;--%>
<%--&lt;%&ndash;      }&ndash;%&gt;--%>
<%--&lt;%&ndash;    }&ndash;%&gt;--%>
<%--&lt;%&ndash;  }&ndash;%&gt;--%>
<%--&lt;%&ndash;  var Ctor = Vue.extend(Main)&ndash;%&gt;--%>
<%--&lt;%&ndash;  new Ctor().$mount('#app')&ndash;%&gt;--%>
<%--&lt;%&ndash;</script>&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;&ndash;%&gt;--%>
<%--&lt;%&ndash;<div style="color: aliceblue">&ndash;%&gt;--%>
<%--&lt;%&ndash;  <div id="app">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <el-button @click="visible = true">Button</el-button>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <el-dialog :visible.sync="visible" title="Hello world">&ndash;%&gt;--%>
<%--&lt;%&ndash;      <p>Try Element</p>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </el-dialog>&ndash;%&gt;--%>
<%--&lt;%&ndash;  </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--<div id ="app">--%>
<%--  <div v-if="name_show==1" id="app_relogin">--%>
<%--    <p>{{name_show}}</p>--%>
<%--    <button type="button" v-on:click="login_down()">退出登录</button>--%>
<%--  </div>--%>
<%--  <div v-else>--%>
<%--    <div id="APP_input">--%>
<%--      <el-form  :model="ruleForm" :rules="rules" ref="ruleForm" onsubmit="return false">--%>
<%--        <div id="input-name" >--%>
<%--          <el-form-item label="UserName:" prop="input">--%>
<%--            <el-input placeholder="请输入账号" v-model="ruleForm.input" clearable name="username" ></el-input>--%>
<%--          </el-form-item>--%>
<%--        </div>--%>
<%--        <div id="input-passwd">--%>
<%--          <el-form-item label="PassWord:" prop="input_passwd">--%>
<%--            <el-input placeholder="请输入密码" v-model="ruleForm.input_passwd" show-password name="passwd"></el-input>--%>
<%--            &lt;%&ndash;                              <label>&ndash;%&gt;--%>
<%--            &lt;%&ndash;                                  <input type="password" placeholder="请输入密码" name="passwd">&ndash;%&gt;--%>
<%--            &lt;%&ndash;                              </label>&ndash;%&gt;--%>
<%--          </el-form-item>--%>
<%--        </div>--%>
<%--        <div class="buttom_login">--%>
<%--          <el-form-item>--%>
<%--            <button  @click="submit('ruleForm')">Button</button>--%>
<%--          </el-form-item>--%>
<%--        </div>--%>
<%--      </el-form>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</div>--%>


<%--</body>--%>
<%--<script>--%>
<%--  var Min = new Vue({--%>
<%--    el: '#APP_input',--%>
<%--    data() {--%>
<%--      return {--%>
<%--        ruleForm: {--%>
<%--          input: '',--%>
<%--          input_passwd: '',--%>
<%--          submit_show: ''--%>
<%--        },--%>
<%--        rules: {--%>
<%--          input: [--%>
<%--            {required: true, message: '账户不能为空', trigger: 'blur'},--%>
<%--          ],--%>
<%--          input_passwd: [--%>
<%--            {required: true, message: '密码不能为空', trigger: 'blur'},--%>
<%--            {min: 8, max: 16, message: '密码长度为8到16位！', trigger: 'blur'}--%>
<%--          ]--%>
<%--        }--%>
<%--      }--%>
<%--    },--%>
<%--    methods: {--%>
<%--      submit(formName) {--%>
<%--        this.$refs[formName].validate((valid) => {--%>
<%--          if (valid) {--%>
<%--            return 0--%>
<%--          } else {--%>
<%--            console.log('error submit!!');--%>
<%--            return false;--%>
<%--          }--%>
<%--        });--%>
<%--      },--%>

<%--    }--%>
<%--  });--%>
<%--    let username =JSON.parse(localStorage.getItem("name"))--%>
<%--    var login = new Vue({--%>
<%--      data: {--%>
<%--        // isshow: true,--%>
<%--        // ishow: false,--%>
<%--        name_show: username--%>
<%--      },--%>
<%--      el: '#app',--%>
<%--      methods: {--%>
<%--        login_down() {--%>
<%--          localStorage.removeItem("name");--%>
<%--          this.$message({--%>
<%--            message: '退出登录成功！',--%>
<%--            center: true--%>
<%--          });--%>
<%--          setTimeout(() => {--%>
<%--            location.reload();--%>
<%--          }, 100)--%>
<%--        },--%>

<%--      }--%>
<%--    })--%>

<%--</script>--%>
<%--&lt;%&ndash;</body>&ndash;%&gt;--%>
<%--&lt;%&ndash;<!-- import Vue before Element -->&ndash;%&gt;--%>
<%--&lt;%&ndash;<script src="https://unpkg.com/vue@2/dist/vue.js"></script>&ndash;%&gt;--%>
<%--&lt;%&ndash;<!-- import JavaScript -->&ndash;%&gt;--%>
<%--&lt;%&ndash;<script src="https://unpkg.com/element-ui/lib/index.js"></script>&ndash;%&gt;--%>
<%--&lt;%&ndash;<script>&ndash;%&gt;--%>
<%--&lt;%&ndash;  new Vue({&ndash;%&gt;--%>
<%--&lt;%&ndash;    el: '#app',&ndash;%&gt;--%>
<%--&lt;%&ndash;    data: function() {&ndash;%&gt;--%>
<%--&lt;%&ndash;      // return { visible: true }&ndash;%&gt;--%>
<%--&lt;%&ndash;    }&ndash;%&gt;--%>
<%--&lt;%&ndash;  })&ndash;%&gt;--%>
<%--&lt;%&ndash;</script>&ndash;%&gt;&ndash;%&gt;--%>
<%--</html>--%>
<%--&lt;%&ndash;&ndash;%&gt;&ndash;%&gt;--%>


<div id="app">
  <h1>To-Do List</h1>
  <ul>
    <li>
      <to-do-item></to-do-item>
    </li>
  </ul>
</div>
<script>
  import ToDoItem from "./components/ToDoItem.vue";
  export default {
    name: "app",
    components: {
      ToDoItem,
    },
  };
</script>