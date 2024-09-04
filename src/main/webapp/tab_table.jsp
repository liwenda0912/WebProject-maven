<%--
  Created by IntelliJ IDEA.
  User: 10260
  Date: 2024/7/3
  Time: 17:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script src="//unpkg.com/vue@2/dist/vue.js"></script>
<script src="//unpkg.com/element-ui@2.15.14/lib/index.js"></script>
<link rel="stylesheet"  href="//unpkg.com/element-ui@2.15.14/lib/theme-chalk/index.css">
<body>
<div id="app_tabs" class="app_tabs_">
    <template>
     <el-tabs v-model="activeName" type="border-card" @tab-click="handleClick">
        <el-tab-pane label="配置管理" name="first">
            <div v-if="miniSetting">
                <iframe src="table/miniSetting.jsp"  scrolling="no" style="width: 100%;height:104%;border: 0" ></iframe>
            </div>
        </el-tab-pane>
        <el-tab-pane label="用户管理" name="second">
            <div v-if="userManage">
                <iframe src="table.jsp"  scrolling="no" style="width: 11960px;height:900px;border: 0" ></iframe>
            </div>
        </el-tab-pane>
        <el-tab-pane label="角色管理" name="third">
            <div v-if="roleManage">角色管理</div>
        </el-tab-pane>
        <el-tab-pane label="定时任务补偿" name="fourth">
            <div v-if="time_">定时任务补偿 </div>
        </el-tab-pane>
     </el-tabs>
    </template>
</div>
</body>
<style>
    body{
        margin: 0;
        padding: 0;
    }
    #app_tabs{
        margin: 20px 20px 20px 20px;
        box-shadow: 0 0 5px grey;

    }
    .el-tabs.el-tabs--top.el-tabs--border-card{
        height: 760px;
    }


</style>
<script src="./js/table.js"></script>
</html>
