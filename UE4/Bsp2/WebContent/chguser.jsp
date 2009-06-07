<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>

<f:view>
	<f:loadBundle basename="messages" var="msg" />
	<%@ include file="inc/doctype.jsp"%>
	<html>
	  <head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="description" content="Spielerdaten ändern beim EWA Poker Portals."/>
		<meta name="keywords" content="Spielerdaten ändern EWA poker"/>
		<meta name="language" content="de-AT"/>
	    <title><h:outputText value="#{msg.app_title}"/></title>
	    <link rel="stylesheet" type="text/css" href="./style/screen.css" />
	  </head>
	  <body>
	       <div id="wrapper">
				<div id="header">
					<div id="teaser"></div>
					<h1><h:outputText value="#{msg.chguser_title}"/></h1>
				</div>
				<div id="body">
					<%@ include file="inc/infoborder.jsp"%>
					<div id="sidebar">
						<%@ include file="inc/menu.jsp"%>
					</div>
					<div id="content">
						<h2><h:outputText value="#{msg.chguser_heading}"/></h2>
						<h:outputText rendered="#{loginController.loggedIn}">
						<h:messages/>
						<h:form id="chgStackForm">
							<h3><h:outputText value="#{msg.chgstack_heading}"/></h3>
							<h:panelGrid columns="3">
							  	
							  	<h:outputLabel value="#{msg.chg_user_lbl_stack}" for="stack"/>
								<h:inputText value="#{registerController.loggedInPlayer.stack}" id ="stack" required="true">
									<f:validateLongRange minimum="100" maximum="10000"/>
								</h:inputText>
								<h:commandButton action="#{registerController.changeUser}" value="#{msg.change_stack_btn}"/>
								
							</h:panelGrid>

						</h:form>
						
						<h:form id="chgPasswordForm">
							<h3><h:outputText value="#{msg.chgpwd_heading}"/></h3>
							<h:panelGrid columns="3">
								
								<h:outputLabel value="#{msg.chg_user_lbl_pwd}" for="password"/>
								<h:inputSecret value="#{registerController.loggedInPlayer.password}" id="password" required="true">
									<f:validateLength minimum="6"/>
								</h:inputSecret>
								<h:commandButton action="#{registerController.changeUser}" value="#{msg.change_pwd_btn}"/>
								
							</h:panelGrid>
						</h:form>
						</h:outputText>
						
						<h:outputText rendered="#{!loginController.loggedIn}">
						<p><h:outputText value="#{msg.not_logged_in}" /></p>
						</h:outputText>
					</div>
				</div>
				<%@ include file="inc/footer.jsp"%>
			</div>
	  </body>
	</html>
</f:view>