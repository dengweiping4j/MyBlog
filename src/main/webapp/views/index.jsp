<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!doctype html>
<html>
<head>
    <meta charset="gbk">
    <title>博客 首页</title>
    <meta name="keywords" content="个人博客,杨青个人博客,个人博客模板,杨青"/>
    <meta name="description" content="杨青个人博客，是一个站在web前端设计之路的女程序员个人网站，提供个人博客模板免费资源下载的个人原创网站。"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/base.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
    <link href="css/m.css" rel="stylesheet">
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/comm.js"></script>
    <!--[if lt IE 9]>
    <script src="js/modernizr.js"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/views/view_js/index.js"></script>
</head>
<body>
<header class="header-navigation" id="header">
    <nav>
        <div class="logo"><a href="/">博客</a></div>
        <h2 id="mnavh"><span class="navicon"></span></h2>
        <ul id="starlist">
            <li><a href="index.jsp">首页</a></li>
            <li><a href="share.html">说说</a></li>
            <li><a href="list.html">表白墙</a></li>
            <li><a href="about.html">吐槽</a></li>
            <li><a href="info.html">树洞</a></li>
            <li><a href="infopic.html">知言</a></li>
            <li><a href="gbook.html">留言</a></li>
        </ul>
    </nav>
</header>
<article>
    <aside class="l_box">
        <div class="about_me">
            <%--            <h2>关于匿名社区</h2>--%>
            <ul>
                <div><i><img src="images/4.jpg"></i><br><b style="font-size: 16px;margin-left: 10px;">超级管理员</b></div>
                <div>
                    <table class="table" style="text-align: center">
                        <tbody>
                        <tr>
                            <td><a>已发布</a></td>
                            <td><a>关注</a></td>
                            <td><a>粉丝</a></td>
                            <td><a>留言</a></td>
                        </tr>
                        <tr>
                            <td><a><b>25</b></a></td>
                            <td><a><b>38</b></a></td>
                            <td><a><b>6</b></a></td>
                            <td><a><b>8</b></a></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </ul>
        </div>
        <div class="search">
            <form action="/e/search/index.php" method="post" name="searchform" id="searchform">
                <input name="keyboard" id="keyboard" class="input_text" value="请输入关键字词"
                       style="color: rgb(153, 153, 153);"
                       onfocus="if(value=='请输入关键字词'){this.style.color='#000';value=''}"
                       onblur="if(value==''){this.style.color='#999';value='请输入关键字词'}" type="text">
                <input name="show" value="title" type="hidden">
                <input name="tempid" value="1" type="hidden">
                <input name="tbname" value="news" type="hidden">
                <input name="Submit" class="input_submit" value="搜索" type="submit">
            </form>
        </div>
        <div class="fenlei">
            <h2>文章分类</h2>
            <ul>
                <li><a href="/">说说（33）</a></li>
                <li><a href="/">表白墙（520）</a></li>
                <li><a href="/">吐槽（19）</a></li>
                <li><a href="/">树洞（40）</a></li>
                <li><a href="/">知言（50）</a></li>
            </ul>
        </div>
        <div class="tuijian">
            <h2>推荐阅读</h2>
            <ul>
                <li><a href="/">《匿名社区》1.0版本正式上线了</a></li>
                <li><a href="/">打破腾讯社交垄断，飞聊强势来袭</a></li>
            </ul>
        </div>
        <div class="guanzhu">
            <h2>关注我 么么哒</h2>
            <ul>
                <img src="images/wx.jpg">
            </ul>
        </div>
    </aside>
    <main class="r_box" id="text">
        <div class="btn-group btn-group-sm" style="margin-bottom: 5px;">
            <button id="btn1" name="tagBtn" class="btn btn-default btn-success" onclick="setTag(1,this,'btn-success')">说&nbsp;&nbsp;说
            </button>
            <button id="btn2" name="tagBtn" class="btn btn-default " onclick="setTag(2,this,'btn-danger')">表白墙</button>
            <button id="btn3" name="tagBtn" class="btn btn-default " onclick="setTag(3,this,'btn-warning')">吐&nbsp;&nbsp;槽
            </button>
            <button id="btn4" name="tagBtn" class="btn btn-default " onclick="setTag(4,this,'btn-info')">
                树&nbsp;&nbsp;洞
            </button>
            <button id="btn5" name="tagBtn" class="btn btn-default " onclick="setTag(5,this,'btn-primary')">知&nbsp;&nbsp;言
            </button>
        </div>
        <textarea id="content" class="form-control" rows="4" style="margin-bottom: 10px;" maxlength="120"></textarea>
        <input type="hidden" id="tag" value="1">
        <button class="btn btn-danger" style="margin-bottom: 20px;width: 80px;float:right" onclick="save()">发&nbsp;&nbsp;表</button>
    </main>
    <main class="r_box" id="main">
    </main>
</article>
<footer>
    <p>Copyright ©2019 <a>weipingdeng@qq.com</a> Powered By <a>匿名社区</a> Version 0.0.1</p>
</footer>
<a href="#" class="cd-top">Top</a>
</body>
</html>
