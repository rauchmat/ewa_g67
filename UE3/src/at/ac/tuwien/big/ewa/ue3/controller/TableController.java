package at.ac.tuwien.big.ewa.ue3.controller;

import at.ac.tuwien.big.easyholdem.game.Action;
import at.ac.tuwien.big.ewa.ue3.GameBean;

public class TableController extends ForwardToIndexControllerBase {

	/*
	 * <% if (gameBean.getGame().getShowdownResult() != null) { %> <% if
	 * (gameBean.getGame().getShowdownResult().hasPlayerWon()) { %> Sie haben mit <%=gameBean.getPlayersHandRank()%>
	 * gegen <%=gameBean.getDealersHandRank()%> <em>gewonnen</em>. <% } else if
	 * (gameBean.getGame().getShowdownResult().isSplitPot()) { %> Der Pot wird geteilt
	 * <%=gameBean.getPlayersHandRank()%>. <% } else if (gameBean.getGame().getShowdownResult().getPlayersHandRank() ==
	 * null) { %> Sie haben aufgegeben und ihren Einsatz verloren. <% } else { %> Sie haben mit
	 * <%=gameBean.getPlayersHandRank()%> gegen <%=gameBean.getDealersHandRank()%> <em>verloren</em>. <% } %> <% } %>
	 */

	private GameBean game;

	public String ante() {
		if (game.getGame().isOver()) game.getGame().restart();

		game.getGame().act(Action.ANTE);

		return "";
	}

	public String bet() {
		game.getGame().act(Action.BET);

		return "";
	}

	public String check() {
		game.getGame().act(Action.CHECK);

		return "";
	}

	public String fold() {
		game.getGame().act(Action.FOLD);

		return "";
	}

	public GameBean getGame() {
		return game;
	}

	public String leave() {
		return "leave";
	}

	public void setGame(GameBean game) {
		this.game = game;
	}

}
