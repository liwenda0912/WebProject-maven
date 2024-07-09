<%--
  Created by IntelliJ IDEA.
  User: 10260
  Date: 2024/3/11
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page isELIgnored="false" %>
<script src="//unpkg.com/vue@2/dist/vue.js"></script>
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
        <el-tabs type="border-card">
            <el-tab-pane label="用户管理">
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
                            <div class="cell_button">
                                <el-button @click="handleClick(scope.row)" type="text" size="small" icon="el-icon-search">查看</el-button>
                                <el-button type="text" size="small" icon="el-icon-edit" @click="edit(scope.row)">编辑</el-button>
                            </div>
                        </template>
                    </el-table-column>
                </el-table>
            </el-tab-pane>
        </el-tabs>
        <!-- dialog-->
        <el-dialog title="用户信息" :visible.sync="dialogFormVisible" >
            <div style="font-size: 15px;margin: 5px 5px" >
                <p>姓名：{{type.name}}</p>
                <p>地址：{{type.address}}</p>
                <p>日期：{{type.date}}</p>
                <p>邮编：{{type.zip}}</p>
                <p>省份：{{type.province}}</p>
                <p>城市：{{type.city}}</p>
            </div>
            <div slot="footer" class="dialog-footer">
                <el-button @click="dialogFormVisible = false">取 消</el-button>
                <el-button type="primary" @click="dialogFormVisible = false">确 定</el-button>
            </div>
        </el-dialog>
        <el-dialog title="修改用户信息" :visible.sync="dialogVisible">
                <el-form :model="form">
                    <el-form-item label="姓名：" :label-width="formLabelWidth">
                        <el-input v-model="type.name" autocomplete="off" :disabled="true"></el-input>
                    </el-form-item>
                    <el-form-item label="地址：" :label-width="formLabelWidth">
                        <el-input v-model="type.address" autocomplete="off"></el-input>
                    </el-form-item>
                    <el-form-item label="日期：" :label-width="formLabelWidth">
                        <el-input v-model="type.date" autocomplete="off" :disabled="true"></el-input>
                    </el-form-item>
                    <el-form-item label="邮编：" :label-width="formLabelWidth">
                        <el-input v-model="type.zip" autocomplete="off"></el-input>
                    </el-form-item>
                    <el-form-item label="省份：" :label-width="formLabelWidth">
                        <el-select v-model="type.province" placeholder="请选择活动区域">
                            <el-option label="区域一" value="shanghai"></el-option>
                            <el-option label="区域二" value="beijing"></el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="城市：" :label-width="formLabelWidth">
                        <el-input v-model="type.city" autocomplete="off"></el-input>
                    </el-form-item>
                </el-form>
                <div slot="footer" class="dialog-footer">
                    <el-button @click="dialogFormVisible = false">取 消</el-button>
                    <el-button type="primary" @click="dialogFormVisible = false">确 定</el-button>
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

</style>
<script >
    var User = {
        methods: {
            handleClick(row) {
                let self = this
                console.log(row);
                self.$data.type=row;
                this.dialogFormVisible=true;
            },
            edit(row){
                let self = this
                console.log(row);
                self.$data.type=row;
                this.dialogVisible=true;
            }
        },
        data() {
            return {
                dialogVisible: false,
                dialogFormVisible: false,
                delivery: false,
                type:[],
                formLabelWidth: '120px',
                tableData: [{
                    date: '2016-05-02',
                    name: '王小虎',
                    province: '上海',
                    city: '普陀区',
                    address: '上海市普陀区金沙江路 1518 号',
                    zip: 200333
                }, {
                    date: '2016-05-04',
                    name: 'xiaolong',
                    province: '上海',
                    city: '普陀区',
                    address: '上海市普陀区金沙江路 1517 号',
                    zip: 200333
                }, {
                    date: '2016-05-01',
                    name: 'fuxiang',
                    province: '上海',
                    city: '普陀区',
                    address: '上海市普陀区金沙江路 1519 号',
                    zip: 200333
                }, {
                    date: '2016-05-03',
                    name: 'liwenda',
                    province: '上海',
                    city: '普陀区',
                    address: '上海市普陀区金沙江路 1516 号',
                    zip: 200333
                }]
            }
        }
    }
    var Ctor = Vue.extend(User)
    new Ctor().$mount('#app_tabs')
</script>
</body>
</html>
