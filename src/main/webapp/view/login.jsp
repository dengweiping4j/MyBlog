<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
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
            margin-top: 100px;
        }

        #login {
            margin-top: 120px;
        }
    </style>
    <script src="${pageContext.request.contextPath}/view/js/login.js"></script>
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
                <form class="form-group" method="post">
                    <div class="form-group">
                        <label>昵&nbsp;&nbsp;称</label>
                        <input id="userName_add" class="form-control" type="text" placeholder="请输入您的昵称">
                    </div>
                    <div class="form-group">
                        <label>用户名</label>
                        <input id="userId_add" class="form-control" type="text" placeholder="4-15位字母或数字">
                    </div>
                    <div class="form-group">
                        <label>密码</label>
                        <input id="password_add" class="form-control" type="password" placeholder="至少6位字母或数字">
                    </div>
                    <div class="form-group">
                        <label>再次输入密码</label>
                        <input id="password2_add" class="form-control" type="password" placeholder="至少6位字母或数字">
                    </div>
                    <%--                    <div class="form-group">--%>
                    <%--                        <label>邮箱</label>--%>
                    <%--                        <input id="email" class="form-control" type="email" placeholder="例如:123@123.com">--%>
            </div>
            <div class="text-right" style="margin-right: 20px;">
                <button class="btn btn-primary" type="button" onclick="addUser()">提交</button>
                <button class="btn btn-danger" data-dismiss="modal">取消</button>
            </div>
            <a href="" data-toggle="modal" data-dismiss="modal" data-target="#login" style="margin: 0 0 20px 20px;">已有账号？点我登录</a>
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
                <form class="form-group">
                    <div class="form-group">
                        <label>用户名：</label>
                        <input id="userId" class="form-control" type="text" placeholder="请输入用户名">
                    </div>
                    <div class="form-group">
                        <label>密码：</label>
                        <input id="password" class="form-control" type="password" placeholder="请输入密码">
                    </div>
                    <div class="text-right">
                        <button class="btn btn-primary" type="button" onclick="login()">登录</button>
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