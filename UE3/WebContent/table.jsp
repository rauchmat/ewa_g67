<?xml version="1.0" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
    "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<%@page contentType="application/xhtml+xml; charset=utf-8" %>
<%@page import="at.ac.tuwien.big.easyholdem.game.Action" %>
<jsp:useBean id="gameBean" class="at.ac.tuwien.big.ewa.ue3.GameBean" scope="session"></jsp:useBean>

<html xmlns="http://www.w3.org/1999/xhtml"  xml:lang="de">
	<head>
		<title>EWA Poker :: Tisch 1</title>
		<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8"/>
		<meta name="description" content="Registrierungsseite des EWA Poker Portals."/>
		<meta name="keywords" content="register EWA poker"/>
		<meta name="language" content="de-AT"/>
		<link rel="stylesheet" type="text/css" href="styles/screen.css"/>
	</head>
	<body>
	<ul class="accessibility">
		<li><a href="#table" accesskey="0">Spielfeld</a></li>
		<li><a href="#navigation" accesskey="1">Navigation</a></li>
		<li><a href="#chips" accesskey="2" xml:lang="en">Chips</a></li>
	</ul>
		<div id="wrapper">
			<div id="header">
				<div id="teaser">
				</div>
				<h1>EWA Poker</h1>
			</div>
			<div id="body">
				<div id="infoborder"><p>Sie sind nicht eingeloggt.</p></div>
				<div id="sidebar">
                    <table id="chips">
                        <tbody>
                            <tr>
                                <th colspan="2" xml:lang="en">Chips</th>
                            </tr>
                            <tr>
                                <td>Im Pot</td>
                                <td><%= gameBean.getPotSize() %> &euro;</td>
                            </tr>
                            <tr>
                                <td>Ante</td>
                                <td><%= gameBean.getFixedBetSize()   %> &euro;</td>
                            </tr>
                            <tr>
                                <td>Ihr <span xml:lang="en">Stack</span></td>
                                <td><%= gameBean.getStack()  %> &euro;</td>
                            </tr>
                        </tbody>
                    </table>
				</div>
                <hr class="accessibility" />
                <div id="main">
                    <form method="post" action="?act=newgame">
                        <div id="navigation">
                            <ul>
                                <li><input type="submit" name="submit" value="Neues Spiel" accesskey="n"/></li>
                            </ul>
                        </div>
                    </form>
                    <div id="table">
                        <div id="dealercards">
                            <h2>Karten der Bank</h2>
                            <span id="dealercard1" xml:lang="en">
                                <img src="<%=gameBean.getDealerCardOnePic()%>" alt="<%=gameBean.getDealerCardOne()%>" title="<%=gameBean.getDealerCardOne()%>"/>
                            </span>
                            <span id="dealercard2" xml:lang="en">
                                <img src="<%=gameBean.getDealerCardTwoPic()%>" alt="<%=gameBean.getDealerCardTwo()%>" title="<%=gameBean.getDealerCardTwo()%>" />														 </span>
                        </div>
                        <div id="communitycards">
                            <h2>Gemeinschaftskarten</h2>
                            <span id="flop" xml:lang="en">
                                <span id="flop1"><img src="<%=gameBean.getCommunityCardOnePic()%>" alt="<%=gameBean.getCommunityCardOne()%>" title="<%=gameBean.getCommunityCardOne()%>" /></span>
                                <span id="flop2"><img src="<%=gameBean.getCommunityCardTwoPic()%>" alt="<%=gameBean.getCommunityCardTwo()%>" title="<%=gameBean.getCommunityCardTwo()%>" /></span>
                                <span id="flop3"><img src="<%=gameBean.getCommunityCardThreePic()%>" alt="<%=gameBean.getCommunityCardThree()%>" title="<%=gameBean.getCommunityCardThree()%>"/></span>
                            </span>
                            <span id="turn" xml:lang="en">
                                <img src="<%=gameBean.getTurnCardPic()%>" alt="<%=gameBean.getTurnCard()%>" title="<%=gameBean.getTurnCard()%>" />
                            </span>
                            <span id="river" xml:lang="en">
                                <img src="<%=gameBean.getRiverCardPic()%>" alt="<%=gameBean.getRiverCard()%>" title="<%=gameBean.getRiverCard()%>" />
                            </span>
                        </div>
                        <div id="betboxes">
                            <form action="?act=play" method="post" id="moeglicheAktionen">
                            <h2>Aktionen</h2>
                            <p xml:lang="en">
                                <% if(gameBean.getPossibleActions().contains(Action.FOLD)){%>
                                <input type="submit" value="FOLD" accesskey="f" name="submit"/>
                                <% } %>
                                 <% if(gameBean.getPossibleActions().contains(Action.CHECK)){%>
                                <input type="submit" value="CHECK" accesskey="c" name="submit"/>
                                 <% } %>
                                 <% if(gameBean.getPossibleActions().contains(Action.BET)){%>
                                <input type="submit" value="BET" accesskey="b" name="submit"/>
                                 <% } %>
                             </p>
                            </form>
                        </div>
                        <div id="result"><p>
                        <% if (gameBean.getGame().getShowdownResult() != null) { %>
                            <% if (gameBean.getGame().getShowdownResult().hasPlayerWon()) { %>
                                Sie haben mit <%=gameBean.getPlayersHandRank()%> gegen <%=gameBean.getDealersHandRank()%> <em>gewonnen</em>.
                            <% } else if (gameBean.getGame().getShowdownResult().isSplitPot()) {  %>
                                Der Pot wird geteilt <%=gameBean.getPlayersHandRank()%>.
                            <% } else if (gameBean.getGame().getShowdownResult().getPlayersHandRank() == null) {  %>
                               Sie haben aufgegeben und ihren Einsatz verloren.
                            <% } else {  %>
                                Sie haben mit <%=gameBean.getPlayersHandRank()%> gegen <%=gameBean.getDealersHandRank()%> <em>verloren</em>.
                            <% }  %>
                        <% } %>
                        </p></div>
                        <div id="playercards">
                            <h2>Ihre Karten</h2>
                            <span id="playercard1" xml:lang="en">
                                <img src="<%= gameBean.getPlayerCardOnePic() %>" alt="Your card: <%= gameBean.getPlayerCardOne() %>" title="Your card: <%= gameBean.getPlayerCardOne() %>" />
                            </span>
                            <span id="playercard2" xml:lang="en">
                                <img src="<%= gameBean.getPlayerCardTwoPic() %>" alt="Your card: <%= gameBean.getPlayerCardTwo() %>" title="Your card: <%= gameBean.getPlayerCardTwo() %>" />
                            </span>
                        </div>
                    </div>
                </div>
            </div>
			<div id="footer">
				<p>&copy; 2009 EWA Poker.</p>
			</div>
		</div>
	</body>
</html>
