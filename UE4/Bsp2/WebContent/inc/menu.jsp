<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://www.icesoft.com/icefaces/component" prefix="i" %>

<f:loadBundle basename="messages" var="msg" />

<i:form id="menuform">
	<ul>
		<i:outputText rendered="#{!loginController.loggedIn}">
			<li><a href="login.iface" accesskey="l"><i:outputText value="#{msg.menu_login}"/></a></li>
			<li><a href="register.iface" accesskey="r"><i:outputText value="#{msg.menu_register}"/></a></li>
		</i:outputText>
		<i:outputText rendered="#{loginController.loggedIn}">
			<li><a href="play.iface" accesskey="t"><i:outputText value="#{msg.menu_to_table}"/></a></li>
			<li><a href="chguser.iface" accesskey="u"><i:outputText value="#{msg.menu_chg_user}"/></a></li>
			<li><i:commandLink action="#{loginController.logout}" accesskey="o"><i:outputText value="#{msg.menu_logout}"/></i:commandLink></li>
		</i:outputText>
		<i:outputConnectionStatus />
	</ul>
</i:form>