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
            loading:'',
            pageShowNum:7,
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
        },
        send(data){
            let frame_pagination= document.getElementById("iframe_pagination");
            frame_pagination.contentWindow.postMessage(data,'http://localhost:8086/mavenproject_war_exploded/pagination.jsp');
            frame_pagination.onload=function (){
                frame_pagination.contentWindow.postMessage(data,'http://localhost:8086/mavenproject_war_exploded/pagination.jsp');
                // frame_pagination.contentWindow.alert("jjjjdsf")
            }
        }
        ,
        onshow(){
            let self =this
            axios({
                method: 'Get',
                url: 'userServlet',
                params: {
                    dbname:"users",
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
                console.log(err);
            });
        }
    },watch:{
        pageNum_1: function (newData,oldData){
            console.log(newData)
            if(newData!==oldData){
                this.loading=true
                this.test=[];
                this.onshow();
                console.log("new num")
            }
        },
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
