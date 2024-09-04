<%--
  Created by IntelliJ IDEA.
  User: 10260
  Date: 2024/8/29
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="app_tabs" class="app_tabs_">
    <el-tabs type="border-card">
        <el-tab-pane label="用户管理">
            <iframe src="PublicResultTable.jsp"  scrolling="no" style="width: 100%;height:100%;border: 0"></iframe>
        </el-tab-pane>
        <el-tab-pane label="配置管理">
            <iframe src="PublicResultTable.jsp"  scrolling="no" style="width: 100%;height:100%;border: 0"></iframe>
        </el-tab-pane>
        <el-tab-pane label="角色管理">
            <iframe src="PublicResultTable.jsp"  scrolling="no" style="width: 100%;height:100%;border: 0"></iframe>
        </el-tab-pane>
    </el-tabs>
</div>
</body>
</html>
