<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>

<div id="infoborder">
<p><h:outputText rendered="#{!loginController.loggedIn}">
	<a href="login.html">Einloggen</a> oder <a href="register.html">Registrieren</a>
</h:outputText> <h:outputText rendered="#{loginController.loggedIn}">
				Sie sind als <em><h:outputText
		value="#{loginController.loggedInPlayer.userName}" /></em> eingeloggt.
				</h:outputText></p>
</div>