<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>

<f:loadBundle basename="messages" var="msg" />

<div id="footer">
<p><h:outputText value="#{msg.footer_text}" escape="false" /></p>
</div> 