<?xml version="1.0" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
    "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<%@page contentType="application/xhtml+xml; charset=utf-8" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<jsp:useBean id="playerBean" scope="session" class="at.ac.tuwien.big.ewa.ue3.PlayerBean" />

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
		<f:view>
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
							<li><a href="#" accesskey="l" xml:lang="en">Login</a></li>
							<li><a href="#" >Registrieren</a></li>
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
									<label class="Float" for="sendeRegistrierung:firstname">Vorname</label>
									<h:inputText id="firstname" label="Vorname" required="true" value="#{playerBean.firstName}"
										requiredMessage="#{registerController.requiredMessage}" />
									<div class="message"><h:message for="firstname" /></div>
								</div>
								<div>
									<label class="Float" for="sendeRegistrierung:lastname">Nachname</label>
									<h:inputText id="lastname" label="Nachname" required="true"
										requiredMessage="#{registerController.requiredMessage}" value="#{playerBean.lastName}" />
									<div class="message"><h:message for="lastname" /></div>
								</div>
								<div>
									<label class="Float" for="sendeRegistrierung:dateofbirth">Geburtsdatum</label>
									<h:inputText id="dateofbirth" label="Geburtsdatum"
										required="true" requiredMessage="#{registerController.requiredMessage}" value="#{playerBean.dateOfBirth}" >
										<f:convertDateTime type="date" pattern="dd.MM.YYYY"/>
									</h:inputText>
									<div class="message"><h:message for="dateofbirth" /></div>
								</div>
								<div>
      				                <label class="Float" for="sendeRegistrierung:sex">Geschlecht</label>
      				                <h:selectOneMenu id="sex" required="true" value="#{playerBean.gender}" 
      				                	requiredMessage="#{registerController.requiredMessage}">
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
										<label class="Float" for="sendeRegistrierung:username">Username</label>
										<h:inputText id="username" label="Username" required="true" value="#{playerBean.userName}"
											requiredMessage="#{registerController.requiredMessage}">
											<f:validator validatorId="UsernameValidator"/>
										</h:inputText>
										<div class="message"><h:message for="username" /></div>
									</div>
	
									<div>
										<label class="Float" for="sendeRegistrierung:password">Passwort</label>
										<h:inputSecret id="password" label="Passwort" required="true" value="#{playerBean.password}"
											requiredMessage="#{registerController.requiredMessage}">
											<f:validateLength minimum="8" />
										</h:inputSecret>
										<div class="message"><h:message for="password" /></div>
									</div>
	
									<div>
										<label class="Float" for="sendeRegistrierung:stack">Gr&ouml;&szlig;e des
											Gr&ouml;&szlig;e des Stack<span xml:lang="en">Stack</span></label>
										<h:inputText id="stack" label="Gr&ouml;&szlig;e des Stack" required="true" value="#{playerBean.stack}"
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
					<p>&copy; 2008 EWA Poker.</p>
				</div>
			</div>
		</f:view>
	</body>
</html>
