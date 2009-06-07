<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://www.icesoft.com/icefaces/component" prefix="i" %>

<f:view>
	<f:loadBundle basename="messages" var="msg" />
	<%@ include file="inc/doctype.jsp"%>
	<html>
	  <head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="description" content="Loginseite des EWA Poker Portals."/>
		<meta name="keywords" content="login EWA poker"/>
		<meta name="language" content="de-AT"/>
	    <title><i:outputText value="#{msg.app_title}" nospan="true"/></title>
	    <link rel="stylesheet" type="text/css" href="./style/screen.css" />
	  </head>
	  <body>
	       <div id="wrapper">
				<div id="header">
					<div id="teaser"></div>
					<h1><i:outputText value="#{msg.login_title}"/></h1>
				</div>
				<div id="body">
					<%@ include file="inc/infoborder.jsp"%>
					<div id="sidebar">
						<%@ include file="inc/menu.jsp"%>
					</div>
					<div id="content">
						<i:form id="loginForm" partialSubmit="true">
							<h2><i:outputText value="#{msg.login_heading}"/></h2>
							<i:messages />
							<i:outputText rendered="#{!loginController.loggedIn}">
							
							<i:panelGrid columns="2">
							
								<i:outputLabel value="#{msg.login_lbl_username}" for="userName"/>
								<i:inputText value="#{loginController.loginUser}" id="userName" required="true" />
								
								<i:outputLabel value="#{msg.login_lbl_pwd}" for="password"/>
								<i:inputSecret value="#{loginController.loginPassword}" id="password" required="true" partialSubmit="false" />
								
							</i:panelGrid>
							<i:commandButton action="#{loginController.login}" value="#{msg.login_btn}"/>
							
							</i:outputText>
							
							<i:outputText rendered="#{loginController.loggedIn}">
							<p><i:outputText value="#{msg.logged_in}" /></p>
							</i:outputText>
						</i:form>
					</div>
				</div>
				<%@ include file="inc/footer.jsp"%>
			</div>
	  </body>
	</html>
</f:view>