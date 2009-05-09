<?xml version="1.0" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
    "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<%@page contentType="application/xhtml+xml; charset=utf-8" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de">
	<head>
		<title>EWA Poker :: Willkommen</title>
		<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8"/>
		<meta name="description" content="Registrierungsseite des EWA Poker Portals."/>
		<meta name="keywords" content="willkommen EWA poker"/>
		<meta name="language" content="de-AT"/>
		<link rel="stylesheet" type="text/css" href="styles/screen.css"/>
	</head>
	<body>
		<f:view beforePhase="#{welcomeController.beforePhase}">
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
					<h:form>
						<div id="infoborder"><p>Eingeloggt als <h:outputLabel value="#{playerBean.userName}"/></p></div>
						<div id="sidebar">
							<ul id="navigation">
								<li><h:commandLink action="#{welcomeController.table}">Zum Pokertisch</h:commandLink></li>
								<li><h:commandLink action="#{welcomeController.account}">Daten &auml;ndern</h:commandLink></li>
								<li><h:commandLink action="#{welcomeController.logout}">Logout</h:commandLink></li>
							</ul>
						</div>
						<hr class="accessibility" />
						<div id="main">
	                        <div id="navigation">
	                            <ul>
	                                <li><h:commandButton id="table" accesskey="t" action="#{welcomeController.table}" value="Zum Pokertisch"/></li>
	                                <li><h:commandButton id="account" accesskey="d" action="#{welcomeController.account}" value="Daten ändern"/></li>
	                                <li><h:commandButton id="logout" accesskey="l" action="#{welcomeController.logout}" value="Logout"/></li>
	                            </ul>
	                        </div>
		                    <div id="content">
								<h2>Willkommen</h2>
								<p>beim "Entwicklung von Web-Anwendungen" Easy-Holdem-Poker.</p>
								<h3>Spielregeln</h3>
								<p>Easy Hold‘em ist eine vereinfachte Spielvariante des bekannten Texas 
									Hold‘em. Die Regeln sind im Großen und Ganzen gleich. Der einzige 
									Unterschied: Sie haben nicht viele Gegner, sondern nur einen – die Bank. 
									Sie (der Spieler) sowie die Bank erhalten je zwei verdeckte Karten. 
									Danach werden 5 Karten offen aufgelegt (Common Cards): Erst drei 
									(Flop), dann eine (Turn) und zum Schluss noch eine (River). Aus den 
									eigenen verdeckten Karten und den Common Cards wird das beste 5er- 
									Blatt gebildet und mit dem des Croupiers verglichen. Sie gewinnen, wenn 
									Sie ein besseres Blatt haben als der Croupier.</p>
								<h4>Ablauf</h4>
								<p>Zunächst platzieren Sie Ihren Einsatz (Ante) und Sie bekommen zwei 
									verdeckte Karten (Hole Cards); der Croupier erhält ebenfalls zwei 
									verdeckte Karten. 
									Nach dem Erhalt der beiden verdeckten Karten können Sie entscheiden, 
									ob Sie weiterspielen wollen oder nicht. Wollen Sie nicht weiterspielen 
									(fold) kassiert die Bank Ihr Ante. Entscheiden Sie sich für das 
									Weiterspielen, platzieren Sie einen Einsatz in der Höhe des Ante (bet). 
									Dann wird der Flop (die ersten 3 Karten der Common Cards) offen auf den 
									Tisch gelegt. Sind Sie mit Ihrem Blatt zufrieden, können Sie vor der Turn- 
									Card noch einen Einsatz in der Höhe des Antes tätigen (bet) oder ohne 
									weiteren Einsatz mitgehen (check). Diese Aktionen stehen Ihnen auch vor 
									der River-Card zur Wahl. 
									Liegen alle Karten (Ihre 2, 2 vom Croupier, 5 Common Cards) auf dem 
									Tisch, kommt es zum Showdown. Dabei wird die Hand (die besten 5 
									Karten) des Croupiers Ihrer Hand gegenübergestellt und ein eventueller 
									Gewinn ausgezahlt bzw. Ihre Einsätze von der Bank einbehalten. 
									Starten Sie während des Spielverlaufes ein neues Spiel, so verlieren Sie 
									Ihren bisherigen Einsatz.</p>
							</div>
						</div>
					</h:form>
				</div>
				<div id="footer">
					<p>&copy; 2009 EWA Poker.</p>
				</div>
			</div>
		</f:view>
	</body>
</html>
