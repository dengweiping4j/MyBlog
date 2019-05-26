function message(text, type, position, autoclose) {
    if (autoclose == undefined) {
        autoclose = 2000;
    }
    if (position == undefined) {
        position = 'top-center';
    }
    if (type == undefined) {
        type = 'success';
    }
    if (text == undefined) {
        text = '操作成功';
    }
    spop({
        template: text,
        style: type,
        group: 'submit-satus',
        position: position,
        autoclose: autoclose
    });
}