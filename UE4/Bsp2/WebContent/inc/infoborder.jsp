<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://www.icesoft.com/icefaces/component" prefix="i" %>

<div id="infoborder">
<p>
	<i:outputText rendered="#{!loginController.loggedIn}">
		<a href="login.iface">Einloggen</a> oder <a href="register.iface">Registrieren</a>
	</i:outputText>
	<i:outputText rendered="#{loginController.loggedIn}">
		Sie sind als <em><i:outputText value="#{loginController.loggedInPlayer.userName}" /></em> eingeloggt.
	</i:outputText>
</p>
</div>