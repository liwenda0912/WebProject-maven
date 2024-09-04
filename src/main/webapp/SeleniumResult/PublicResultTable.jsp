<%--
  Created by IntelliJ IDEA.
  User: 10260
  Date: 2024/8/29
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page isELIgnored="false" %>
<script src="//unpkg.com/vue@2/dist/vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="//unpkg.com/element-ui@2.15.14/lib/index.js"></script>
<link rel="stylesheet"  href="//unpkg.com/element-ui@2.15.14/lib/theme-chalk/index.css">
<%--<link rel="stylesheet" type="text/css" href="css/userMessage.css">--%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="tab_userMessage">
    <div class="table-style" id="public_tabs">
        <el-collapse v-model="activeNames" @change="handleChange">
            <el-collapse-item title="搜索" name="1">
                <div class="demo-input-size">
                    <el-date-picker
                            v-model="value3"
                            type="datetime"
                            placeholder="选择日期时间"
                            default-time="12:00:00">
                    </el-date-picker>
                    <el-input
                            placeholder="id"
                            suffix-icon="el-icon-date"
                            v-model="input1">
                    </el-input>
                    <el-input
                            placeholder="set_type"
                            suffix-icon="el-icon-date"
                            v-model="input2">
                    </el-input>
                </div>
            </el-collapse-item>
        </el-collapse>
        <el-table
                border
                v-loading="loading"
                :data="test"
                style="width: 100%"
                height="560px">
            <el-table-column
                    fixed
                    prop="test_date"
                    label="测试时间"
                    width="150">
            </el-table-column>
            <el-table-column
                    prop="test_name"
                    label="测试名称"
                    width="120">
            </el-table-column>
            <el-table-column
                    prop="test_people"
                    label="测试人"
                    width="120">
            </el-table-column>
            <el-table-column
                    prop="test_data"
                    label="测试数据"
                    width="300">
            </el-table-column>
            <el-table-column
                    prop="test_result"
                    label="测试结果"
                    width="120">
            </el-table-column>
            <el-table-column
                    fixed="right"
                    label="操作"
                    width="200">
                <template slot-scope="scope">
                    <div class="cell_button">
                        <el-button @click="handleClick(scope.row)" type="text" size="small" icon="el-icon-search">查看</el-button>
                        <el-button type="text" size="small" icon="el-icon-edit" @click="edit(scope.row)">详情</el-button>
                    </div>
                </template>
            </el-table-column>
        </el-table>
        <div style="height: 60px;">
            <iframe id="iframe_selenium_pagination" src="http://localhost:8086/mavenproject_war_exploded/table/pagination.jsp" scrolling="no" style="width: 11960px;border: 0;position: fixed;height: 200px"></iframe>
        </div>

        <!-- dialog-->
        <el-dialog title="测试结果详情" :visible.sync="dialogFormVisible" >
            <el-descriptions title="垂直带边框列表" direction="vertical" :column="4" border>
                <el-descriptions-item label="测试时间">{{type.test_date}}</el-descriptions-item>
                <el-descriptions-item label="测试名称">{{type.test_name}}</el-descriptions-item>
                <el-descriptions-item label="测试人" >{{type.test_people}}</el-descriptions-item>
                <el-descriptions-item label="测试数据">
                    <el-tag size="small">学校</el-tag>
                    {{type.test_data}}
                </el-descriptions-item>
                <el-descriptions-item label="测试结果">{{type.test_result}}</el-descriptions-item>
            </el-descriptions>

            <div slot="footer" class="dialog-footer">
                <el-button @click="dialogFormVisible = false">取 消</el-button>
                <el-button type="primary" @click="dialogFormVisible = false">确 定</el-button>
            </div>
        </el-dialog>
        <el-dialog title="修改setting信息" :visible.sync="dialogVisible">
            <el-form :model="form">
                <el-form-item label="test_date：" :label-width="formLabelWidth">
                    <el-input v-model="type.test_date" autocomplete="off" :disabled="true"></el-input>
                </el-form-item>
                <el-form-item label="test_name：" :label-width="formLabelWidth">
                    <el-input v-model="type.test_name" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="test_people" :label-width="formLabelWidth">
                    <el-input v-model="type.test_people" autocomplete="off" ></el-input>
                </el-form-item>
                <el-form-item label="test_data：" :label-width="formLabelWidth">
                    <el-input v-model="type.test_data" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="test_result：" :label-width="formLabelWidth">
                    <el-input v-model="type.test_result" autocomplete="off"></el-input>
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="dialogVisible = false">取 消</el-button>
                <el-button type="primary" @click="editButtom(type)">确 定</el-button>
            </div>
        </el-dialog>
    </div>
</div>
<style>
    div.cell_button{
        width:200px;
        margin:0;
    }
    .el-button+.el-button{
        margin-left: 0;
    }
    .el-table--border th.el-table__cell{
        background-color: #DDDDDD;
    }
    .demo-input-size{
        float: right;
    }
    .el-input.el-input--suffix{
        width: 200px;
    }
    .el-input.el-input--medium.el-input--suffix{
        width: 200px;
    }
    .el-collapse-item__content{
        height: 30px;
    }
</style >
<script src="../js/utils/TimePickerOption.js"></script>
<script type="module" src="js/pubilcResultTable.js">
</script>
</body>
</html>

