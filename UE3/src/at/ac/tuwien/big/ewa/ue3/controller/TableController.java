package at.ac.tuwien.big.ewa.ue3.controller;

import javax.faces.context.FacesContext;

import at.ac.tuwien.big.easyholdem.game.Action;
import at.ac.tuwien.big.easyholdem.game.Game;
import at.ac.tuwien.big.easyholdem.game.ShowdownResult;
import at.ac.tuwien.big.easyholdem.player.Player;
import at.ac.tuwien.big.ewa.ue3.Constants;
import at.ac.tuwien.big.ewa.ue3.GameBean;

public class TableController extends ForwardToIndexControllerBase {

	private GameBean game;

	private String gameResult;

	public String ante() {
		return act(Action.ANTE, true);
	}

	public String bet() {
		return act(Action.BET);
	}

	public String check() {
		return act(Action.CHECK);
	}

	public String fold() {
		return act(Action.FOLD);
	}

	public GameBean getGame() {
		return game;
	}

	public String getGameResult() {
		return gameResult;
	}

	public String leave() {
		return "leave";
	}

	public void setGame(GameBean game) {
		this.game = game;
	}

	public void setGameResult(String gameResult) {
		this.gameResult = gameResult;
	}

	private String act(Action action) {
		return act(action, false);
	}

	private String act(Action action, boolean restartIfOver) {
		try {
			ensureGame();

			if (restartIfOver && game.getGame().isOver()) game.getGame().restart();

			game.getGame().act(action);

			checkGameResult();
			persistStackState();

			return action.toString();
		} catch (final IllegalArgumentException iex) {
			gameResult = "Sie haben vermutlich zu wenige Punkte um zu setzen, ändern Sie den Stack in ihren Benutzerdaten.";
			return "stack";
		} catch (final Exception ex) {
			gameResult = ex.getMessage();
			return "fail";
		}
	}

	private void checkGameResult() {
		final Game g = game.getGame();
		if (g.getShowdownResult() != null) {
			final ShowdownResult showdownResult = g.getShowdownResult();

			if (showdownResult.hasPlayerWon())
				gameResult = String.format("Sie haben mit %s gegen %s <em>gewonnen</em>.", game.getPlayersHandRank(),
				        game.getDealersHandRank());
			else if (showdownResult.isSplitPot())
				gameResult = "Der Pot wird geteilt.";
			else if (showdownResult.getPlayersHandRank() == null)
				gameResult = "Sie haben aufgegeben und ihren Einsatz verloren.";
			else
				gameResult = String.format("Sie haben mit %s gegen %s <em>verloren</em>.", game.getPlayersHandRank(),
				        game.getDealersHandRank());
		} else
			gameResult = "";
	}

	private void ensureGame() {
		if (game.getGame() == null || game.getGame().getPlayer() == null)
		    game.setGame(new Game((Player) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get(
		            "playerBean"), GameBean.DEFAULT_BET_SIZE));
	}

	private void persistStackState() {
		Constants.playerDao.update((Player) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get(
		        "playerBean"));
	}

}
