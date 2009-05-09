<?xml version="1.0" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
    "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<%@page contentType="application/xhtml+xml; charset=utf-8" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de">
	<head>
		<title>EWA Poker :: Benutzerdaten &auml;ndern</title>
		<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8"/>
		<meta name="description" content="Benutzerdatenverwaltungs-Seite des EWA Poker Portals."/>
		<meta name="keywords" content="account EWA poker"/>
		<meta name="language" content="de-AT"/>
		<link rel="stylesheet" type="text/css" href="styles/screen.css"/>
	</head>
	<body>
		<f:view beforePhase="#{accountController.beforePhase}">
			<!-- ul class="accessibility">
				<li><a href="#content" accesskey="0">Benutzerdaten-Formular</a></li>
				<li><a href="#navigation" accesskey="1">Navigation</a></li>
			</ul-->
			<div id="wrapper">
				<div id="header">
					<div id="teaser">
	
					</div>
					<h1>EWA Poker</h1>
				</div>
				<div id="body">
					<div id="infoborder"><p>Eingeloggt als <h:outputLabel value="#{playerBean.userName}"/></p></div>
					<hr class="accessibility" />
					<div id="content" style="margin-left:0">
						<h2>Benutzerdaten</h2>
						<p>&Auml;ndern Sie die gew&uuml;nschten Daten im untenstehenden Formular.</p>
						
						<h:form id="sendeAenderungen">
							<h3><span xml:lang="en">Login</span> Daten und Gr&ouml;&szlig;e des
								<span xml:lang="en">Stack</span></h3>
							<div class="formblock">
								<fieldset>

									<div>
										<h:outputLabel for="password">Passwort</h:outputLabel>
										<h:inputSecret id="password" label="Passwort" value="#{playerBean.password}">
											<f:validateLength minimum="8" />
										</h:inputSecret>
										<div class="message"><h:message for="password" /></div>
									</div>
	
									<div>
										<h:outputLabel for="stack">Gr&ouml;&szlig;e des
											<span xml:lang="en">Stack</span></h:outputLabel>
										<h:inputText id="stack" label="Größe des Stack" required="true" value="#{playerBean.stack}"
											requiredMessage="Geben Sie einen Wert für den Stack an.">
											<f:convertNumber />
										</h:inputText>
										<div class="message"><h:message for="stack" /></div>
									</div>
									
								</fieldset>
							</div>
							<div id="buttons">
								<h:commandButton accesskey="s" value="Speichern" action="#{accountController.save}" />
								<h:commandButton accesskey="a" value="Abbrechen" action="#{accountController.cancel}" />
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
