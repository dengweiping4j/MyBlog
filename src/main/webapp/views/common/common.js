function myAlert(str) {
    var div = '<div class="mark"></div>';
    $('body').append(div)
    $('.mark').html(str);
    $('.mark').show();
    setTimeout(function () {
        $('.mark').hide();
        $('.mark').remove();
    }, 2000)
}