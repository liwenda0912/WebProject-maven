let username =JSON.parse(localStorage.getItem("name"))

window.addEventListener("message",function(e){
    if(e.data==='1'){
        login.$data.stateCode = e.data;
        // console.log(e.data); // message
    }
}, false);


var login = new Vue({
    data: {
        receive_name:'',
        receive_img:'',
        // isshow: true,
        // ishow: false,
        name_show: username,
        stateCode:0,

    },
    el: '#app',
    methods: {
        login_down() {
            localStorage.removeItem("name");
            this.$message({
                message: '退出登录成功！',
                center: true
            });
            setTimeout(() => {
                location.reload();
            }, 100)
        },
        test: function () {
            this.$router.push({path: '/Result'})
        }


    },watch:{
        stateCode: function (newData,oldData){
            let self=this
            let name=JSON.parse(localStorage.getItem("username"));
            let input_passwd = JSON.parse(localStorage.getItem("passwd"));
            if (newData==='1'){
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
window.addEventListener("message",function(e){
    console.log(e.data); // message
    let self =this
    if(e.data==='2'){
        test.$data.dialogCode= e.data;
    }
    else if (e.data==='0'){
        test.$data.dialogCode= e.data;
    }
}, false);

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
            if (newData==='2'){
                self.$data.dialogFormVisible=true
            }else{
                self.$data.dialogFormVisible=false
            }
        }
    },
    methods: {
        registered: function () {
            let self=this
            window.top.postMessage("0", '*');
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
                        center: true
                    });
                }
            },err=>{
                console.log(err);
            });
            self.$data.dialogFormVisible = false;
        },
        quit(){
            let self=this
            window.top.postMessage("0", '*');
            self.$data.dialogFormVisible=false;
            this.$message({
                message: '取消注册成功！',
                center: true
            });
        }
    }
});



