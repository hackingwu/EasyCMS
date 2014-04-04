/*

 1.是否以某字符串结尾	endsWith(theStr,endStr)
 @param theStr:要判断的字符串
 @param endStr:以此字符串结尾
 @return boolean;
 */
function endsWith(theStr, endStr) {
    var theStrLength = theStr.length;
    var endStrLength = endStr.length;
    var theStrEnd = theStr.substring(theStrLength - endStrLength, theStrLength);
    if (theStrEnd == endStr)
        return true;
    else
        return false;
}
/*

 1.是否以某字符串开始	startsWith(theStr,endStr)
 @param theStr:要判断的字符串
 @param endStr:以此字符串结尾
 @return boolean;
 */
function startsWith(theStr, startStr) {
    var theStrLength = theStr.length;
    var startStrLength = startStr.length;
    var theStrStart = theStr.substring(0, startStrLength);
    if (theStrStart == startStr)
        return true;
    else
        return false;
}
/*
 2.是否是整数
 @param str:要判断的字符串
 @param bEmpty:如果str为空返回此值
 */
function isInt(str, bEmpty) {
    if (str == null || trim(str) == "") {
        return bEmpty;
    }

    if (trim(str) == "0") {
        return false;
    }

    var ch = str.substring(0, 1);

    if (ch == "0" && trim(str) != "0") {
        return false;
    }

    for (var i = 0; i < str.length; i++) {
        var s = str.substring(i, i + 1);
        if (!(s >= "0" && s <= "9")) {
            return false;
        }
    }
    return true;
}
function isInt(str) {
    if (str == null || trim(str) == "") {
        return true;
    }

    if (trim(str) == "0") {
        return true;
    }

    var ch = str.substring(0, 1);

    if (ch == "0" && trim(str) != "0") {
        return false;
    }

    for (var i = 0; i < str.length; i++) {
        var s = str.substring(i, i + 1);
        if (!(s >= "0" && s <= "9")) {
            return false;
        }
    }
    return true;
}
/*
 3、裁减字符串空格
 @param Str:要裁减的字符串
 @param Flag:方向,输入l或L裁减左边空格;输入r或R裁减右边空格;否则裁减两边空格
 */
function trim(Str, Flag) {

    Str = "" + Str;
    if (Flag == "l" || Flag == "L")/*trim left side only*/
    {
        RegularExp = /^\s+/gi;
        return Str.replace(RegularExp, "");
    }
    else if (Flag == "r" || Flag == "R")/*trim right side only*/
    {
        RegularExp = /\s+$/gi;
        return Str.replace(RegularExp, "");
    }
    else/*defautly, trim both left and right side*/
    {
        RegularExp = /^\s+|\s+$/gi;
        return Str.replace(RegularExp, "");
    }
}
/*
 4、是否是浮点数
 @param checkstr:要判断的字符串
 @param bEmpty:如果checkstr为空时返回的值
 @param tcount:小数点位数
 */
function isFloat(checkstr, bEmpty, tcount) {
    if (checkstr == null || trim(checkstr) == "") {
        return bEmpty;
    }

    var str = trim(checkstr);
    if (str.substring(0, 1) == ".") {
        return false;
    }
    var temp = 0;
    for (var i = 0; i < str.length; i++) {
        var ch = str.substring(i, i + 1);
        if (!((ch >= "0" && ch <= "9") || ch == ".")) {
            return false;
        }
        if (ch == ".")
            temp++;
        if (temp > 1) {
            return false;
        }
    }

    if (tcount != null && tcount > 0) {
        if (str.indexOf(".") != -1 && str.length - (str.indexOf(".") + 1) > tcount) {
            return false;
        }
    }

    var start1 = checkstr.substring(0, 1);
    var start2 = checkstr.substring(1, 2);
    if (start1 == 0 && start2 != ".") {
        for (var i = 0; i < str.length; i++) {
            var ch = str.substring(i, i + 1);
            if (ch == 0)
                temp++;
        }
        if (temp == str.length) {
            return true;
        }
        return false;
    }
    return true;
}
/*
 5、是否所有字符为数字类型
 @param str:要判断的字符串
 @param bEmpty:str为空时返回此值
 */
