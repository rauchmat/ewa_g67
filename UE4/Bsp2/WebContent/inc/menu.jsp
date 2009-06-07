<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>

<f:loadBundle basename="messages" var="msg" />

<h:form id="menuform">
	<ul>
		<h:outputText rendered="#{!loginController.loggedIn}">
			<li><a href="login.html" accesskey="l"><h:outputText value="#{msg.menu_login}"/></a></li>
			<li><a href="register.html" accesskey="r"><h:outputText value="#{msg.menu_register}"/></a></li>
		</h:outputText>
		<h:outputText rendered="#{loginController.loggedIn}">
			<li><a href="play.html" accesskey="t"><h:outputText value="#{msg.menu_to_table}"/></a></li>
			<li><a href="chguser.html" accesskey="u"><h:outputText value="#{msg.menu_chg_user}"/></a></li>
			<li><h:commandLink action="#{loginController.logout}" accesskey="o"><h:outputText value="#{msg.menu_logout}"/></h:commandLink></li>
		</h:outputText>
	</ul>
</h:form>