var url = '/MyBlog/article';
$(function () {
    $.ajax({
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        url: url + "/findAllArticle",//url
        success: function (data) {
            var str = "";
            $.each(data, function (n, value) {
                console.log(value);
                str += "<li><i><a href='/'><img src='images/" + value.titlePage + "'></a></i>"
                    + "<h3><a href='/'>" + value.title + "</a></h3>"
                    + " <p>" + value.content + "</p></li> ";
            });
            $("#main").append(str);
        },
        error: function () {
            alert("系统异常");
        }
    });
});