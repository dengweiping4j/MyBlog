function myAlert(wb, type) {
    switch (type) {
        case 'alert':
            $.DialogByZ.Alert({Title: "提示", Content: "您的请求失败", BtnL: "确定", FunL: alerts})
            break;
        case 'confirm':
            $.DialogByZ.Confirm({Title: "", Content: wb, FunL: confirmL, FunR: Immediate});
            bresk;
        case 'toast':
            $.DialogByZ.Autofade({Content: wb});
            bresk;
        case 'load':
            $.DialogByZ.Loading('/MyBlog/message2/image/loading.png')
            bresk;
        case '':
            bresk;
    }
}

function confirmL() {
    $.DialogByZ.Close();
    $.DialogByZ.Alert({Title: "提示", Content: "您要求稍后开通", BtnL: "确定"})
}

function Immediate() {
    alert("取消");
}

function closes() {
    $.DialogByZ.Close();
}