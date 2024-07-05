<%--
  Created by IntelliJ IDEA.
  User: 10260
  Date: 2024/1/18
  Time: 9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script src="//unpkg.com/vue@2/dist/vue.js"></script>
<script src="//unpkg.com/element-ui@2.15.14/lib/index.js"></script>
<link rel="stylesheet" href="https://unpkg.com/element-ui@2.15.14/lib/theme-chalk/index.css">
<head>
    <title>uploadFile</title>
</head>
<body>
<%--<form method="post" action="UploadServlet" enctype="multipart/form-data">--%>
<%--  选择一个文件:--%>
<%--  <input type="file" name="uploadFile" />--%>
<%--  <br/><br/>--%>
<%--  <input type="submit" value="上传" />--%>
<%--</form>--%>
<div id="app_uploadFile" style="display: flex;align-items: center;height: 271px;width: 360px">
    <el-upload
            class="upload-demo"
            drag
            action="https://cors-anywhere.herokuapp.com/https://jsonplaceholder.typicode.com/posts/"
            multiple>
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
        <div class="el-upload__tip" slot="tip">只能上传jpg/png文件，且不超过500kb</div>
    </el-upload>
</div>
</body>
<script>
    new Vue().$mount('#app_uploadFile')

</script>
<style>
    div .upload-demo{
        height: 200px;
    }
    #app_uploadFile{
        margin: auto;
    }
    ul.el-upload-list.el-upload-list--text li a {
        height: 24px;
        display: block;
    }
    ul.el-upload-list.el-upload-list--text li a i{
        height: 20px;
    }

</style>
</html>
