<?xml version="1.0" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
    "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<%@page contentType="application/xhtml+xml; charset=utf-8" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de">
	<head>
		<title>EWA Poker :: Registrieren</title>
		<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8"/>
		<meta name="description" content="Registrierungsseite des EWA Poker Portals."/>
		<meta name="keywords" content="register EWA poker"/>
		<meta name="language" content="de-AT"/>
		<link rel="stylesheet" type="text/css" href="styles/screen.css"/>
	</head>
	<body>
		<f:view beforePhase="#{registerController.beforePhase}">
			<ul class="accessibility">
				<li><a href="#content" accesskey="0">Registrierungs-Formular</a></li>
				<li><a href="#navigation" accesskey="1">Navigation</a></li>
			</ul>
			<div id="wrapper">
				<div id="header">
					<div id="teaser">
	
					</div>
					<h1>EWA Poker</h1>
				</div>
				<div id="body">
					<div id="infoborder"><p><a href="#">Einloggen</a> oder <a href="#">Registrieren</a></p></div>
					<div id="sidebar">
						<ul id="navigation">
							<li><a href="faces/login.jsp" accesskey="l" xml:lang="en">Login</a></li>
							<li><a href="faces/register.jsp" >Registrieren</a></li>
						</ul>
					</div>
					<hr class="accessibility" />
					<div id="content">
						<h2>Registrieren</h2>
						<p>Bitte f&uuml;llen Sie das untenstehende Formular aus!</p>
						
							<h:form id="sendeRegistrierung">
							<h3>Pers&ouml;nliche Daten</h3>
	
							<div class="formblock">
							<fieldset>
							
								<div>
									<h:outputLabel for="firstname">Vorname</h:outputLabel>
									<h:inputText id="firstname" label="Vorname" required="true"
										value="#{requestPlayerBean.firstName}"
										requiredMessage="#{registerController.requiredMessage}" />
									<div class="message"><h:message for="firstname" /></div>
								</div>
								
								<div>
									<h:outputLabel for="lastname">Nachname</h:outputLabel>
									<h:inputText id="lastname" label="Nachname" required="true"
										requiredMessage="#{registerController.requiredMessage}"
										value="#{requestPlayerBean.lastName}" />
									<div class="message"><h:message for="lastname" /></div>
								</div>
								
								<div>
									<h:outputLabel for="dateofbirth">Geburtsdatum</h:outputLabel>
									<h:inputText id="dateofbirth" label="Geburtsdatum"
										required="true" requiredMessage="#{registerController.requiredMessage}"
										value="#{requestPlayerBean.dateOfBirth}" >
										<f:convertDateTime type="date" pattern="dd.MM.yyyy" dateStyle="short" />
									</h:inputText>
									<div class="message"><h:message for="dateofbirth" /></div>
								</div>
								
								<div>
      				                <h:outputLabel for="sex">Geschlecht</h:outputLabel>
      				                <h:selectOneMenu id="sex" required="true" value="#{requestPlayerBean.gender}" 
      				                	requiredMessage="#{registerController.requiredMessage}" converter="GenderConverter">
      				                	<f:selectItems value="#{registerController.genders}" />
									</h:selectOneMenu>
      				                <div class="message"><h:message for="sex" /></div>
              					</div>
              					
							</fieldset>
							</div>
	
							<h3><span xml:lang="en">Login</span> Daten und Gr&ouml;&szlig;e des
								<span xml:lang="en">Stack</span></h3>
							<div class="formblock">
								<fieldset>
								
									<div>
										<h:outputLabel for="username">Username</h:outputLabel>
										<h:inputText id="username" label="Username" required="true"
											value="#{requestPlayerBean.userName}"
											requiredMessage="#{registerController.requiredMessage}">
											<f:validator validatorId="UsernameValidator"/>
										</h:inputText>
										<div class="message"><h:message for="username" /></div>
									</div>
	
									<div>
										<h:outputLabel for="password">Passwort</h:outputLabel>
										<h:inputSecret id="password" label="Passwort" required="true"
											value="#{requestPlayerBean.password}"
											requiredMessage="#{registerController.requiredMessage}">
											<f:validateLength minimum="8" />
										</h:inputSecret>
										<div class="message"><h:message for="password" /></div>
									</div>
	
									<div>
										<h:outputLabel for="stack">Gr&ouml;&szlig;e des
											<span xml:lang="en">Stack</span></h:outputLabel>
										<h:inputText id="stack" label="Größe des Stack" required="true"
											value="#{requestPlayerBean.stack}"
											requiredMessage="#{registerController.requiredMessage}">
											<f:convertNumber />
										</h:inputText>
										<div class="message"><h:message for="stack" /></div>
									</div>
									
								</fieldset>
							</div>
							<div id="buttons">
								<h:commandButton accesskey="r" value="Registrieren"
									action="#{registerController.register}" />
							</div>
						</h:form>
					</div>
				</div>
				<div id="footer">
					<p>&copy; 2009 EWA Poker.</p>
				</div>
			</div>
		</f:view>
	</body>
</html>
