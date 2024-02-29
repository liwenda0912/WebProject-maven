let username =JSON.parse(localStorage.getItem("name"))
let code =JSON.parse(localStorage.getItem("stataCode"))

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
        stateCode:0
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
                    console.log(res.data+"   "+data.notice);
                    window.location.href=("Result.jsp?data="+data.notice)
                },err=>{
                    console.log(err);
                });
                localStorage.removeItem("username");
                localStorage.removeItem("passwd");
            }
        }
    }

});



