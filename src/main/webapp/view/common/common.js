// function myAlert(wb, type) {
//     switch (type) {
//         case 'alert':
//             $.DialogByZ.Alert({Title: "提示", Content: "您的请求失败", BtnL: "确定", FunL: alerts})
//             break;
//         case 'confirm':
//             $.DialogByZ.Confirm({Title: "", Content: wb, FunL: confirmL, FunR: Immediate});
//             bresk;
//         case 'toast':
//             $.DialogByZ.Autofade({Content: wb});
//             bresk;
//         case 'load':
//             $.DialogByZ.Loading('/MyBlog/message2/image/loading.png')
//             bresk;
//         case '':
//             bresk;
//     }
// }
//
// function confirmL() {
//     $.DialogByZ.Close();
//     $.DialogByZ.Alert({Title: "提示", Content: "您要求稍后开通", BtnL: "确定"})
// }
//
// function Immediate() {
//     alert("取消");
// }
//
// function closes() {
//     $.DialogByZ.Close();
// }
$(function () {
    message = new MyMessage.message({
        /*默认参数，下面为默认项*/
        iconFontSize: "20px", //图标大小,默认为20px
        messageFontSize: "18px", //信息字体大小,默认为12px
        showTime: 1000, //消失时间,默认为1000
        align: "center", //显示的位置类型center,right,left
        positions: { //放置信息距离周边的距离,默认为10px
            top: "200px",
            bottom: "10px",
            right: "10px",
            left: "10px"
        },
        message: "提示消息", //消息内容,默认为"这是一条消息"
        type: "normal", //消息的类型，还有success,error,warning等，默认为normal
    });
    /*两种不同的设置方式*/
    message.setting({
        align: "bottom" //会覆盖前面的所有设置,可以创建不同的对象去避免覆盖
    });
    message.setting("showTime", "2000");
})
;

function Alert(text, type) {
    if (type == undefined) {
        type = 'alert';
    }
    switch (type) {
        case 'alert':
            $.DialogByZ.Alert({Title: "提示", Content: text, BtnL: "确定", FunL: Close});
            break;
        case 'auto':
            $.DialogByZ.Autofade({Content: text});
            break;
        case 'load':
            $.DialogByZ.Loading('/MyBlog/view/zdialog/image/loading.png');
            break;
        case 'confirm':
            $.DialogByZ.Confirm({Title: "", Content: text, FunL: confirmL, FunR: confirmR});
    }
}

function confirmL() {
    $.DialogByZ.Close();
}

function confirmR() {
    $.DialogByZ.Close();
}

function Close() {
    $.DialogByZ.Close();
};