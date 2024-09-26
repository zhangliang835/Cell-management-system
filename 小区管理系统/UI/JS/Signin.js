

function gel(a) {

    var object;
    if (document.getElementById(a) !== null) {
        object = document.getElementById(a);
    }
    else {
        object = document.getElementById("ctl00_ContentPlace_" + a);
    }

    return object;

}
function gelstn(a) {
    return document.getElementsByTagName ? document.getElementsByTagName(a) : new Array();
}
function geln(a) {
    return document.getElementsByName ? document.getElementsByName(a) : new Array();
}
function Wr(a) {
    document.write(a);
}
function setfocus(a) {
    gel(a).className = "focus";
    gel(a).innerHTML = msg[a];
}
function setblur(a) {
    gel(a).className = "blur";
}
function fIsNumber(sV, sR) {
    var sTmp;
    if (sV.length == 0) { return (false); }
    for (var i = 0; i < sV.length; i++) {
        sTmp = sV.substring(i, i + 1);
        if (sR.indexOf(sTmp, 0) == -1) { return (false); }
    }
    return (true);
}


// 提示信息
var msg = new Array();
msg['info2'] = "用户名由4到12位的中文字符、英文字母、数字组成。";
msg['info3'] = "";    //检测用户名？
msg['info4'] = "密码由6-20个字符组成，请使用英文字母加数字或符号的组合。";
msg['info5'] = "请再输入一遍您上面输入的密码。";
msg['info6'] = "请输入正确的电子邮件地址，用于找回密码，不做显示用。";
msg['info16'] = "您必须同意服务条款才能注册。";
//msg['info21'] = "输入手机验证码。";
msg['info30'] = "";   //发送手机验证码
var reg_2 = 0;  //用户名
var reg_3 = 0;  //密码
var reg_4 = 0;  //确认密码
var reg_5 = 0;  //电子邮箱
var reg_6 = 0;  //真实姓名
//var reg_10 = 1; //性别
var reg_16 = 1; //服务条款
//var reg_21 = 0;  //手机验证码
var message = "";

String.prototype.TextFilter = function () {
    var pattern = new RegExp("[`~%!@#^=''?~！@#￥……&——‘”“'？*()（），,。.、]");
    var rs = "";
    for (var i = 0; i < this.length; i++) {
        rs += this.substr(i, 1).replace(pattern, '');
    }
    return rs;
};

// 用户名
function check_user(x) {
    if (gel("UserName").value == "") {
        message = "请输入用户名！";
        gel(x).innerHTML = message;
        gel(x).className = "fall";
        reg_2 = 0;
        return false;
    }
    if (gel("UserName").value.length < 2 || gel("UserName").value.length > 12) {
        message = "用户名长度应该在4－12个字符之间，请重新输入用户名！";
        gel(x).innerHTML = message;
        gel(x).className = "fall";
        reg_2 = 0;
        return false;
    }
    var txt = gel("UserName").value.TextFilter(); //调用上面的去字符方法
    if (txt != gel("UserName").value) {
        message = "您的用户名含有特殊符号，请重新输入！";
        gel(x).innerHTML = message;
        gel(x).className = "fall";
        reg_2 = 0;
        return false;
    }

    message = "用户名格式正确！";
    gel(x).innerHTML = message;
    gel(x).className = "true";
    reg_2 = 1;
}

// 密码
function checkpass1(x) {
    var password1 = gel("PassWord").value;
    var Condition1 = (password1.length < 6 || password1.length > 20);
    var Condition2 = (password1.indexOf("&") != -1 || password1.indexOf("%") != -1 || password1.indexOf("=") != -1 || password1.indexOf("+") != -1 || password1.indexOf("'") != -1);
    if (Condition1) {
        message = "密码长度必须为6-20个字符，请重新输入！";
        gel(x).innerHTML = message;
        gel(x).className = "fall";
        reg_3 = 0;
        return false;
    } else if (Condition2) {
        message = "密码中不允许含有&,%,=,+,'字符，请重新输入密码！";
        gel(x).innerHTML = message;
        gel(x).className = "fall";
        reg_3 = 0;
        return false;
    } else {
        message = "密码格式正确，请继续！";
        gel(x).innerHTML = message;
        gel(x).className = "true";
        reg_3 = 1;
        return false;
    }
}
function checkpass2(x) {
    var password1 = gel("PassWord").value;
    var password2 = gel("PassWord2").value;
    var Condition3 = (password2 == "");
    var Condition4 = (password2 != password1);
    if (Condition3) {
        gel(x).innerHTML = "确认密码不能为空，请重新输入！";
        gel(x).className = 'fall';
        reg_4 = 0;
        return false;
    } else if (Condition4) {
        gel(x).innerHTML = "两次输入密码不相同，请重新输入确认密码！";
        gel(x).className = 'fall';
        reg_4 = 0;
        return false;
    } else {
        gel(x).innerHTML = "确认密码正确，请继续！";
        gel(x).className = 'true';
        reg_4 = 1;
        return false;
    }
}
//检测姓名
function checkRealName(x) {
    var realName = gel("RealName").value;
    if (realName.length <= 0 || realName.length > 4) {
        gel(x).innerHTML = "姓名的长度必须在1-4！"
        gel(x).className = "fall";
        reg_6 = 0;
        return false;
    } else {
        gel(x).innerHTML = "姓名输入正确，请继续！";
        gel(x).className = "true";
        reg_6 = 1;
        return false;
    }
}
//Email
function checkEmail(x) {
    var email = gel("Email").value;
    var Condition1 = (email == "");
    var Condition2 = (email.indexOf("@") == -1 || email.indexOf(".") == -1);
    if (Condition1) {
        gel(x).innerHTML = "Email不能为空，请重新输入！";
        gel(x).className = "fall";
        reg_5 = 0;
        return false;
    } else if (Condition2) {
        gel(x).innerHTML = "Email格式不正确，请重新输入！";
        gel(x).className = "fall";
        reg_5 = 0;
        return false;
    } else {
        gel(x).innerHTML = "Email输入正确，请继续！";
        gel(x).className = "true";
        reg_5 = 1;
        return false;
    }
}


//服务条款
function check_service(x) {
    if (gel("service").checked == false) {
        gel(x).innerHTML = "您必须同意服务条款才能完成注册。";
        gel(x).className = 'fall';
        reg_16 = 0;
    } else {
        gel(x).innerHTML = "";
        gel(x).className = 'none';
        reg_16 = 1;
    }
}
//检测表单数据完整性
function fCheck() {
    check_user('info2');
    checkpass1('info4');
    checkpass2('info5');
    checkEmail('info6');
    checkRealName('info7');
    checkTel('info11');
    if (reg_2 == 0) {
        return false;
    }
    else if (reg_3 == 0) {
        return false;
    }
    else if (reg_4 == 0) {
        return false;

    } else if (reg_5 == 0) {
        return false;

    } else if (reg_6 == 0) {
        return false;
    }

    else if (reg_11 == 0) {
        return false;
    }

    else if (reg_16 == 0) {
        return false;
    }
    else {
        return true;


    }
}


