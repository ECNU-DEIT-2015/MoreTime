function sign_up() {
    var pw = hex_md5($("#pw").val());
    var re_pw = hex_md5($("#re_pw").val());
    var phone = $("#phone").val();
    var username = $("#username").val();
    if (pw != re_pw) {
        if (typeof($("#tip").attr("hidden")) != "undefined") $("#tip").removeAttr("hidden");
        $("#tip").text("两次密码不一致");
    } else if ($("#pw").val().length < 6) {
        if (typeof($("#tip").attr("hidden")) != "undefined") $("#tip").removeAttr("hidden");
        $("#tip").text("密码过短，不能少于6位");
    } else if ($("#pw").val().length > 20) {
        if (typeof($("#tip").attr("hidden")) != "undefined") $("#tip").removeAttr("hidden");
        $("#tip").text("密码过长，不能超过20位");
    } else if (phone.length != 11) {
        if (typeof($("#tip").attr("hidden")) != "undefined") $("#tip").removeAttr("hidden");
        $("#tip").text("手机格式错误");
    }
    else {
        $.ajax({
            url: '/register',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {
                phone: phone,
                pw: pw,
                username: username
            },
            dataType: "json",
            success: function (data) {
                if (data.errorCode == "1") {
                    if (typeof($("#tip").attr("hidden")) != "undefined") $("#tip").removeAttr("hidden");
                    $("#tip").text("该手机号码已经注册请登陆");
                } else if (data.errorCode == "0")
                /*window.location.href = "/home/" + data.beanObject.phone;*/
                    window.location.href = "/welcome";
            }
        });
    }
}

function sign_login() {
    var pw = hex_md5($("#logpw").val());
    var phone = $("#logphone").val();
    if (phone == null) {
        if (typeof($("#tipl").attr("hidden")) != "undefined") $("#tipl").removeAttr("hidden");
        $("#tipl").text("请填写手机号码");
    } else if (pw == null) {
        if (typeof($("#tipl").attr("hidden")) != "undefined") $("#tipl").removeAttr("hidden");
        $("#tipl").text("请输入密码");
    }
    $.ajax({
            url: '/login',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {
                phone: phone,
                pw: pw
            },
            dataType: "json",
            success: function (data) {
                if (data.errorCode == "1") {
                    if (typeof($("#tipl").attr("hidden")) != "undefined") {
                        $("#tipl").removeAttr("hidden");
                        $("#tipl").text("该手机号码尚未注册");
                    }
                }
                else if (data.errorCode == "0")
                    window.location.href = "/welcome";
                else {
                    if (typeof($("#tipl").attr("hidden")) != "undefined") {
                        $("#tipl").removeAttr("hidden");
                        $("#tipl").text("密码错误，请重试");
                    }
                }
            }
        }
    )
    ;
}


function for_pw() {
    var email = $("#foremail").val();
    if (!isEmail(email)) {
        if (typeof($("#tip2").attr("hidden")) != "undefined") $("#tip2").removeAttr("hidden");
        $("#tip2").text("邮件格式有误");
    }
    else {
        $.ajax({
            url: '/forget',
            type: 'post',
            contentType: 'application/x-www-form-urlencoded',
            data: {email: email},
            dataType: "json",
            success: function (data) {
                if (data.errorCode == "0") {
                    if (typeof($("#tip2").attr("hidden")) != "undefined") $("#tip2").removeAttr("hidden");
                    $("#tip2").text("邮件发送成功");
                }
                else if (data.errorCode == "1") {
                    if (typeof($("#tip2").attr("hidden")) != "undefined") $("#tip2").removeAttr("hidden");
                    $("#tip2").text("邮件发送失败");
                }
            }
        });
    }
}

function isEmail(str) {
    var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
    return reg.test(str);
}