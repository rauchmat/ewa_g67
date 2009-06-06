function createXHR() {
	var _request;
	try {
		_request = new XMLHttpRequest();
	} catch (microsoft) {
		try {
			_request = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (anotherMicrosoftAproach) {
			try {
				_request = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (failure) {
				_request = null;
			}
		}
	}
	return _request;
}

