var re = /^[A-Za-z0-9]*$/;
var str = ' ';
function checkLoginName(obj) {
    if (re.test(obj.value) == false)   obj.value = str; else   str = obj.value;
}

// <input   type=text   name=text1   onpropertychange="checkLoginName(this)"> 