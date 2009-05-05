<?xml version="1.0" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
    "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<%@page contentType="application/xhtml+xml; charset=utf-8" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="de">
	<head>
		<title>EWA Poker :: Welcome</title>
		<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8"/>
		<meta name="description" content="Index Seite des EWA Poker Portals."/>
		<meta name="keywords" content="index EWA poker"/>
		<meta name="language" content="de-AT"/>
		<link rel="stylesheet" type="text/css" href="styles/screen.css"/>
	</head>
	<body>
	<f:view>
			<div id="wrapper">
				<div id="header">
					<div id="teaser">
					</div>
					<h1>EWA Poker</h1>
				</div>
				<div id="body">
					<div id="infoborder"><p>Sie sind nicht eingeloggt.</p></div>
	                <div id="sidebar">
	                    <ul id="navigation">
							<li xml:lang="en"><a accesskey="l" href="faces/login.jsp">Login</a></li>
							<li><a accesskey="r" href="faces/register.jsp">Registrieren</a></li>
						</ul>
					</div>
	                <hr class="accessibility" />
					<div id="content">
	                    <h2>Willkommen</h2>
	                    <p>Herzlich willkommen beim <abbr title="Entwicklung von Web-Anwendungen">EWA</abbr> Poker Spiel.</p>
	                    <p>Um ein Spiel zu starten, m&uuml;ssen Sie sich <a href="faces/login.jsp">einloggen</a>.</p>
	                    <p>Falls Sie noch keinen Benutzeraccount haben, k&ouml;nnen Sie sich <a href="faces/register.jsp">registrieren</a>.</p>
	                </div>
	            </div>
	            <div id="footer">
					<p>&copy; 2009 EWA Poker.</p>
				</div>
			</div>
		</f:view>
	</body>
</html>