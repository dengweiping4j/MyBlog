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
            <li><a href="index.jsp">网站首页</a></li>
            <li><a href="share.html">我的相册</a></li>
            <li><a href="list.html">我的日记</a></li>
            <li><a href="about.html">关于我</a></li>
            <li><a href="gbook.html">留言</a></li>
            <li><a href="info.html">内容页</a></li>
            <li><a href="infopic.html">内容页</a></li>
        </ul>
    </nav>
</header>
<article>
    <aside class="l_box">
        <div class="about_me">
            <h2>关于我</h2>
            <ul>
                <i><img src="images/4.jpg"></i>
                <p><b>杨青</b>，一个80后草根女站长！09年入行。一直潜心研究web前端技术，一边工作一边积累经验，分享一些个人博客模板，以及SEO优化等心得。</p>
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
                <li><a href="/">学无止境（33）</a></li>
                <li><a href="/">日记（19）</a></li>
                <li><a href="/">慢生活（520）</a></li>
                <li><a href="/">美文欣赏（40）</a></li>
            </ul>
        </div>
        <div class="tuijian">
            <h2>站长推荐</h2>
            <ul>
                <li><a href="/">帝国cms 列表页调用子栏目，没有则不显示栏目名称</a></li>
                <li><a href="/">第二届 优秀个人博客模板比赛参选活动</a></li>
                <li><a href="/">个人博客模板《绅士》后台管理</a></li>
            </ul>
        </div>
        <div class="guanzhu">
            <h2>关注我 么么哒</h2>
            <ul>
                <img src="images/wx.jpg">
            </ul>
        </div>
    </aside>
    <%--    第一次加载页面时存放
    <input type="hidden" id="pageTotal">
    <input type="hidden" id="pageNum">--%>
    <main class="r_box" id="main">
    </main>
</article>
<footer>
    <p>Design by <a href="http://www.yangqq.com" target="_blank">杨青个人博客</a> <a href="/">蜀ICP备11002373号-1</a></p>
</footer>
<a href="#" class="cd-top">Top</a>
</body>
</html>
