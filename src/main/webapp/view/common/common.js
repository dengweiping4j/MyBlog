function checkLogin() {
    if (getCookie("userName") == null) {
        $("#loginLi").empty();
        var str = "<a href='#' data-toggle='modal' data-target='#login'>" +
            "            登录&nbsp;/&nbsp;注册" +
            "      </a>";
        $("#loginLi").append(str);
    } else {
        $("#loginLi").empty();
        var str = "<a href='#'><img\n" +
            "      src='/MyBlog/view/images/photo.jpg'" +
            "      style='width: 30px;border-radius: 50%;'>" +
            "    </a>";
        $("#loginLi").append(str);
    }
}

function getCookie(name) {
    var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
    if (arr = document.cookie.match(reg))
        return unescape(arr[2]);
    else
        return null;
}

function delCookie(name) {
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval = getCookie(name);
    if (cval != null)
        document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
}

function clearCookie() {
    delCookie("userName");
}

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