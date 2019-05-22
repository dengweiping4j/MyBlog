var url = '/MyBlog/article';
$(function () {
    page(1);
});

//文章列表加载，分页控制
function page(curPage) {
    $("#main").empty();
    $.ajax({
        type: "POST",//方法类型
        async: false,
        dataType: "json",//预期服务器返回的数据类型
        url: url + "/findAllArticle",//url
        data: {'curPage': curPage},
        success: function (data) {
            var str = "";
            $.each(data, function (n, value) {
                str += "<li><i><a href='/'><img src='images/" + value.titlePage + "'></a></i>"
                    + "<h3><a href='/' style='text-decoration:none;'>" + value.title + "</a></h3>"
                    + " <p>" + value.content + "</p></li> ";
            });
            $("#main").append(str);
        },
        error: function () {
            alert("系统异常");
        }
    });
    //查询文章列表总数
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

                if (curPage > 5) {//当前页大于5时则只显示当前页前3条～当前页后3条，以及首页
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
            alert("系统异常");
        }
    });
}

//设置标签值
function setTag(tag, obj, className) {
    $("button[name=tagBtn]").removeClass();
    $("button[name=tagBtn]").addClass('btn btn-default');
    $(obj).addClass(className);
    $("#tag").val(tag);
}

function save() {
    var content = $("#content").val();
    var tag = $("#tag").val();
    myAlert('您要提示的内容');
    //
    // $.ajax({
    //     type: "POST",//方法类型
    //     dataType: "json",//预期服务器返回的数据类型
    //     url: url + "/addSave",//url
    //     data: {'content': content, 'tagKey': tag},
    //     success: function (result) {
    //
    //     },
    //     error: function () {
    //         alert("系统异常");
    //     }
    // });
}