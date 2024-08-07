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
<div id="app_uploadFile" style="display: flex;align-items: center;height: 271px;width: 360px">
    <el-upload ref = "load" class="upload-demo" drag action='??'
            multiple
            action=""
            :on-success="handleSuccess"
            :http-request="upload"
               accept=".xls"
               :on-change=handleChange
               >
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
        <div class="el-upload__tip" slot="tip">只能上传excel文件</div>
    </el-upload>
</div>
</body>
<script>
    new Vue({
        el:"#app_uploadFile",
        methods:{
            operations(type_message,data_message){
                this.$message({
                    message:data_message,
                    center:true,
                    type:type_message
                });
                if(type_message !== "success"){
                    this.$refs['load'].clearFiles()
                }
            },
            handleSuccess(rep, file,fileList){
                console.log(rep)
            },
            handleChange(file,fileList){
                this.ebsFileList = fileList;
                this.ebsErrorImport = '';
                if (fileList.length > 1) {
                    fileList.splice(0, 1);
                    // this.$message.error('只能上传一个文件');
                }
            },
            upload(file){
                    const File = file.file;
                    console.log(file)
                    let formData1 = new FormData();
                    formData1.append("file", File);
                axios({
                    method: 'post',
                    url: 'UploadServlet',
                    data:formData1,
                    headers:{
                        'content-type':'multipart/form-data'
                    }
                }).then(res=>{
                    var data = res.data;
                    switch (data.code){
                        case "200":
                            var name = document.getElementsByClassName("el-upload-list__item-status-label");
                            for (var i =0;i<name.length;i++){
                                name[i].style.display="block";
                                name[i].style.paddingTop="7px";
                            }
                            this.operations("success",data.message);
                            break;
                        case "404":
                            this.operations("error",data.message);
                            break;
                        case "501":
                            this.operations("error",data.message);
                            break;
                    }
                    console.log(data)
                    // if (data.code==="200"){
                    //     var name = document.getElementsByClassName("el-upload-list__item-status-label");
                    //     for (var i =0;i<name.length;i++){
                    //         name[i].style.display="block";
                    //         name[i].style.paddingTop="7px";
                    //     };
                    //     this.$message({
                    //         message:data.message,
                    //         center:true,
                    //         type:"success"
                    //     })
                    // }else if(data.code==="404"){
                    //     this.$message({
                    //         message: data.message,
                    //         center: true,
                    //         type:"error"
                    //     });
                    //     this.$refs['load'].clearFiles()
                    // }else if(data.code==="501"){
                    //     this.$message({
                    //         message: data.message,
                    //         center: true,
                    //         type:"error"
                    //     });
                    //     this.$refs['load'].clearFiles()
                    // }
                },err=>{
                    alert("系统错误");
                    console.log("");
                    this.$message({
                        message: "系统错误",
                        center: true,
                        type:"error"
                    });
                });
            }


        }
    })
</script>
<style>
    div .upload-demo{
        height: 200px;
    }
    #app_uploadFile{
        margin: auto;
    }
    ul.el-upload-list.el-upload-list--text li a i{
        height: 20px;
    }
    li.el-upload-list__item.is-ready:hover label.el-upload-list__item-status-label{
        display: none !important;
    }


</style>
</html>
