//监听iframe父页面传递的数据
import {request} from "./utils/request.js";

window.addEventListener("message",function(e) {
    console.log(e.data.split(":")[1])
    if(e.data.split(":")[0]==="page"){
        // User.$data.pageNum_1 =e.data.split(":")[1]
        User.$data.pageNum_1=e.data.split(":")[1]
    }else {
        User.$data.pageShowNum = parseInt(e.data.split(":")[1])
    }
}, false);

var User =new Vue({
    el:"#app_tabs",
    data() {
        return {
            // //时间选择器的数据
            // pickerOptions: {
            //     shortcuts: [{
            //         text: '今天',
            //         onClick(picker) {
            //             picker.$emit('pick', new Date());
            //         }
            //     }, {
            //         text: '昨天',
            //         onClick(picker) {
            //             const date = new Date();
            //             date.setTime(date.getTime() - 3600 * 1000 * 24);
            //             picker.$emit('pick', date);
            //         }
            //     }, {
            //         text: '一周前',
            //         onClick(picker) {
            //             const date = new Date();
            //             date.setTime(date.getTime() - 3600 * 1000 * 24 * 7);
            //             picker.$emit('pick', date);
            //         }
            //     }]
            // },
            activeNames:"",
            value3:"",
            input1:"",
            input2:'',
            loading:'',
            pageShowNum:10,
            pageNum_1:1,
            dialogVisible: false,
            dialogFormVisible: false,
            delivery: false,
            formLabelWidth: '120px',
            type:[],
            form:{
            },
            test:[],
        }
    },
    mounted(){
        this.loading=true
        this.onshow();
    },
    methods: {
        //控制列表的页面样式的方法
        handleChange(val) {
            console.log(val);
            if (val.length === 2){
                var name = window.parent.document.getElementsByClassName("border");
                for (var i =0;i<name.length;i++) {
                    name[i].style.height = "110%";
                }
            } else{
                var name = window.parent.document.getElementsByClassName("border");
                for (var i =0;i<name.length;i++) {
                    name[i].style.height = "104%";
                }
            }
        },
        //页面查看按钮的方法
        handleClick(row) {
            let self = this
            console.log(row);
            self.$data.type=row;
            this.dialogFormVisible=true;
        },
        //页面编辑按钮的方法
        edit(row){
            let self = this
            console.log(row);
            self.$data.type=row;
            this.dialogVisible=true;
        },
        // iframe的父传递信息给子页面传递数据的方法
        send(data){
            let frame_pagination= document.getElementById("iframe_pagination");
            frame_pagination.contentWindow.postMessage(data,'http://localhost:8086/mavenproject_war_exploded/pagination.jsp');
            frame_pagination.onload=function (){
                frame_pagination.contentWindow.postMessage(data,'http://localhost:8086/mavenproject_war_exploded/pagination.jsp');
                // frame_pagination.contentWindow.alert("jjjjdsf")
            }
        },
        // 编辑保持方法
        EditTable(type){
            request({
                method: 'Post',
                url: 'DataServlet',
                params: {
                    dbname:"user",
                },
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                data:type
            }).then(res=>{
                console.log(res.code)
                let  self = this
                if (res.data.code==="200"){
                    self.dialogVisible=false;
                    self.$message({
                        type:"success",
                        center: true,
                        message:res.data.message,
                    })
                }else {
                    self.$message({
                        type:"error",
                        center: true,
                        message:res.data.message,
                    })
                }
            },err=>{
                console.log(err.message);
                this.$message({
                    message:err.message,
                    type:"error",
                    center:true
                })
               setTimeout(()=>{
                   window.location.reload();
               },2000)
            });
        },
        //页面加载就获取数据
        onshow(){
            this.dialogVisible=false;
            this.dialogFormVisible=false;
            let self =this
            request({
                method: 'Get',
                url: 'DataServlet',
                params: {
                    dbname:"user",
                    pageNum:self.$data.pageNum_1,
                    pageSize:self.$data.pageShowNum
                }
            }).then(res=>{
                //获取用户servlet的登录请求响应
                 var data = res.data;
                 this.send(data[data.length-1]);
                 for (var i =0;i<data.length-1;i++){
                     this.test.push(data[i]);
                 }
                setTimeout(() => {
                    this.loading=false;
                }, 2000);
            },err=>{
                console.log(err.message);
                this.$message({
                    message:err.message,
                    type:"error",
                    center:true
                })
            });
        }
    },
    //监听函数
    watch:{
        //监听列表展示的数
        pageNum_1: function (newData,oldData){
            console.log(newData)
            if(newData!==oldData){
                this.loading=true
                this.test=[];
                this.onshow();
                console.log("new num")
            }
        },
        //监听列表页数
        pageShowNum:function (newData,oldData){
            console.log(newData)
            if(newData!==oldData){
                this.test=[];
                this.onshow();
                console.log("new pagenum")
            }
        }
    },

})
