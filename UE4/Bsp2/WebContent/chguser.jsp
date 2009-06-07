<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://www.icesoft.com/icefaces/component" prefix="i" %>

<f:view>
	<f:loadBundle basename="messages" var="msg" />
	<%@ include file="inc/doctype.jsp"%>
	<html>
	  <head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="description" content="Spielerdaten ändern beim EWA Poker Portals."/>
		<meta name="keywords" content="Spielerdaten ändern EWA poker"/>
		<meta name="language" content="de-AT"/>
	    <title><i:outputText value="#{msg.app_title}"/></title>
	    <link rel="stylesheet" type="text/css" href="./style/screen.css" />
	  </head>
	  <body>
	       <div id="wrapper">
				<div id="header">
					<div id="teaser"></div>
					<h1><i:outputText value="#{msg.chguser_title}"/></h1>
				</div>
				<div id="body">
					<%@ include file="inc/infoborder.jsp"%>
					<div id="sidebar">
						<%@ include file="inc/menu.jsp"%>
					</div>
					<div id="content">
						<h2><i:outputText value="#{msg.chguser_heading}"/></h2>
						<i:outputText rendered="#{loginController.loggedIn}">
						<i:form id="chgStackForm">
							<i:messages/>
							
							<h3><i:outputText value="#{msg.chgstack_heading}"/></h3>
							<i:panelGrid columns="3">
							  	
							  	<i:outputLabel value="#{msg.chg_user_lbl_stack}" for="stack"/>
								<i:inputText value="#{registerController.loggedInPlayer.stack}" id ="stack" required="true">
									<f:validateLongRange minimum="100" maximum="10000"/>
								</i:inputText>
								<i:commandButton action="#{registerController.changeUser}" value="#{msg.change_stack_btn}"/>
								
							</i:panelGrid>

						</i:form>
						
						<i:form id="chgPasswordForm">
							<h3><i:outputText value="#{msg.chgpwd_heading}"/></h3>
							<i:panelGrid columns="3">
								
								<i:outputLabel value="#{msg.chg_user_lbl_pwd}" for="password"/>
								<i:inputSecret value="#{registerController.loggedInPlayer.password}" id="password" required="true">
									<f:validateLength minimum="6"/>
								</i:inputSecret>
								<i:commandButton action="#{registerController.changeUser}" value="#{msg.change_pwd_btn}"/>
								
							</i:panelGrid>
						</i:form>
						</i:outputText>
						
						<i:outputText rendered="#{!loginController.loggedIn}">
						<p><i:outputText value="#{msg.not_logged_in}" /></p>
						</i:outputText>
					</div>
				</div>
				<%@ include file="inc/footer.jsp"%>
			</div>
	  </body>
	</html>
</f:view>