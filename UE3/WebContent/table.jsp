<?xml version="1.0" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN"
    "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<%@page contentType="application/xhtml+xml; charset=utf-8" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>

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
	<f:view beforePhase="#{tableController.beforePhase}">
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
					<div id="infoborder"><p>Eingeloggt als <h:outputLabel value="#{playerBean.userName}"/></p></div>
					<div id="sidebar">
	                    <table id="chips">
	                        <tbody>
	                            <tr>
	                                <th colspan="2" xml:lang="en">Chips</th>
	                            </tr>
	                            <tr>
	                                <td>Im Pot</td>
	                                <td><h:outputLabel value="#{gameBean.potSize}" /> &euro;</td>
	                            </tr>
	                            <tr>
	                                <td>Ante</td>
	                                <td><h:outputLabel value="#{gameBean.fixedBetSize}" /> &euro;</td>
	                            </tr>
	                            <tr>
	                                <td>Ihr <span xml:lang="en">Stack</span></td>
	                                <td><h:outputLabel value="#{playerBean.stack}" /> &euro;</td>
	                            </tr>
	                        </tbody>
	                    </table>
					</div>
	                <hr class="accessibility" />
	                <div id="main">
	                	<h:form id="aktionen">
	                        <div id="navigation">
	                            <ul>
	                                <li><h:commandButton action="#{tableController.ante}" value="Neues Spiel" accesskey="n" /></li>
	                                <li><h:commandButton action="#{tableController.leave}" value="Poktertisch verlassen" accesskey="v" /></li>
	                            </ul>
	                        </div>
	                    </h:form>
	                    <div id="table">
	                        <div id="dealercards">
	                            <h2>Karten der Bank</h2>
	                            <span id="dealercard1" xml:lang="en">
		                            <h:graphicImage value="#{gameBean.dealerCardOnePicture}" alt="#{gameBean.dealerCardOne}" title="#{gameBean.dealerCardOne}"/>
	                            </span>
	                            <span id="dealercard2" xml:lang="en">
	                                <h:graphicImage value="#{gameBean.dealerCardTwoPicture}" alt="#{gameBean.dealerCardTwo}" title="#{gameBean.dealerCardTwo}"/>
								</span>
	                        </div>
	                        <div id="communitycards">
	                            <h2>Gemeinschaftskarten</h2>
	                            <span id="flop" xml:lang="en">
	                                <span id="flop1">
	                                	<h:graphicImage value="#{gameBean.communityCardOnePicture}" alt="#{gameBean.communityCardOne}" title="#{gameBean.communityCardOne}"/>
                                	</span>
	                                <span id="flop2">
	                                	<h:graphicImage value="#{gameBean.communityCardTwoPicture}" alt="#{gameBean.communityCardTwo}" title="#{gameBean.communityCardTwo}"/>
                                	</span>
	                                <span id="flop3">
	                                	<h:graphicImage value="#{gameBean.communityCardThreePicture}" alt="#{gameBean.communityCardThree}" title="#{gameBean.communityCardThree}"/>
                                	</span>
	                            </span>
	                            <span id="turn" xml:lang="en">
	                                <h:graphicImage value="#{gameBean.turnCardPicture}" alt="#{gameBean.turnCard}" title="#{gameBean.turnCard}"/>
	                            </span>
	                            <span id="river" xml:lang="en">
	                                <h:graphicImage value="#{gameBean.riverCardPicture}" alt="#{gameBean.riverCard}" title="#{gameBean.riverCard}"/>
	                            </span>
	                        </div>
	                        <div id="betboxes">
	                            <h:form id="moeglicheAktionen">
		                            <h2>Aktionen</h2>
		                            <p xml:lang="en">
										<h:commandButton disabled="#{not gameBean.canFold}" action="#{tableController.fold}" value="FOLD" id="fold" accesskey="f" />
										<h:commandButton disabled="#{not gameBean.canCheck}" action="#{tableController.check}" value="CHECK" id="check" accesskey="c" />
										<h:commandButton disabled="#{not gameBean.canBet}" action="#{tableController.bet}" value="BET" id="bet" accesskey="b" />
		                             </p>
	                            </h:form>
	                        </div>
	                        <div id="result"><p>
	                        	<h:message for="gameBean" />
	                        </p></div>
	                        <div id="playercards">
	                            <h2>Ihre Karten</h2>
	                            <span id="playercard1" xml:lang="en">
	                            	<h:graphicImage value="#{gameBean.playerCardOnePicture}" alt="Your card: #{gameBean.playerCardOne}" title="Your card: #{gameBean.playerCardOne}"/>
	                            </span>
	                            <span id="playercard2" xml:lang="en">
	                            	<h:graphicImage value="#{gameBean.playerCardTwoPicture}" alt="Your card: #{gameBean.playerCardTwo}" title="Your card: #{gameBean.playerCardTwo}"/>
	                            </span>
	                        </div>
	                    </div>
	                </div>
	            </div>
				<div id="footer">
					<p>&copy; 2009 EWA Poker.</p>
				</div>
			</div>
		</f:view>
	</body>
</html>
