function login() {
    var userId = $("#userId").val();
    var password = $("#password").val();
    if (userId == undefined || userId == "") {
        message("请输入用户名", "info");
    } else if (password == undefined || password == "") {
        message("请输入密码", "info");
    } else {
        var data = {
            "userId": userId,
            "password": password
        };
        $.ajax({
            type: 'post',//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/MyBlog/user/login",//url
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(data),
            success: function (result) {
                if (result.resultCode == 200) {
                    setCookie("userId", result.data.currentUser.userId);
                    setCookie("userName", result.data.currentUser.userName);
                    setCookie("userType", result.data.currentUser.userType);
                    setCookie("signature", result.data.currentUser.signature);
                    setCookie("profilePhoto", result.data.currentUser.profilePhoto);
                    location.reload();
                } else {
                    message(result.message, "error");
                }
            },
            error: function () {

            }
        });
    }
}

function addUser() {
    var userId = $("#userId_add").val();
    var userName = $("#userName_add").val();
    var password = $("#password_add").val();
    var password2 = $("#password2_add").val();
    if (userName == undefined || userName == "") {
        message("请输入您的昵称", "info");
    } else if (userId == undefined || userId == "") {
        message("请输入您的用户名", "info");
    } else if (password == undefined || password == "") {
        message("请输入您的密码", "info");
    } else if (userId.length < 4 || userId.length > 15) {
        message("您输入的用户名长度不正确", "info");
    } else if (password.length < 6 || password.length > 15) {
        message("您输入的密码长度不正确", "info");
    } else if (password != password2) {
        message("您两次输入的密码不一致，请重新输入", "info");
    } else {
        var data = {
            "userId": userId,
            "password": password,
            "userName": userName
        };
        $.ajax({
            type: 'post',//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/MyBlog/user/addUser",//url
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(data),
            success: function (result) {
                if (result.resultCode == 200) {
                    message("注册成功！");
                    setCookie("userId", result.data.currentUser.userId);
                    setCookie("userName", result.data.currentUser.userName);
                    setCookie("userType", result.data.currentUser.userType);
                    setCookie("signature", result.data.currentUser.signature);
                    setCookie("profilePhoto", result.data.currentUser.profilePhoto);
                    location.reload();
                } else {
                    message(result.message, "error");
                }
            },
            error: function () {

            }
        });
    }
}