function isNumber(str, bEmpty) {
    if (str == null || trim(str) == "") {
        return bEmpty;
    }

    for (var i = 0; i < str.length; i++) {
        var s = str.substring(i, i + 1);
        if (!(s >= "0" && s <= "9")) {
            return false;
        }
    }
    return true;
}
/*
 6、是否为空
 @param str:要判断的字符串
 */
function isNull(str) {
    if (str == null || trim(str) == "") {
        return true;
    }
    return false;
}

/*
 8、是否是EMAIL
 @param str:要判断的字符串
 @param bEmpty:str为空时返回此值
 */
function isEmail(str, bEmpty) {
    if (str == null || trim(str) == "") {
        return bEmpty;
    }

    //校验邮件的正则表达式，包括aa@bb.cc.dd 和 aa@bb.cc的形式

    var pattern1 = /^(([\u4E00-\u9FA5]|[\uFE30-\uFEFF]|[\d]|[a-zA-Z]|[\_\-\.])+[\@])(((([\d]|[a-zA-Z]|[\_\-]|[\[\]\{\}\>\<])+[\.])+)([\d]|[a-zA-Z\_\-])+)$/;
    if (str.match(pattern1))
        return true;
    return false;
}
/*
 9、是否是电话号码
 @param str:要判断的字符串
 @param bEmpty:str为空时返回此值
 */
function isTel(str, bEmpty) {
    if (str == null || trim(str) == "")
        return bEmpty;

    var str = trim(str);
    var myphone = /^[\-0-9+()\/]{1,32}$/;
    if (myphone.test(str)) return true;

    return false;
}
//--身份证号码验证-支持新的带x身份证
function isIdCardNo(num) {
    var factorArr = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1);
    var error;
    var varArray = new Array();
    var intValue;
    var lngProduct = 0;
    var intCheckDigit;
    var intStrLen = num.length;
    var idNumber = num;
    var checkDate = function (date) {
        return true;
    }

    // initialize
    if ((intStrLen != 15) && (intStrLen != 18)) {
        //error = "输入身份证号码长度不对！";
        //alert(error);
        //frmAddUser.txtIDCard.focus();
        return false;
    }
    // check and set value
    for (i = 0; i < intStrLen; i++) {
        varArray[i] = idNumber.charAt(i);
        if ((varArray[i] < '0' || varArray[i] > '9') && (i != 17)) {
            //error = "错误的身份证号码！.";
            //alert(error);
            //frmAddUser.txtIDCard.focus();
            return false;
        } else if (i < 17) {
            varArray[i] = varArray[i] * factorArr[i];
        }
    }
    if (intStrLen == 18) {
        //check date
        var date8 = idNumber.substring(6, 14);
        if (checkDate(date8) == false) {
            //error = "身份证中日期信息不正确！.";
            //alert(error);
            return false;
        }
        // calculate the sum of the products
        for (i = 0; i < 17; i++) {
            lngProduct = lngProduct + varArray[i];
        }
        // calculate the check digit
        intCheckDigit = 12 - lngProduct % 11;
        switch (intCheckDigit) {
            case 10:
                intCheckDigit = 'X';
                break;
            case 11:
                intCheckDigit = 0;
                break;
            case 12:
                intCheckDigit = 1;
                break;
        }
        // check last digit
        if (varArray[17].toUpperCase() != intCheckDigit) {
            //error = "身份证效验位错误!正确为： " + intCheckDigit + ".";
            //alert(error);
            return false;
        }
    }
    else {        //length is 15
        //check date
        var date6 = idNumber.substring(6, 12);
        if (checkDate(date6) == false) {
            //alert("身份证日期信息有误！.");
            return false;
        }
    }
    //alert ("Correct.");
    return true;
}
/*
 日期验证
 */
function strDateTime(str) {
    var r = str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);
    if (r == null)return false;
    var d = new Date(r[1], r[3] - 1, r[4]);
    return (d.getFullYear() == r[1] && (d.getMonth() + 1) == r[3] && d.getDate() == r[4]);
}

function replaceAll(str, replaceStr, toStr) {
    var raRegExp = new RegExp(replaceStr.replace(/([\(\)\[\]\{\}\^\$\+\-\*\?\.\"\'\|\/\\])/g, "\\$1"), "ig");
    return str.replace(raRegExp, toStr);
}
function url(str) {
    str = replaceAll(str, "?", "$param$");
    str = replaceAll(str, "&", "$and$");
    str = replaceAll(str, "%", "$percent$");
    return str;
}