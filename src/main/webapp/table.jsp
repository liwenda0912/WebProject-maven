<%--
  Created by IntelliJ IDEA.
  User: 10260
  Date: 2024/7/4
  Time: 10:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="app_table">
  <template>
    <el-table
            :data="tableData"
            style="width: 100%"
            height="560px">
      <el-table-column
              fixed
              prop="date"
              label="日期"
              width="150">
      </el-table-column>
      <el-table-column
              prop="name"
              label="姓名"
              width="120">
      </el-table-column>
      <el-table-column
              prop="province"
              label="省份"
              width="120">
      </el-table-column>
      <el-table-column
              prop="city"
              label="市区"
              width="120">
      </el-table-column>
      <el-table-column
              prop="address"
              label="地址"
              width="300">
      </el-table-column>
      <el-table-column
              prop="zip"
              label="邮编"
              width="120">
      </el-table-column>
      <el-table-column
              label="操作"
              width="100">
        <template slot-scope="scope">
          <el-button @click="handleClick(scope.row)" type="text" size="small">查看</el-button>
          <el-button type="text" size="small">编辑</el-button>
        </template>
      </el-table-column>
    </el-table>
  </template>
</div>
</body>
<script src="js/table.js"></script>
</html>
