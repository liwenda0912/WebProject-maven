let username =JSON.parse(localStorage.getItem("name"))
// 监听indexPageshow.js父页面的通讯
window.addEventListener("message",function(e){
    console.log(e.data)
    if(e.data===1){
        login.$data.stateCode = e.data;
        console.log(e.data); // message
    }
    else if(e.data===2){
        test.$data.dialogCode= e.data;
        console.log("申请注册"+e.data); // message

    }
    else if (e.data===3){
        test.$data.dialogCode= e.data;
        console.log("取消注册"+e.data); // message
    }
    else if (e.data===4){
        test.$data.dialogCode= e.data;
        console.log("取消注册"+e.data); // message
    }

}, false);


//登录请求服务js
var login = new Vue({
    data: {
        receive_name:'',
        receive_img:'',
        name_show: username,
        stateCode:0,
    },
    el: '#app_login',
    methods: {
        login_down() {
            localStorage.removeItem("name");
            this.$message({
                message: '退出登录成功！',
                center: true
            });

            setTimeout(() => {
                location.reload();
            }, 100);
        },
        test: function () {
            this.$router.push({path: '/Result'})
        }
    },watch:{
        stateCode: function (newData,oldData){
            let self=this
            let name=JSON.parse(localStorage.getItem("username"));
            let input_passwd = JSON.parse(localStorage.getItem("passwd"));
            if (newData===1){
                console.log(name);
                console.log(input_passwd)
                axios({
                    method: 'Post',
                    url: 'LoginServlet',
                    params: {
                        username:name,
                        passwd:input_passwd
                    }
                }).then(res=>{
                    var data = res.data;
                    console.log(res.data+"   "+data.notice+data.message_login);
                    window.location.href=("Result.jsp?data="+data.notice+"&message="+data.message_login)
                },err=>{
                    console.log(err);
                });
                localStorage.removeItem("username");
                localStorage.removeItem("passwd");
            }
        }
    }

});

// 获取input.js通讯的注册按钮点击状态
// window.addEventListener("message",function(e){
//     let self =this
//     console.log(e.data)
//     if(e.data==='2'){
//         test.$data.dialogCode= e.data;
//     }
//     else if (e.data==='0'){
//         test.$data.dialogCode= e.data;
//     }
// }, false);

// 注册弹窗js
var test = new Vue({
    data() {
        return {
            dialogFormVisible: false,
            dialogCode:0,
            form: {
                user_name: '',
                register_passwd: '',
                region: '',
                date1: '',
                date2: '',
                delivery: false,
                type: [],
                resource: '',
                desc: ''
            },
            formLabelWidth: '120px'
        };
    },
    el: '#app-1',
    watch: {
        dialogCode: function (newData, oldData) {
            let self=this
            console.log("监听"+newData)
            if (newData===2){
                self.$data.dialogFormVisible=true
            }else{
                self.$data.dialogFormVisible=false
            }
        }
    },
    methods: {
        registered: function () {
            let self=this
            window.top.postMessage("resetState", '*');
            axios({
                method: 'Post',
                url: 'RegisterServlet',
                params: {
                    username:self.form.user_name,
                    passwd:self.form.register_passwd
                }
            }).then(res=>{
                var data = res.data;
                console.log(data)
                console.log(self.form.user_name+self.form.register_passwd+data.message_register)
                console.log(res.data+"   "+data.notice);
                if (data.notice==='1'){
                    this.$message({
                        message: data.message_register,
                        center: true,
                    });
                }
            },err=>{
                console.log(err);
            });
            self.$data.dialogFormVisible = false;
            this.$refs.passwd.clear();
            this.$refs.user.clear();
            // window.removeEventListener('message',window.addEventListener);

        },
        quit(){
            let self=this
            window.top.postMessage("quit", '*')
            self.$data.dialogFormVisible=false;
            this.$message({
                message: '取消注册成功！',
                center: true
            });
            // window.removeEventListener('message',window.addEventListener);
        },


    }
});


