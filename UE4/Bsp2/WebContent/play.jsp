<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>

<f:view>
	<f:loadBundle basename="messages" var="msg" />
	<%@ include file="inc/doctype.jsp"%>
	<html>
	  <head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="description" content="Pokertisch des EWA Poker Portals."/>
		<meta name="keywords" content="tisch EWA poker"/>
		<meta name="language" content="de-AT"/>
	    <title><h:outputText value="#{msg.app_title}"/></title>
	    <link rel="stylesheet" type="text/css" href="./style/screen.css" />
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
						<h:outputText rendered="#{gameController.gameActive && loginController.loggedIn}">
							<table id="chips">
								<tbody>
									<tr>
										<th colspan="2"><h:outputText value="#{msg.play_chips}"/></th>
									</tr>
									<tr>
										<td><h:outputText value="#{msg.play_in_pot}"/></td>
										<td><h:outputText value="#{gameController.game.potSize}"/> &euro;</td>
									</tr>
									<tr>
										<td><h:outputText value="#{msg.play_ante}"/></td>
										<td><h:outputText value="#{gameController.game.fixedBetSize}"/> &euro;</td>
									</tr>
									<tr>
										<td><h:outputText value="#{msg.play_your_stack}"/></td>
										<td><h:outputText value="#{gameController.game.player.stack}"/> &euro;</td>
									</tr>
								</tbody>
							</table>
                        </h:outputText>
					</div>
					<div id="main">
                        <div id="navigation">
                            <h:outputText rendered="#{loginController.loggedIn}">
                                <h:form id="tableForm">
                                    <ul>
                                        <li>
                                            <h:commandButton action="#{gameController.newGame}" value="#{msg.menu_new_game}" accesskey="n" />
                                        </li>
                                        <li>
                                            <h:commandButton action="#{gameController.quitGame}" value="#{msg.menu_leave_table}" accesskey="l" />
                                        </li>
                                    </ul>
                                </h:form>
                            </h:outputText>
                        </div>
                        <div id="table">
                            <h:outputText rendered="#{gameController.gameActive && loginController.loggedIn}">
							
                                <div id="dealercards">
                                    <h2><h:outputText value="#{msg.play_dealer_cards}"/></h2>
                                    <span id="dealercard1">
                                        <h:graphicImage value="#{gameController.dealerCard1Src}" alt="#{msg.play_dealer_card} #{gameController.dealerCard1Str}"/>
                                    </span>
                                    <span id="dealercard2">
                                        <h:graphicImage value="#{gameController.dealerCard2Src}" alt="#{msg.play_dealer_card} #{gameController.dealerCard2Str}"/>
                                    </span>
                                </div>

                                <div id="communitycards">
                                    <h2><h:outputText value="#{msg.play_community_cards}"/></h2>
                                    <span id="flop">
                                        <span id="flop1"><h:graphicImage value="#{gameController.flopCards1Src}" alt="#{msg.play_flop_card} #{gameController.flopCards1Str}"/></span>
                                        <span id="flop2"><h:graphicImage value="#{gameController.flopCards2Src}" alt="#{msg.play_flop_card} #{gameController.flopCards2Str}"/></span>
                                        <span id="flop3"><h:graphicImage value="#{gameController.flopCards3Src}" alt="#{msg.play_flop_card} #{gameController.flopCards3Str}"/></span>
                                    </span>
                                    <span id="turn">
                                        <h:graphicImage value="#{gameController.turnCardSrc}" alt="#{msg.play_turn_card} #{gameController.turnCardStr}"/>
                                    </span>
                                    <span id="river">
                                        <h:graphicImage value="#{gameController.riverCardSrc}" alt="#{msg.play_river_card} #{gameController.riverCardStr}"/>
                                    </span>
                                </div>
                                <h:outputText rendered="#{!gameController.gameOver}">
                                    <div id="betboxes">
                                        <h2><h:outputText value="#{msg.play_actions}"/></h2>
                                        <p>
                                            <h:form id="playForm">
                                                <h:commandButton rendered="#{gameController.foldPossible}" action="#{gameController.fold}" value="#{msg.play_fold}" accesskey="f" />
                                                <h:commandButton rendered="#{gameController.checkPossible}" action="#{gameController.check}" value="#{msg.play_check}" accesskey="c" />
                                                <h:commandButton rendered="#{gameController.betPossible}" action="#{gameController.bet}" value="#{msg.play_bet}" accesskey="b" />
                                            </h:form>
                                        </p>
                                    </div>
                                </h:outputText>
                                <h:outputText rendered="#{gameController.gameOver}">
                                    <div id="result">
                                        <p><h:outputText escape="false" value="#{gameController.resultSummary}"/></p>
                                    </div>
                                </h:outputText>
                                <h:outputText rendered="#{gameController.gameActive}">
                                    <div id="playercards">
                                        <h2><h:outputText value="#{msg.play_player_cards}"/></h2>
                                        <span id="playercard1">
                                            <h:graphicImage value="#{gameController.playersCards1Src}" alt="#{msg.play_player_cards} #{gameController.playersCards1Str}"/>
                                        </span>
                                        <span id="playercard2">
                                            <h:graphicImage value="#{gameController.playersCards2Src}" alt="#{msg.play_player_cards} #{gameController.playersCards2Str}"/>
                                        </span>
                                    </div>
                                </h:outputText>
                                <div id="news">
                                    <ul>
                                        <li>+++ Neues Turnier am 23. Juni 1983 +++</li>
                                    </ul>
                                </div>
                            </h:outputText>
                            <h:outputText rendered="#{!loginController.loggedIn}">
                                <p><h:outputText value="#{msg.not_logged_in}" /></p>
                            </h:outputText>

                            <h:outputText rendered="#{!gameController.gameActive && loginController.loggedIn}">
                                <p><h:outputText value="#{msg.play_no_game}" escape="false" /></p>
                            </h:outputText>
                        </div>
					</div>
				</div>
				<%@ include file="inc/footer.jsp"%>
			</div>
	  </body>
	</html>
</f:view>