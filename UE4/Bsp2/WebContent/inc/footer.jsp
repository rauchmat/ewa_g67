<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://www.icesoft.com/icefaces/component" prefix="i" %>

<f:loadBundle basename="messages" var="msg" />

<div id="footer">
<p><i:outputText value="#{msg.footer_text}" escape="false" /></p>
</div> 