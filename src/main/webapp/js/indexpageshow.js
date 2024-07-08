

// 回显对应的导航页面处理
var APPLE = new Vue({
    el:'#index_app',
    data() {
        return {
            index_show:true,
            index_code:0,
            test_data:false,
            userMessage:false
     }
    },
    methods:{
        created:function(){
           let self = this
            self.$data.index_show="index"
        }
    },
    watch:{
        index_code:function (newData,oldData) {
            let self = this
            console.log(typeof newData)
            switch (newData.toString()) {
                case "1":
                    self.$data.index_show=true
                    self.$data.test_data=false
                    break
                case "2-1":
                    self.$data.index_show=false
                    self.$data.test_data=true
                    break
                case "2-2":
                    self.$data.index_show=false
                    self.$data.test_data=true
                    break
                case "2-3":
                    self.$data.index_show=false
                    self.$data.test_data=true
                    break
                case "2-4-1":
                    self.$data.index_show=false
                    self.$data.test_data=true
                    break
                case "2-4-2":
                    self.$data.index_show=false
                    self.$data.test_data=true
                    break
                case "2-4-3":
                    self.$data.index_show=false
                    self.$data.test_data=true
                    break
                case "2-4-4":
                    self.$data.index_show=false
                    self.$data.test_data=true
                    break
                case "3":
                    self.$data.index_show=false
                    self.$data.test_data=true
                    break
                case "4":self.$data.index_show=false
                    self.$data.userMessage=true
                    break
            }
        }

    }

})
// 监听input.js子子页面传递的通讯
window.addEventListener("message",function(e){
    var frame = document.getElementById('index_iframe');
    //给iframe的id为index_iframe的子页面进行通信传参
    console.log(e.data)
    switch (e.data) {
        case 'login':
            frame.contentWindow.postMessage(1,'http://localhost:8086/mavenproject_war_exploded');
            break;
        case 'LoginError':
            frame.contentWindow.postMessage(0,'http://localhost:8086/mavenproject_war_exploded');
            break;
        case "register":
            frame.contentWindow.postMessage(2,'http://localhost:8086/mavenproject_war_exploded');
            break;
        case  "quit" :
            frame.contentWindow.postMessage(3,'http://localhost:8086/mavenproject_war_exploded');
            break
        case "resetState":
            frame.contentWindow.postMessage(4,'http://localhost:8086/mavenproject_war_exploded');
            break;
        default:
            APPLE.index_code=e.data
            console.log(e.data)
    }

    // if(e.data==='login'){
    //     // var my_frame = document.getElementById('index_iframe');
    //     frame.contentWindow.postMessage(1,'http://localhost:8086/mavenproject_war_exploded');
    // }
    // else if (e.data==="LoginError")  {
    //     // var frame_index = document.getElementById('index_iframe');
    //     frame.contentWindow.postMessage(0,'http://localhost:8086/mavenproject_war_exploded');
    // } else if (e.data==="register")  {
    //     // var frame_register = document.getElementById('index_iframe');
    //     frame.contentWindow.postMessage(2,'http://localhost:8086/mavenproject_war_exploded');
    // }else if(e.data==="quit"){
    //     // var frame_register = document.getElementById('index_iframe');
    //     frame.contentWindow.postMessage(3,'http://localhost:8086/mavenproject_war_exploded');
    // }else if (e.data==="resetState"){
    //     frame.contentWindow.postMessage(4,'http://localhost:8086/mavenproject_war_exploded');
    // }
    }, false);