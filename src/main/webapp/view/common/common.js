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

function Message(text, type) {
    if (type == undefined) {
        type = 'info';
    }
    switch (type) {
        case 'info':
            $.message({
                message: text,
                type: 'info'
            });
            break;
        case 'success':
            $.message(text);
            break;
        case 'error':
            $.message({
                message: text,
                type: 'error'
            });
            break;
        case 'warning':
            $.message({
                message: text,
                type: 'warning'
            });
            break;
    }
};