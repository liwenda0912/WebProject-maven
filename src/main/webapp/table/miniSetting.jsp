<%--
  Created by IntelliJ IDEA.
  User: 10260
  Date: 2024/8/3
  Time: 15:27
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
    <div class="table-style" id="app_tabs">
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
                            prop="setting_id"
                            label="setting_id"
                            width="150">
                    </el-table-column>
                    <el-table-column
                            prop="set_key"
                            label="set_key"
                            width="120">
                    </el-table-column>
                    <el-table-column
                            prop="set_value"
                            label="set_value"
                            width="300">
                    </el-table-column>
                    <el-table-column
                            prop="set_remark"
                            label="set_remark"
                            width="120">
                    </el-table-column>
                    <el-table-column
                            prop="state"
                            label="state"
                            width="120">
                    </el-table-column>
                    <el-table-column
                            prop="set_code"
                            label="set_code"
                            width="120">
                    </el-table-column>
                    <el-table-column
                            prop="tenant_id"
                            label="tenant_id"
                            width="120">
                    </el-table-column>
                    <el-table-column
                            prop="create_time"
                            label="create_time"
                            width="120">
                    </el-table-column>
                    <el-table-column
                            prop="set_type"
                            label="set_type"
                            width="120">
                    </el-table-column>
                    <el-table-column
                            prop="set_version"
                            label="set_version"
                            width="120">
                    </el-table-column>
                    <el-table-column
                            fixed="right"
                            label="操作"
                            width="200">
                        <template slot-scope="scope">
                            <div class="cell_button">
                                <el-button @click="handleClick(scope.row)" type="text" size="small" icon="el-icon-search">查看</el-button>
                                <el-button type="text" size="small" icon="el-icon-edit" @click="edit(scope.row)">编辑</el-button>
                                <el-button type="text" size="small" icon="el-icon-edit—pwd" @click="edit(scope.row)">修改密码</el-button>
                            </div>
                        </template>
                    </el-table-column>
                </el-table>
                <div style="height: 60px;">
                    <iframe id="iframe_pagination" src="http://localhost:8086/mavenproject_war_exploded/table/pagination.jsp" scrolling="no" style="width: 11960px;border: 0;position: fixed;height: 200px"></iframe>
                </div>

        <!-- dialog-->
        <el-dialog title="用户信息" :visible.sync="dialogFormVisible" >
            <div style="font-size: 15px;margin: 5px 5px" >
                <p>id：{{type.setting_id}}</p>
                <p>key：{{type.set_key}}</p>
                <p>value：{{type.set_value}}</p>
                <p>remark：{{type.set_remark}}</p>
                <p>state：{{type.state}}</p>
                <p>code：{{type.set_code}}</p>
                <p>tenantId：{{type.tenant_id}}</p>
                <p>createTime：{{type.create_time}}</p>
                <p>TYPE：{{type.set_type}}</p>
                <p>version:{{type.set_version}}</p>
            </div>
            <div slot="footer" class="dialog-footer">
                <el-button @click="dialogFormVisible = false">取 消</el-button>
                <el-button type="primary" @click="dialogFormVisible = false">确 定</el-button>
            </div>
        </el-dialog>
        <el-dialog title="修改setting信息" :visible.sync="dialogVisible">
            <el-form :model="form">
                <el-form-item label="setting_id：" :label-width="formLabelWidth">
                    <el-input v-model="type.setting_id" autocomplete="off" :disabled="true"></el-input>
                </el-form-item>
                <el-form-item label="set_key：" :label-width="formLabelWidth">
                    <el-input v-model="type.set_key" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="set_value：" :label-width="formLabelWidth">
                    <el-input v-model="type.set_value" autocomplete="off" ></el-input>
                </el-form-item>
                <el-form-item label="set_remark：" :label-width="formLabelWidth">
                    <el-input v-model="type.set_remark" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="state：" :label-width="formLabelWidth">
                    <el-input v-model="type.state" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="set_code：" :label-width="formLabelWidth">
                    <el-input v-model="type.set_code" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="tenant_id：" :label-width="formLabelWidth">
                    <el-input v-model="type.tenant_id" autocomplete="off" ></el-input>
                </el-form-item>
                <el-form-item label="create_time：" :label-width="formLabelWidth">
                    <el-input v-model="type.create_time" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="set_type：" :label-width="formLabelWidth">
                    <el-input v-model="type.set_type" autocomplete="off"></el-input>
                </el-form-item>
                <el-form-item label="set_version：" :label-width="formLabelWidth">
                    <el-input v-model="type.set_version" autocomplete="off"></el-input>
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
</style>
<script src="../js/utils/TimePickerOption.js"></script>
<script type="module"  src="miniSetting.js"></script>
</body>
</html>

