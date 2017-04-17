function CharectersAndNumbersOnly(e) {
    var keynum
    var keychar
    var numcheck
    // For Internet Explorer
    if (window.event) {
        keynum = e.keyCode;
    }
        // For Netscape/Firefox/Opera
    else if (e.which) {
        keynum = e.which;
    }
    keychar = String.fromCharCode(keynum);
    //List of special characters you want to restrict
    if (keychar == " " || keychar == "'" || keychar == "`" || keychar == "!" || keychar == "@" || keychar == "#" || keychar == "$" || keychar == "%" || keychar == "^" || keychar == "&" || keychar == "*" || keychar == "(" || keychar == ")" || keychar == "-" || keychar == "_" || keychar == "+" || keychar == "=" || keychar == "/" || keychar == "~" || keychar == "<" || keychar == ">" || keychar == "," || keychar == ";" || keychar == ":" || keychar == "|" || keychar == "?" || keychar == "{" || keychar == "}" || keychar == "[" || keychar == "]" || keychar == "¬" || keychar == "£" || keychar == '"' || keychar == "\\") {
        return false;
    } else {
        return true;
    }
}
function CharectersOnly(e) {
    var keynum;
    var keychar;
    var charcheck;
    if (window.event) // IE
        keynum = e.keyCode;
    else if (e.which) // Netscape/Firefox/Opera
        keynum = e.which;


    keychar = String.fromCharCode(keynum);

    charcheck = /[a-zA-Z]/;
    return charcheck.test(keychar);
}
function CharectersWithSpace(e) {
    var keynum;
    var keychar;
    var charcheck;
    if (window.event) // IE
        keynum = e.keyCode;
    else if (e.which) // Netscape/Firefox/Opera
        keynum = e.which;


    keychar = String.fromCharCode(keynum);

    charcheck = /[a-zA-Z\s]/;
    return charcheck.test(keychar);
}
function RistrictSpaces(e) {
    var keynum;
    var keychar;
    var charcheck;
    if (window.event) // IE
        keynum = e.keyCode;
    else if (e.which) // Netscape/Firefox/Opera
        keynum = e.which;

    keychar = String.fromCharCode(keynum);
    charcheck = /[^-\s]/;
    return charcheck.test(keychar);
}

function NumberOnly(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if (charCode > 31 && (charCode < 48 || charCode > 57)) {
            return false;
        }
        return true;
    }
    catch (err) {
        alert(err.Description);
    }
}
function Percentage(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if (charCode > 31 && charCode != 46 && (charCode < 48 || charCode > 57) ) {
            return false;
        }
        return true;
    }
    catch (err) {
        alert(err.Description);
    }
}