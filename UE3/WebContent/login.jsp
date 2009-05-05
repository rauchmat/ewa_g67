<?xml version="1.0" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
    "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<%@page contentType="application/xhtml+xml; charset=utf-8" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de">
	<head>
		<title>EWA Poker :: Login</title>
		<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8"/>
		<meta name="description" content="Registrierungsseite des EWA Poker Portals."/>
		<meta name="keywords" content="login EWA poker"/>
		<meta name="language" content="de-AT"/>
		<link rel="stylesheet" type="text/css" href="styles/screen.css"/>
	</head>
	<body>
		<f:view beforePhase="#{loginController.beforePhase}">
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
							<li><a href="faces/login.jsp" xml:lang="en">Login</a></li>
							<li><a href="faces/register.jsp" accesskey="r">Registrieren</a></li>
						</ul>
					</div>
					<hr class="accessibility" />
					<div id="content">
						<h2>Login</h2>
						<p>Bitte f&uuml;llen Sie das untenstehende Formular aus!</p>
						
							<h:form id="sendeLogin">
							
							<div class="formblock">
							<fieldset>
							
								<div>
									<h:outputLabel for="username">Username</h:outputLabel>
									<h:inputText id="username" label="Username" required="true"
										value="#{playerBean.userName}"
										requiredMessage="Geben Sie einen Benutzernamen ein." />
									<div class="message"><h:message for="username" /></div>
								</div>

								<div>
									<h:outputLabel for="password">Passwort</h:outputLabel>
									<h:inputSecret id="password" label="Passwort" required="true"
										value="#{playerBean.password}"
										requiredMessage="Geben Sie ein Passwort ein.">
									</h:inputSecret>
									<div class="message"><h:message for="password" /></div>
								</div>
								
							</fieldset>
							</div>
	
							<div id="buttons">
								<h:commandButton accesskey="l" value="Einloggen"
									action="#{loginController.login}" />
							</div>
							
							<h3>Fehler</h3>
							<p>
								<h:message for="#{loginController}"></h:message>
							</p>
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
