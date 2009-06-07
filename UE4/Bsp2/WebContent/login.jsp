<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>

<f:view>
	<f:loadBundle basename="messages" var="msg" />
	<%@ include file="inc/doctype.jsp"%>
	<html>
	  <head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="description" content="Loginseite des EWA Poker Portals."/>
		<meta name="keywords" content="login EWA poker"/>
		<meta name="language" content="de-AT"/>
	    <title><h:outputText value="#{msg.app_title}"/></title>
	    <link rel="stylesheet" type="text/css" href="./style/screen.css" />
	  </head>
	  <body>
	       <div id="wrapper">
				<div id="header">
					<div id="teaser"></div>
					<h1><h:outputText value="#{msg.login_title}"/></h1>
				</div>
				<div id="body">
					<%@ include file="inc/infoborder.jsp"%>
					<div id="sidebar">
						<%@ include file="inc/menu.jsp"%>
					</div>
					<div id="content">
						<h2><h:outputText value="#{msg.login_heading}"/></h2>
						<h:messages />
						<h:outputText rendered="#{!loginController.loggedIn}">
						<h:form id="loginForm">
							<h:panelGrid columns="2">
							
								<h:outputLabel value="#{msg.login_lbl_username}" for="userName"/>
								<h:inputText value="#{loginController.loginUser}" id="userName" required="true" />
								
								<h:outputLabel value="#{msg.login_lbl_pwd}" for="password"/>
								<h:inputSecret value="#{loginController.loginPassword}" id="password" required="true" />
								
							</h:panelGrid>
							<h:commandButton action="#{loginController.login}" value="#{msg.login_btn}"/>
						</h:form>
						</h:outputText>
						
						<h:outputText rendered="#{loginController.loggedIn}">
						<p><h:outputText value="#{msg.logged_in}" /></p>
						</h:outputText>
					</div>
				</div>
				<%@ include file="inc/footer.jsp"%>
			</div>
	  </body>
	</html>
</f:view>