var url = '/MyBlog/article';
$(function () {
    page(1);
    checkLogin();
    findAboutme(getCookie("userId"));
    //加载点赞状态和点赞数
    var handUpArr = $("a[name='handUp']");
    for (var x = 0; x < handUpArr.length; x++) {
        selectHandUpState($(handUpArr[x]).attr("value"))
    }
});

//加载登录人个人信息
function findAboutme(userId) {
    $("#about_me").empty();
    if (userId != undefined && userId != '') {
        var str = "<ul>" +
            "      <i><img src='/MyBlog/view/images/" + getCookie("profilePhoto") + "'></i><br><b" +
            "              style='font-size: 16px;margin-left: 5px;'>" + getCookie("userName") + "</b>" +
            "          <table class='table' style='text-align: center'>" +
            "              <tbody>" +
            "              <tr>" +
            "                  <td><a>已发布</a></td>" +
            "                  <td><a>关注</a></td>" +
            "                  <td><a>粉丝</a></td>" +
            "                  <td><a>留言</a></td>" +
            "              </tr>" +
            "              <tr>" +
            "                  <td><a><b>25</b></a></td>" +
            "                  <td><a><b>38</b></a></td>" +
            "                  <td><a><b>6</b></a></td>" +
            "                  <td><a><b>8</b></a></td>" +
            "              </tr>" +
            "              </tbody>" +
            "          </table>" +
            "  </ul>";
        $("#about_me").append(str);
    }
}

//文章列表加载，分页控制
function page(curPage) {
    //查询文章列表
    selectPage(curPage);
    //查询文章列表总数
    selectPageNum();
}

//加载文章列表
function selectPage(curPage) {
    $("#main").empty();
    $.ajax({
        type: "POST",//方法类型
        async: false,
        dataType: "json",//预期服务器返回的数据类型
        url: url + "/findAllArticle",//url
        data: {'curPage': curPage},
        success: function (data) {
            var str = "";
            var tagLabel = "";
            $.each(data, function (n, value) {
                switch (value.tagKey) {
                    case '1':
                        tagLabel = "<span class='badge badge-pill badge-success' style='clear: right;float: right'><font size='2px'>" + value.tagName + "</font></span>";
                        break;
                    case '2':
                        tagLabel = "<span class='badge badge-pill badge-danger' style='clear: right;float: right'><font size='2px'>" + value.tagName + "</font></span>";
                        break;
                    case '3':
                        tagLabel = "<span class='badge badge-pill badge-warning' style='clear: right;float: right'><font size='2px'>" + value.tagName + "</font></span>";
                        break;
                    case '4':
                        tagLabel = "<span class='badge badge-pill badge-info' style='clear: right;float: right'><font size='2px'>" + value.tagName + "</font></span>";
                        break;
                    case '5':
                        tagLabel = "<span class='badge badge-pill badge-primary' style='clear: right;float: right'><font size='2px'>" + value.tagName + "</font></span>";
                        break;
                }
                //判断点赞状态
                str += " <li class='media'>" +
                    "      <a class='media-left media-bottom' href='#'>" +
                    "          <img src='/MyBlog/view/images/" + value.profilePhoto + "'" +
                    "      </a>" +
                    "      <div class='media-body'>" +
                    "          <div>" + tagLabel +
                    "               <h3>" +
                    "                   <a>" + value.userName + "</a>" +
                    "               </h3>" +
                    "               <h4>" + value.createTime + "</h4>" +
                    "          </div>" +
                    "          <p>" + value.content + "</p>" +
                    "           <a class='fa fa-eye' style='margin-left: -20px;float: left;'>&nbsp;阅读：30次</a>" +
                    "           <a class='fa fa-comment-o' style='margin-right: 10px;float: right;' onclick='comment()'>&nbsp;3</a>" +
                    "           <a id='" + value.pkid + "' name='handUp' class='fa fa-hand-pointer-o' style='margin-right: 10px;float: right;' onclick='upHand(this)' value='" + value.pkid + "'>&nbsp;0</a>" +
                    "      </div>" +
                    " </li>";
            });
            $("#main").append(str);
        },
        error: function () {
            message("系统异常", "error");
        }
    });
}

