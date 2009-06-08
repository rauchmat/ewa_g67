var _chatPoller = window.setInterval("updateMessages()", 3000);
var _xmlHttpReq = null;
var _revision = null;

function createXHR() {
	try {
		_xmlHttpReq = new XMLHttpRequest();
	} catch (microsoft) {
		try {
			_xmlHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (anotherMicrosoftAproach) {
			try {
				_xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (failure) {
				alert("Error creating XMLHttpRequest.")
			}
		}
	}
	return _xmlHttpReq;
}

function renderMessage() {
	if (_xmlHttpReq.readyState == 4) {
		if (_xmlHttpReq.status == 200) {
		var xmlDoc = _xmlHttpReq.responseXML.documentElement;
		var messages = xmlDoc.getElementsByTagName('message').length;

		for ( var i = 0; i < messages; i++) {
			document.getElementById("chatHistory").innerHTML = "<p>"
					+ xmlDoc.getElementsByTagName('message')[i]
					        .getElementsByTagName("username")[0].firstChild.nodeValue
					+ ": "
					+ xmlDoc.getElementsByTagName('message')[i]
							.getElementsByTagName("text")[0].firstChild.nodeValue
					+ "</p>" + document.getElementById("chatHistory").innerHTML;
		}

		_revision = xmlDoc.getElementsByTagName("revision")[0].firstChild.nodeValue;
		}
		else {
			alert("Error polling messages (Status code " + _xmlHttpReq.status +").");
		}
	}
	
}

function sendMessage() {
	var username = document.getElementById("username");
	var message = document.getElementById("messagetext");

	if (username != null && message != null
		&& username.value != "" && message.value != "") {
		var data = "username=" + username.value + "&messagetext=" + message.value;
		
		if (!_xmlHttpReq)
			_xmlHttpReq = createXHR();
		
		if (_xmlHttpReq) {
			_xmlHttpReq.onreadystatechange = stateChanged;
			_xmlHttpReq.open("POST", "./Chat", true);
			_xmlHttpReq.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			_xmlHttpReq.send(data);
		}
	
		document.getElementById("message").value = "";
	}
}

function stateChanged() { 
	switch(_xmlHttpReq.readyState) { 
	case 0: break; // uninitialized
	case 1: break; // open
	case 2: break; // sent
	case 3: break; // receiving
	case 4:        //loaded 
		if(_xmlHttpReq.status != 200) { 
			alert("Error sending XmlHttpRequest (Status Code = " + request.status + ").");
		} 
		break;                      
	} 
}


function updateMessages() {
	if (!_xmlHttpReq)
		_xmlHttpReq = createXHR();
	
	if (_xmlHttpReq) {
		var url = "./Chat?revision=" + _revision;
		_xmlHttpReq.onreadystatechange = renderMessage;
		_xmlHttpReq.open("GET", url, true);
		_xmlHttpReq.send(null);
	}
}
