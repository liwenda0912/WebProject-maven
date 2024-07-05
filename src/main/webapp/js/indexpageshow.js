// let code_key=JSON.parse(localStorage.getItem("key"));
// let code_keyPath = JSON.parse(localStorage.getItem("keyPath"));
// console.log(code_key)
// if( code_key === "2-4-1"){
//     APPLE.index_show="test_data"
//  }


// 回显对应的导航页面处理
var APPLE = new Vue({
    el:'#index_app',
    data() {
        return {
        index_show:"index",
     }
    },
    methods:{
        created:function(){
           let self = this
            self.$data.index_show="index"
        },
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
        // default:
        //     frame.window.removeEventListener('message',lf,false);
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