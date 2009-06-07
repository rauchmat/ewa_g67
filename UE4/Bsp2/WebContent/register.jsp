<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://www.icesoft.com/icefaces/component" prefix="i" %>

<f:view>
	<f:loadBundle basename="messages" var="msg" />
	<%@ include file="inc/doctype.jsp"%>
	<html>
	  <head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="description" content="Registrierungsseite des EWA Poker Portals."/>
		<meta name="keywords" content="register EWA poker"/>
		<meta name="language" content="de-AT"/>
	    <title><h:outputText value="#{msg.app_title}"/></title>
	    <link rel="stylesheet" type="text/css" href="./style/screen.css" />
    	<link rel="stylesheet" type="text/css" href="./xmlhttp/css/xp/xp.css" />
	  </head>
	  <body>
	       <div id="wrapper">
				<div id="header">
					<div id="teaser"></div>
					<h1><h:outputText value="#{msg.register_title}"/></h1>
				</div>
				<div id="body">
					<%@ include file="inc/infoborder.jsp"%>
					<div id="sidebar">
						<%@ include file="inc/menu.jsp"%>
					</div>
					<div id="content">
						<h2><h:outputText value="#{msg.register_heading}"/></h2>
						<h:outputText rendered="#{!loginController.loggedIn}">
						<i:form id="registerForm">
							<i:messages/>
							<h:panelGrid columns="3">

								<h:outputLabel value="#{msg.register_lbl_firstname}" for="firstName"/>
								<i:inputText value="#{registerController.regPlayer.firstName}" id="firstName" required="true" partialSubmit="true"/>
								<i:message for="firstName"/>
								
								<h:outputLabel value="#{msg.register_lbl_lastname}" for="lastName"/>
								<i:inputText value="#{registerController.regPlayer.lastName}" id="lastName" required="true" partialSubmit="true"/>
								<i:message for="lastName"/>
								
								<h:outputLabel value="#{msg.register_lbl_gender}" for="gender"/>
								<i:selectOneMenu value="#{registerController.regGender}" id ="gender" required="true" partialSubmit="true">
									<f:selectItem itemLabel="#{msg.register_male}" itemValue="m"/>
									<f:selectItem itemLabel="#{msg.register_female}" itemValue="w"/>
								</i:selectOneMenu>
								<i:message for="gender"/>
								
								<h:outputLabel value="#{msg.register_lbl_dateOfBirth}" for="dateOfBirth" />
								<i:selectInputDate id="dateOfBirth" value="#{registerController.regPlayer.dateOfBirth}" renderAsPopup="true"
									renderMonthAsDropdown="true" renderYearAsDropdown="true" popupDateFormat="dd.MM.yyyy"
									title="#{msg.register_lbl_dateOfBirth}" partialSubmit="true">
									<f:convertDateTime pattern="dd.MM.yyyy" />
								</i:selectInputDate>
							  	<i:message for="dateOfBirth" />
							  	
							  	<h:outputLabel value="#{msg.register_lbl_stack}" for="stack"/>
								<i:inputText value="#{registerController.regPlayer.stack}" id ="stack" required="true" partialSubmit="true">
									<f:validateLongRange minimum="100" maximum="10000"/>
								</i:inputText>
								<i:message for="stack"/>
								
								<h:outputLabel value="#{msg.register_lbl_username}" for="userName"/>
								<i:inputText value="#{registerController.regPlayer.userName}" id="userName" required="true" partialSubmit="true" validator="#{registerController.validateUsername}">
									<f:validateLength minimum="6"/>
								</i:inputText>
								<i:message for="userName" />
								
								<h:outputLabel value="#{msg.register_lbl_pwd}" for="password"/>
								<i:inputSecret value="#{registerController.regPlayer.password}" id="password" required="true" partialSubmit="true">
									<f:validateLength minimum="6"/>
								</i:inputSecret>
								<i:message for="password" showDetail="false"/>
								
							</h:panelGrid>
							<i:commandButton action="#{registerController.register}" value="#{msg.register_btn}"/>
						</i:form>
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