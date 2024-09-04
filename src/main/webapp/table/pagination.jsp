<%--
  Created by IntelliJ IDEA.
  User: 10260
  Date: 2024/7/20
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link rel="stylesheet"  href="//unpkg.com/element-ui@2.15.14/lib/theme-chalk/index.css">
<script src="//unpkg.com/vue@2/dist/vue.js"></script>
<script src="//unpkg.com/element-ui@2.15.14/lib/index.js"></script>

<head>
    <title>Title</title>
</head>
<body>
<div class="block" id="app—pagination">
  <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="currentPage4"
          :page-sizes="[10, 15, 20]"
          :page-size="10"
          layout="total, sizes, prev, pager, next, jumper"
          :total="dataNum">
  </el-pagination>
</div>
</body>
<%--<style>--%>
<%--    .el-select-dropdown.el-popper{--%>
<%--        margin-top: 30px;--%>
<%--    }--%>
<%--</style>--%>
<script src="pagination.js"></script>
</html>
