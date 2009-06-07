<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://www.icesoft.com/icefaces/component" prefix="i" %>

<f:view>
	<f:loadBundle basename="messages" var="msg" />
	<%@ include file="inc/doctype.jsp"%>
	<html>
	  <head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="description" content="Indexseite des EWA Poker Portals."/>
		<meta name="keywords" content="index welcome EWA poker"/>
		<meta name="language" content="de-AT"/>
	    <title><i:outputText value="#{msg.app_title}" nospan="true"/></title>
	    <link rel="stylesheet" type="text/css" href="./style/screen.css" />
	  </head>
	  <body>
	       <div id="wrapper">
				<div id="header">
					<div id="teaser"></div>
					<h1><i:outputText value="#{msg.index_title}"/></h1>
				</div>
				<div id="body">
					<%@ include file="inc/infoborder.jsp"%>
					<div id="sidebar">
						<%@ include file="inc/menu.jsp"%>
					</div>
					<div id="content">
						<h2><i:outputText value="#{msg.index_heading}"/></h2>
						<p><i:outputText value="#{msg.index_para1}"/></p>
						<p><i:outputText value="#{msg.index_para2}"/></p>
						<i:outputText rendered="#{!loginController.loggedIn}">
						<p><i:outputText value="#{msg.index_para_notLoggedIn}" escape="false"/></p>
						</i:outputText>
					</div>
				</div>
				<%@ include file="inc/footer.jsp"%>
			</div>
	  </body>
	</html>
</f:view>