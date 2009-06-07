/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
var messagePoller = window.setInterval("this.updateMessages()", 3000);
var xmlHttp = null;
var lastId = null;


this.sendRequest = function(method, url, data, callback) {
    xmlHttp = initXmlHttpObject();
    timestamp = new Date();

    // add timestamp to url
    if(url.indexOf('?') > 0) {
    	url += "&";
    }
    else {
        url += "?";
    }
    url += timestamp;
    
    if (xmlHttp==null) {
        alert ("Your browser does not support AJAX!");
        return;
    }

    xmlHttp.onreadystatechange = callback;

    xmlHttp.open(method,url,true);

    if (method == "POST") {
        xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        /*xmlHttp.setRequestHeader("Content-length", data.length);
        xmlHttp.setRequestHeader("Connection", "close");*/
    }

    xmlHttp.send(data);
}

initXmlHttpObject = function() {
    try {
        // Firefox, Opera 8.0+, Safari
        var _xmlHttp=new XMLHttpRequest();
    }
    catch (e) {
        // Internet Explorer
        try {
            _xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
        }
        catch (e) {
            _xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
    }
    return _xmlHttp;
}

renderMessage = function () {
    if(xmlHttp.readyState == 4 && xmlHttp.status == 200) {
        var xmlDoc = xmlHttp.responseXML.documentElement;
        var messages = xmlDoc.getElementsByTagName('message').length;

        // render chat messages
        for (var i=0; i < messages; i++) {
            document.getElementById("chatOutput").innerHTML = "[" +
                xmlDoc.getElementsByTagName('message')[i].getElementsByTagName("time")[0].firstChild.nodeValue + "] \"" +
                xmlDoc.getElementsByTagName('message')[i].getElementsByTagName("username")[0].firstChild.nodeValue + "\": " +
                xmlDoc.getElementsByTagName('message')[i].getElementsByTagName("text")[0].firstChild.nodeValue +
                "<br/>" +
                document.getElementById("chatOutput").innerHTML;
        }

        // update lastId
        lastId = xmlDoc.getElementsByTagName("lastId")[0].firstChild.nodeValue;

        // render debug infos
        document.getElementById("debugInfo").innerHTML = "lastId=" + lastId;
    }
}

doNothing = function () { }

this.sendMessage = function() {
    var username = document.getElementById("username").value;
    var message = document.getElementById("message").value;

    if (username != "" && message != "") {
        var url = "./Chat";
        var data = "username="+username+"&message="+message;
        document.getElementById("errorMsg").innerHTML = data;
        this.sendRequest("POST", url, data, doNothing);
        document.getElementById("message").value = "";
    }
    else {
        document.getElementById("errorMsg").innerHTML = "Username and Message must not be empty.";
    }
}

this.updateMessages = function() {
    var url = "./Chat?notify=true&lastId="+lastId;
    this.sendRequest("GET", url, null, renderMessage);
}
