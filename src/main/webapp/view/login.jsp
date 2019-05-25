<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>登陆</title>
    <style>
        body {
            background-color: #C7EDCC;
            font-family: "microsoft yahei";
            /*min-width: 800px;*/
        }

        img {
            width: 100%;
            /*height: 462px;*/
        }

        #register {
            margin-top: 200px;
        }

        #login {
            margin-top: 220px;
        }
    </style>
</head>
<body>
<ul class="nav navbar-nav navbar-right">
</ul>
<!-- 注册窗口 -->
<div id="register" class="modal fade" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-title">
                <h1 class="text-center">注册</h1>
            </div>
            <div class="modal-body">
                <form class="form-group" action="">
                    <div class="form-group">
                        <label for="">用户名</label>
                        <input class="form-control" type="text" placeholder="6-15位字母或数字">
                    </div>
                    <div class="form-group">
                        <label for="">密码</label>
                        <input class="form-control" type="password" placeholder="至少6位字母或数字">
                    </div>
                    <div class="form-group">
                        <label for="">再次输入密码</label>
                        <input class="form-control" type="password" placeholder="至少6位字母或数字">
                    </div>
                    <%--                    <div class="form-group">--%>
                    <%--                        <label for="">邮箱</label>--%>
                    <%--                        <input class="form-control" type="email" placeholder="例如:123@123.com">--%>
                    <%--                    </div>--%>
                    <div class="text-right">
                        <button class="btn btn-primary" type="submit">提交</button>
                        <button class="btn btn-danger" data-dismiss="modal">取消</button>
                    </div>
                    <a href="" data-toggle="modal" data-dismiss="modal" data-target="#login">已有账号？点我登录</a>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- 登录窗口 -->
<div id="login" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-title">
                <h1 class="text-center">登录</h1>
            </div>
            <div class="modal-body">
                <form class="form-group" action="">
                    <div class="form-group">
                        <label for="">用户名：</label>
                        <input class="form-control" type="text" placeholder="请输入用户名">
                    </div>
                    <div class="form-group">
                        <label for="">密码：</label>
                        <input class="form-control" type="password" placeholder="请输入密码">
                    </div>
                    <div class="text-right">
                        <button class="btn btn-primary" type="submit">登录</button>
                        <button class="btn btn-danger" data-dismiss="modal">取消</button>
                    </div>
                    <a href="" data-toggle="modal" data-dismiss="modal" data-target="#register">还没有账号？点我注册</a>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>