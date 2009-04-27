<?xml version="1.0" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
    "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="at.ac.tuwien.big.easyholdem.game.State"%>
<jsp:useBean id="gameBean" class="at.ac.tuwien.big.easyholdem.game.Game" scope="session" />

<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="de">
	<head>
		<title>EWA Poker :: Tisch 1</title>
		<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8"/>
		<meta name="description" content="Pokertisch des EWA Poker Portals."/>
		<meta name="keywords" content="tisch EWA poker"/>
		<meta name="language" content="de-AT"/>
		<link rel="stylesheet" type="text/css" href="styles/screen.css"/>
	</head>
	<body>
		<ul class="accessibility">
			<li><a href="#table" accesskey="0">Spielfeld</a></li>
			<li><a href="#navigation" accesskey="1">Navigation</a></li>
			<li><a href="#chips" accesskey="2" xml:lang="en">Chips</a></li>
			<li><a href="#news" accesskey="3" xml:lang="en">News</a></li>
			<li><a href="#probabilities" accesskey="4">Wahrscheinlichkeitstabelle</a></li>
		</ul>
		<div id="wrapper">
			<div id="header">
				<div id="teaser">

				</div>
				<h1>EWA Poker</h1>
			</div>
			<div id="body">
				<div id="infoborder"><p>Eingeloggt als <em xml:lang="en" ><%= gameBean.getPlayer().getUserName() %></em>.</p></div>
				<div id="sidebar">
					<jsp:include page="WEB-INF/chips.jsp" flush="true" />
					<hr class="accessibility" />
					<jsp:include page="WEB-INF/probabilities.jsp" flush="true" />
				</div>
					<hr class="accessibility" />
					<div id="main">
						<div id="navigation">
							<form method="post" action="Poker">
								<ul>
									<li><input type="submit" name="changeUserData" value="Userdaten &auml;ndern" accesskey="u" disabled="disabled" /></li>
									<li><input type="submit" name="newGame" value="Neues Spiel" accesskey="n" /></li>
									<li><input type="submit" name="logout" value="Ausloggen" accesskey="o" disabled="disabled" /></li>
								</ul>
							</form>
						</div>
						<% if(gameBean.getState() != State.END) { %>
							<jsp:include page="WEB-INF/table.jsp" flush="true" />
						<% } else { %>
							<jsp:include page="WEB-INF/table_result.jsp" flush="true" />
						<% } %>
				</div>
			</div>
			<div id="footer">
				<p>&copy; 2008 EWA Poker.</p>
			</div>
		</div>
	</body>
</html>