//加载文章列表总数
function selectPageNum() {
    $.ajax({
        type: "POST",//方法类型
        async: false,
        dataType: "json",//预期服务器返回的数据类型
        url: url + "/findArticleTotal",//url
        success: function (data) {
            var pageTotal = data[0].pageTotal;
            var pageNum = data[0].pageNum;
            var pageSize = data[0].pageSize;
            var str = "";
            if (pageTotal >= pageSize) {//文章条数大于10条才显示页码栏
                str += "<div class='pagelist'>";
                if (curPage > 1) {//如果不是第一页，则显示"上一页"按钮
                    str += "<a href='#' onclick='page(" + (curPage - 1) + ")'>上一页</a>";
                }

                //任何情况，只要显示页码栏，就一定显示第一页
                if (curPage == 1) {
                    str += "&nbsp;&nbsp;<a class='curPage'>1</a>";
                } else {
                    str += "&nbsp;&nbsp;<a onclick='page(" + 1 + ")'>1</a>";
                }

                if (curPage > 5) {//当前页大于5时则只显示当前页前3页～当前页后3页，以及首页
                    str += "&nbsp;&nbsp;..."
                    for (var i = curPage - 3; i <= (curPage + 3) && i <= pageNum; i++) {
                        if (i == curPage) {
                            str += "&nbsp;&nbsp;<a href='#' class='curPage'>" + i + "</a>";
                        } else {
                            str += "&nbsp;&nbsp;<a href='#' onclick='page(" + i + ")'>" + i + "</a>";
                        }
                    }
                } else {
                    for (var i = 2; i <= pageNum && i <= (curPage + 3); i++) {
                        if (i == curPage) {
                            str += "&nbsp;&nbsp;<a href='#' class='curPage'>" + i + "</a>";
                        } else {
                            str += "&nbsp;&nbsp;<a href='#' onclick='page(" + i + ")'>" + i + "</a>";
                        }
                    }
                }

                if (pageNum - curPage > 3) {//总页数大于当前页+3时，显示尾页
                    if (pageNum - curPage > 4) {//总页数大于当前页+3且不连续时，才显示“...”
                        str += "&nbsp;&nbsp;...";
                    }
                    str += "&nbsp;&nbsp;<a href='#' onclick='page(" + pageNum + ")'>" + pageNum + "</a>";
                }

                if (curPage < pageNum) {//当前页不是最后一页，则显示下一页按钮
                    str += "&nbsp;&nbsp;<a href='#' onclick='page(" + (curPage + 1) + ")'>下一页</a>";
                }
                str += "</div>";
                $("#main").append(str);
            }
        },
        error: function () {
            message("系统异常", "error");
        }
    });
}

//加载当前用户对列表文章点赞状态
function selectHandUpState(articleKey) {
    var userKey = getCookie("userId");
    var data = {"userKey": userKey, "articleKey": articleKey};
    if (userKey == null || userKey == undefined) {
        return 0;
    } else {
        $.ajax({
            type: "POST",//方法类型
            async: false,
            dataType: "json",//预期服务器返回的数据类型
            url: url + "/selectHandUpState",//url
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(data),
            success: function (result) {
                var handStyle = "margin-right: 10px;float: right;";
                if (result.data.resultTotal == 1) {
                    handStyle += "color:red;";
                }
                $("a[id=" + articleKey + "]").attr("style", handStyle);
                $("a[id=" + articleKey + "]").text(" "+result.data.handUpNum);
            },
            error: function () {
                message("系统异常", "error");
            }
        });
    }
}

//设置标签值
function setTag(tag, obj, className, text) {
    $("button[name=tagBtn]").removeClass();
    $("button[name=tagBtn]").addClass('btn btn-default');
    $(obj).addClass(className);
    $("#tag").val(tag);
    $("#content").attr('placeholder', text);
}

//保存发表文章
function save() {
    if (getCookie("userId") == null || getCookie("userId") == undefined) {
        message("请先登录！", "warming");
        return;
    }
    var content = $("#content").val();
    var tag = $("#tag").val();
    console.log(content);
    if (content != null && content != '') {
        var data = {
            'content': content,
            'tagKey': tag,
            'userKey': getCookie("userId")
        };
        Alert('', 'load');
        $.ajax({
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: url + "/addSave",//url
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(data),
            success: function (result) {
                if (result.message == "success") {
                    message('发布成功');
                } else {
                    message("发布失败", "error");
                }
                Close();
                $("#content").val("");
                page(1);
            },
            error: function () {
                message("系统异常", "error");
            }
        });
    } else {
        message("请输入您要发布的内容", "info");
    }
}

function upHand(obj) {
    var articleKey = $(obj).attr('value');
    var userKey = getCookie("userId");
    if (userKey == null || userKey == undefined) {
        message("请先登录", "warming");
        return;
    }
    var data = {"articleKey": articleKey, "userKey": userKey};
    if (articleKey != undefined && articleKey != null) {
        $.ajax({
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            contentType: "application/json; charset=utf-8",
            url: url + "/upHand",//url
            data: JSON.stringify(data),
            success: function () {
                selectHandUpState(articleKey);//点击后重新加载当前用户点赞状态
            }
        });
    }
}

function comment() {
    alert($("#articleId").html());
}