<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="at.ac.tuwien.big.easyholdem.game.Action"%>
<%@page import="at.ac.tuwien.big.easyholdem.poker.Card"%>
<%@page import="at.ac.tuwien.big.easyholdem.poker.Cards"%>
<%@page import="at.ac.tuwien.big.easyholdem.game.State"%>
<%@page import="ewa.poker.helper.CardHelper"%>
<jsp:useBean id="gameBean" class="at.ac.tuwien.big.easyholdem.game.Game" scope="session" />

<div id="table">
	<div id="dealercards">
		<h2>Karten der Bank</h2>
		<span id="dealercard1" xml:lang="en">
			<img src="img/deck/bg.png" alt="croupier's cards: unknown" title="croupier's cards: unknown"/>
		</span>
		<span id="dealercard2" xml:lang="en">
			<img src="img/deck/bg.png" alt="croupier's cards: unknown" title="croupier's cards: unknown" />
		</span>
	</div>
	<div id="communitycards">
		<h2>Gemeinschaftskarten</h2>
		<span id="flop" xml:lang="en">
			<% for(int i = 0; i < 3; i++) { 
				Card flopCard = null;
				if (gameBean.getState().ordinal() > State.PRE_FLOP.ordinal())
			   	 flopCard = gameBean.getFlopCards().get(i); %>
				<span id="flop<%= i+1 %>">
					<img src="<%= CardHelper.getImageFromCard(flopCard) %>"
					     alt="Flop: <%= CardHelper.getTextFromCard(flopCard) %>"
					     title="Flop: <%= CardHelper.getTextFromCard(flopCard) %>" />
				</span>
			<% } %>
		</span>
		<span id="turn" xml:lang="en">
			<img src="<%= CardHelper.getImageFromCard(gameBean.getTurnCard()) %>"
			     alt="Turn: <%= CardHelper.getTextFromCard(gameBean.getTurnCard()) %>"
			     title="Turn: <%= CardHelper.getTextFromCard(gameBean.getTurnCard()) %>" />
		</span>
		<span id="river" xml:lang="en">
			<img src="<%= CardHelper.getImageFromCard(gameBean.getRiverCard()) %>"
			     alt="River: <%= CardHelper.getTextFromCard(gameBean.getRiverCard()) %>"
			     title="River: <%= CardHelper.getTextFromCard(gameBean.getRiverCard()) %>" />
		</span>
	</div>
	<div id="betboxes">
		<form action="Poker" method="post" id="moeglicheAktionen">
		<h2>Aktionen</h2>
		<p xml:lang="en">
			<input type="submit" value="Fold" name="Fold" accesskey="f" tabindex="1"
				<%= gameBean.getPossibleActions().contains(Action.FOLD) ? "" : "disabled=\"disabled\"" %> /> 
			<input type="submit" value="Check" name="Check" accesskey="c" tabindex="2"
				<%= gameBean.getPossibleActions().contains(Action.CHECK) ? "" : "disabled=\"disabled\"" %> /> 
			<input type="submit" value="Bet" name="Bet" accesskey="b" tabindex="3"
				<%= gameBean.getPossibleActions().contains(Action.BET) ? "" : "disabled=\"disabled\""  %> />
		</p>
		</form>
	</div>
	<div id="playercards">
		<h2>Ihre Karten</h2>
		<% for (int i = 0; i < 2; i++) { 
			Card playerCard = gameBean.getPlayersCards().get(i); %>
			<span id="playercard<%= i+1 %>" xml:lang="en">
				<img src="<%= CardHelper.getImageFromCard(playerCard) %>"
			     alt="Your card: <%= CardHelper.getTextFromCard(playerCard) %>"
			     title="Your card: <%= CardHelper.getTextFromCard(playerCard) %>" />
			</span>
		<% } %>
	</div>
	<div id="news">
		<ul>
			<li>+++ Neues Turnier am 23. Juni 1983 +++</li>
		</ul>
	</div>
</div>