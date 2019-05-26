function checkLogin() {
    if (getCookie("userId") == null) {
        $("#loginLi").empty();
        var str = "<a href='#' data-toggle='modal' data-target='#login'>" +
            "            登录&nbsp;/&nbsp;注册" +
            "      </a>";
        $("#loginLi").append(str);
    } else {
        $("#loginLi").empty();
        var str = "<li><a onclick='clearCookie()'><font style='color: red'>退出登录</font></a></li>";
        $("#loginLi").append(str);
    }
}

function setCookie(name, value, time) {
    if (time == undefined) {
        time = 'h0.5';
    }
    var strsec = getsec(time);
    var exp = new Date();
    exp.setTime(exp.getTime() + strsec * 1);
    document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
}

function getsec(str) {
    var str1 = str.substring(1, str.length) * 1;
    var str2 = str.substring(0, 1);
    if (str2 == "s") {
        return str1 * 1000;
    } else if (str2 == "h") {
        return str1 * 60 * 60 * 1000;
    } else if (str2 == "d") {
        return str1 * 24 * 60 * 60 * 1000;
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
    if (cval != null) {
        document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
    }
}

function clearCookie() {
    delCookie("userId");
    location.reload();
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