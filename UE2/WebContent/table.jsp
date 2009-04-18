<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="at.ac.tuwien.big.easyholdem.game.Action"%>
<%@page import="at.ac.tuwien.big.easyholdem.poker.Card"%>


<%@page import="at.ac.tuwien.big.easyholdem.game.State"%><jsp:useBean id="gameBean" class="at.ac.tuwien.big.easyholdem.game.Game" scope="session" />

<div id="table">
	<div id="dealercards">
		<h2>Karten der Bank</h2>
		<span id="dealercard1" xml:lang="en">
			<img src="img/deck/bg.png" alt="croupier's cards: unknown" title="croupier's cards: unknown"/>
		</span>
		<span id="dealercard2" xml:lang="en">
			<img src="img/deck/bg.png" alt="croupier's cards: unknown" title="croupier's cards: unknown" />														 </span>
	</div>
	<div id="communitycards">
		<h2>Gemeinschaftskarten</h2>
		<span id="flop" xml:lang="en">
			<% if (gameBean.getState().ordinal() > State.PRE_FLOP.ordinal()) {
					for(int i = 0; i < gameBean.getFlopCards().size(); i++) { 
			   Card card = gameBean.getFlopCards().get(i); 
			   String cardName = String.format("%s of %s", card.getRank().name(), card.getSuit().name()); %>
				<span id="flop<%= i+1 %>">
					<img src="img/deck/<%= card.toString() %>.png" alt="Flop: <%= cardName %>" title="Flop: <%= cardName %>" />
				</span>
			<% } 
			} else { %>
				<span id="flop1"><img src="img/deck/bg.png" alt="Flop: unknown" title="Flop: unknown" /></span>
				<span id="flop2"><img src="img/deck/bg.png" alt="Flop: unknown" title="Flop: unknown" /></span>
				<span id="flop3"><img src="img/deck/bg.png" alt="Flop: unknown" title="Flop: unknown"/></span>
			<% } %>
		</span>
		<span id="turn" xml:lang="en">
			<img src="img/deck/bg.png" alt="Turn: unkown" title="Turn: unknown" />
		</span>
		<span id="river" xml:lang="en">
			<img src="img/deck/bg.png" alt="River: unknown" title="River: unknown" />
		</span>
	</div>
	<div id="betboxes">
		<form action="#" method="post" id="moeglicheAktionen">
		<h2>Aktionen</h2>
		<p xml:lang="en">
			<input type="submit" value="Fold" accesskey="f" tabindex="1" <%= gameBean.getPossibleActions().contains(Action.FOLD) ? "" : "disabled=\"disabled\"" %> /> 
			<input type="submit" value="Check" accesskey="c" tabindex="2" <%= gameBean.getPossibleActions().contains(Action.CHECK) ? "" : "disabled=\"disabled\"" %> /> 
			<input type="submit" value="Bet" accesskey="b" tabindex="3" <%= gameBean.getPossibleActions().contains(Action.BET) ? "" : "disabled=\"disabled\""  %> />
		</p>
		</form>
	</div>
	<div id="playercards">
		<h2>Ihre Karten</h2>
		<span id="playercard1" xml:lang="en">
			<img src="img/deck/clubs-k.png" alt="Your card: King of clubs" title="Your card: King of clubs" />
		</span>
		<span id="playercard2" xml:lang="en">
			<img src="img/deck/clubs-a.png" alt="Your card: Ace of clubs" title="Your card: Ace of clubs" />
		</span>
	</div>
	<div id="news">
		<ul>
			<li>+++ Neues Turnier am 23. Juni 1983 +++</li>
		</ul>
	</div>
</div>