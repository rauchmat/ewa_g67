<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@ taglib uri="http://www.icesoft.com/icefaces/component" prefix="i" %>

<f:view>
	<f:loadBundle basename="messages" var="msg" />
	<%@ include file="inc/doctype.jsp"%>
	<html>
	  <head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="description" content="Pokertisch des EWA Poker Portals."/>
		<meta name="keywords" content="tisch EWA poker"/>
		<meta name="language" content="de-AT"/>
	    <title><i:outputText value="#{msg.app_title}"/></title>
	    <link rel="stylesheet" type="text/css" href="./style/screen.css" />
	  </head>
	  <body>
	       <div id="wrapper">
				<div id="header">
					<div id="teaser"></div>
					<h1><i:outputText value="#{msg.register_title}"/></h1>
				</div>
				<div id="body">
					<%@ include file="inc/infoborder.jsp"%>
					<div id="sidebar">
						<i:outputText rendered="#{playController.gameStartedAndLoggedIn}">
							<table id="chips">
								<tbody>
									<tr>
										<th colspan="2"><i:outputText value="#{msg.play_chips}"/></th>
									</tr>
									<tr>
										<td><i:outputText value="#{msg.play_in_pot}"/></td>
										<td><i:outputText value="#{gameController.game.potSize}"/> €</td>
									</tr>
									<tr>
										<td><i:outputText value="#{msg.play_ante}"/></td>
										<td><i:outputText value="#{gameController.game.fixedBetSize}"/> €</td>
									</tr>
									<tr>
										<td><i:outputText value="#{msg.play_your_stack}"/></td>
										<td><i:outputText value="#{gameController.game.player.stack}"/> €</td>
									</tr>
								</tbody>
							</table>
                        </i:outputText>
					</div>
					<div id="main">
                        <div id="navigation">
                            <i:outputText rendered="#{loginController.loggedIn}">
                                <i:form id="tableForm">
                                    <ul>
                                        <li>
                                            <i:commandButton action="#{gameController.newGame}" value="#{msg.menu_new_game}" accesskey="n" />
                                        </li>
                                        <li>
                                            <i:commandButton action="#{gameController.quitGame}" value="#{msg.menu_leave_table}" accesskey="l" />
                                        </li>
                                    </ul>
                                </i:form>
                            </i:outputText>
                        </div>
                        <div id="table">
                            <i:outputText rendered="#{playController.gameStartedAndLoggedIn}">
							
                                <div id="dealercards">
                                    <h2><i:outputText value="#{msg.play_dealer_cards}"/></h2>
                                    <span id="dealercard1">
                                        <i:graphicImage value="#{gameController.dealerCard1Src}" alt="#{msg.play_dealer_card} #{gameController.dealerCard1Str}"/>
                                    </span>
                                    <span id="dealercard2">
                                        <i:graphicImage value="#{gameController.dealerCard2Src}" alt="#{msg.play_dealer_card} #{gameController.dealerCard2Str}"/>
                                    </span>
                                </div>

                                <div id="communitycards">
                                    <h2><i:outputText value="#{msg.play_community_cards}"/></h2>
                                    <span id="flop">
                                        <span id="flop1"><i:graphicImage value="#{gameController.flopCards1Src}" alt="#{msg.play_flop_card} #{gameController.flopCards1Str}"/></span>
                                        <span id="flop2"><i:graphicImage value="#{gameController.flopCards2Src}" alt="#{msg.play_flop_card} #{gameController.flopCards2Str}"/></span>
                                        <span id="flop3"><i:graphicImage value="#{gameController.flopCards3Src}" alt="#{msg.play_flop_card} #{gameController.flopCards3Str}"/></span>
                                    </span>
                                    <span id="turn">
                                        <i:graphicImage value="#{gameController.turnCardSrc}" alt="#{msg.play_turn_card} #{gameController.turnCardStr}"/>
                                    </span>
                                    <span id="river">
                                        <i:graphicImage value="#{gameController.riverCardSrc}" alt="#{msg.play_river_card} #{gameController.riverCardStr}"/>
                                    </span>
                                </div>
                                <i:outputText rendered="#{!gameController.gameOver}">
                                    <div id="betboxes">
                                        <h2><i:outputText value="#{msg.play_actions}"/></h2>
                                        <p>
                                            <i:form id="playForm">
                                                <i:commandButton rendered="#{gameController.foldPossible}" action="#{gameController.fold}" value="#{msg.play_fold}" accesskey="f" />
                                                <i:commandButton rendered="#{gameController.checkPossible}" action="#{gameController.check}" value="#{msg.play_check}" accesskey="c" />
                                                <i:commandButton rendered="#{gameController.betPossible}" action="#{gameController.bet}" value="#{msg.play_bet}" accesskey="b" />
                                            </i:form>
                                        </p>
                                    </div>
                                </i:outputText>
                                <i:outputText rendered="#{gameController.gameOver}">
                                    <div id="result">
                                        <p><i:outputText escape="false" value="#{gameController.resultSummary}"/></p>
                                    </div>
                                </i:outputText>
                                <i:outputText rendered="#{gameController.gameActive}">
                                    <div id="playercards">
                                        <h2><i:outputText value="#{msg.play_player_cards}"/></h2>
                                        <span id="playercard1">
                                            <i:graphicImage value="#{gameController.playersCards1Src}" alt="#{msg.play_player_cards} #{gameController.playersCards1Str}"/>
                                        </span>
                                        <span id="playercard2">
                                            <i:graphicImage value="#{gameController.playersCards2Src}" alt="#{msg.play_player_cards} #{gameController.playersCards2Str}"/>
                                        </span>
                                    </div>
                                </i:outputText>
                                <div id="news">
                                    <ul>
                                        <li>
                                        	<i:outputText rendered="#{newsController.newsAvailable}">
	                                        	<i:outputText value="#{newsController.dateString}"/>:
	                                        	<i:outputText value="#{newsController.description}" escape="false" />
	                                        	[<i:outputLink value="#{newsController.link}">mehr</i:outputLink>]
                                        	</i:outputText>
                                        </li>
                                    </ul>
                                </div>
                            </i:outputText>
                            
                            <i:outputText rendered="#{!loginController.loggedIn}">
                                <p><i:outputText value="#{msg.not_logged_in}" /></p>
                            </i:outputText>

                            <i:outputText rendered="#{playController.gameStoppedAndLoggedIn}">
                                <p><i:outputText value="#{msg.play_no_game}" escape="false" /></p>
                            </i:outputText>
                        </div>
					</div>
				</div>
				<%@ include file="inc/footer.jsp"%>
			</div>
	  </body>
	</html>
</f:view>