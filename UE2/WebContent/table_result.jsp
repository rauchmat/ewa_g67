<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="at.ac.tuwien.big.easyholdem.game.Action"%>
<%@page import="at.ac.tuwien.big.easyholdem.poker.Card"%>
<%@page import="at.ac.tuwien.big.easyholdem.poker.Cards"%>
<%@page import="at.ac.tuwien.big.easyholdem.game.State"%>
<%@page import="at.ac.tuwien.big.easyholdem.poker.HandRank.Rank"%>
<%@page import="ewa.poker.helper.CardHelper"%>
<jsp:useBean id="gameBean" class="at.ac.tuwien.big.easyholdem.game.Game" scope="session" />

<div id="table">
	<div id="gameresult">
		<h2>Spiel beendet</h2>
		<p>
		<% if(gameBean.getShowdownResult().isSplitPot()) { %>
			Der Pot wird geteilt (<% CardHelper.getHandRankText(gameBean.getShowdownResult().getDealersHandRank()); %>).
		<% } else if(gameBean.getShowdownResult().getPlayersHandRank() == null) { %>
			Sie haben aufgegeben und Ihren Einsatz verloren.
		<% } else { %>
			Sie haben mit <% CardHelper.getHandRankText(gameBean.getShowdownResult().getPlayersHandRank()); %>
			gegen <% CardHelper.getHandRankText(gameBean.getShowdownResult().getDealersHandRank()); %>
			<% if(gameBean.getShowdownResult().hasPlayerWon()) { %>
			GEWONNEN
			<% } else { %>
			VERLOREN
			<% } %>.
		<% } %>
		</p>
	</div>
	<div id="dealercards">
		<h2>Karten der Bank</h2>
		<% for (int i = 0; i < gameBean.getShowdownResult().getDealersCards().size(); i++) { 
			Card playerCard = gameBean.getShowdownResult().getDealersCards().get(i); %>
			<span id="dealercard<%= i+1 %>" xml:lang="en">
				<img src="<%= CardHelper.getImageFromCard(playerCard) %>" alt="Croupier's card: <%= CardHelper.getTextFromCard(playerCard) %>" title="Croupier's card: <%= CardHelper.getTextFromCard(playerCard) %>" />
			</span>
		<% } %>
	</div>
	<div id="communitycards">
		<h2>Gemeinschaftskarten</h2>
		<span id="flop" xml:lang="en">
			<% for(int i = 0; i < gameBean.getShowdownResult().getFlopCards().size(); i++) { 
				Card flopCard = null;
				if (gameBean.getState().ordinal() > State.PRE_FLOP.ordinal())
			   	 flopCard = gameBean.getShowdownResult().getFlopCards().get(i); %>
				<span id="flop<%= i+1 %>">
					<img src="<%= CardHelper.getImageFromCard(flopCard) %>" alt="Flop: <%= CardHelper.getTextFromCard(flopCard) %>" title="Flop: <%= CardHelper.getTextFromCard(flopCard) %>" />
				</span>
			<% } %>
		</span>
		<span id="turn" xml:lang="en">
			<img src="<%= CardHelper.getImageFromCard(gameBean.getShowdownResult().getTurnCard()) %>" alt="Turn: <%= CardHelper.getTextFromCard(gameBean.getTurnCard()) %>" title="Turn: <%= CardHelper.getTextFromCard(gameBean.getTurnCard()) %>" />
		</span>
		<span id="river" xml:lang="en">
			<img src="<%= CardHelper.getImageFromCard(gameBean.getShowdownResult().getRiverCard()) %>" alt="River: <%= CardHelper.getTextFromCard(gameBean.getRiverCard()) %>" title="River: <%= CardHelper.getTextFromCard(gameBean.getRiverCard()) %>" />
		</span>
	</div>
	<% if(gameBean.getShowdownResult().getPlayersHandRank() != null) { %>
	<div id="playercards">
		<h2>Ihre Karten</h2>
		<% for (int i = 0; i < gameBean.getShowdownResult().getPlayersCards().size(); i++) { 
			Card playerCard = gameBean.getShowdownResult().getPlayersCards().get(i); %>
			<span id="playercard<%= i+1 %>" xml:lang="en">
				<img src="<%= CardHelper.getImageFromCard(playerCard) %>" alt="Your card: <%= CardHelper.getTextFromCard(playerCard) %>" title="Your card: <%= CardHelper.getTextFromCard(playerCard) %>" />
			</span>
		<% } %>
	</div>
	<% } %>
	<div id="news">
		<ul>
			<li>+++ Neues Turnier am 23. Juni 1983 +++</li>
		</ul>
	</div>
</div>