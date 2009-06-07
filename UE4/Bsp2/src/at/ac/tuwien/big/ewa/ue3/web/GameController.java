package at.ac.tuwien.big.ewa.ue3.web;

import javax.faces.context.FacesContext;

import at.ac.tuwien.big.easyholdem.game.Action;
import at.ac.tuwien.big.easyholdem.game.Game;
import at.ac.tuwien.big.easyholdem.player.Player;
import at.ac.tuwien.big.easyholdem.player.PlayerDAO;
import at.ac.tuwien.big.easyholdem.poker.Card;
import at.ac.tuwien.big.easyholdem.poker.HandRank;

/**
 * Controller class handling all {@link Game} relevant requests and actions.
 * 
 * @author Philip Langer <langer[at]big[dot]tuwien[dot]ac[.]at>
 */
public class GameController {

	/**
	 * Expression language expression representing the <code>game</code> bean.
	 */
	private static final String EL_GAME = "#{game}";

	/**
	 * Return value indicating a successful completion of an action.
	 */
	private static final String SUCCESS = "success";

	/**
	 * The game currently active.
	 */
	private Game game;

	/**
	 * The injected {@link Player} currently logged in.
	 */
	private Player loggedInPlayer;

	/**
	 * The injected {@link PlayerDAO} to use for persisting {@link Player}s.
	 */
	private PlayerDAO playerDAO;

	/**
	 * Acts the {@link Action} BET on the currently active {@link Game}.
	 */
	public String bet() {
		getGame().act(Action.BET);
		updateLoggedInPlayer();
		return "bet";
	}

	/**
	 * Acts the {@link Action} CHECK on the currently active {@link Game}.
	 */
	public String check() {
		getGame().act(Action.CHECK);
		updateLoggedInPlayer();
		return "check";
	}

	/**
	 * Acts the {@link Action} FOLD on the currently active {@link Game}.
	 */
	public String fold() {
		getGame().act(Action.FOLD);
		updateLoggedInPlayer();
		return "fold";
	}

	/**
	 * Returns the path to an image showing the first dealer card.
	 * 
	 * @return the path to an image showing the first dealer card.
	 */
	public String getDealerCard1Src() {
		return getImgPathFromCard(getDealersCard(0));
	}

	/**
	 * Returns the textual representation of the first dealer card.
	 * 
	 * @return the textual representation of the first dealer card.
	 */
	public String getDealerCard1Str() {
		return getTextFromCard(getDealersCard(0));
	}

	/**
	 * Returns the path to an image showing the second dealer card.
	 * 
	 * @return the path to an image showing the second dealer card.
	 */
	public String getDealerCard2Src() {
		return getImgPathFromCard(getDealersCard(1));
	}

	/***************************************************************************
	 * Internal methods
	 **************************************************************************/

	/**
	 * Returns the textual representation of the second dealer card.
	 * 
	 * @return the textual representation of the second dealer card.
	 */
	public String getDealerCard2Str() {
		return getTextFromCard(getDealersCard(1));
	}

	/**
	 * Returns the path to an image showing the first flop card.
	 * 
	 * @return the path to an image showing the first flop card.
	 */
	public String getFlopCards1Src() {
		return getImgPathFromCard(getFlopCard(0));
	}

	/**
	 * Returns the textual representation of the first flop card.
	 * 
	 * @return the textual representation of the first flop card.
	 */
	public String getFlopCards1Str() {
		return getTextFromCard(getFlopCard(0));
	}

	/**
	 * Returns the path to an image showing the second flop card.
	 * 
	 * @return the path to an image showing the second flop card.
	 */
	public String getFlopCards2Src() {
		return getImgPathFromCard(getFlopCard(1));
	}

	/**
	 * Returns the textual representation of the second flop card.
	 * 
	 * @return the textual representation of the second flop card.
	 */
	public String getFlopCards2Str() {
		return getTextFromCard(getFlopCard(1));
	}

	/**
	 * Returns the path to an image showing the third flop card.
	 * 
	 * @return the path to an image showing the third flop card.
	 */
	public String getFlopCards3Src() {
		return getImgPathFromCard(getFlopCard(2));
	}

	/**
	 * Returns the textual representation of the third flop card.
	 * 
	 * @return the textual representation of the third flop card.
	 */
	public String getFlopCards3Str() {
		return getTextFromCard(getFlopCard(2));
	}

	/**
	 * Returns the currently active {@link Game}.
	 * 
	 * @return the currently active {@link Game}.
	 */
	public Game getGame() {
		return game;
	}

	/**
	 * Returns the {@link Player} that is currently logged in.
	 * 
	 * @return currently logged in {@link Player}.
	 */
	public Player getLoggedInPlayer() {
		return loggedInPlayer;
	}

	/**
	 * Returns the previously injected {@link PlayerDAO} bean.
	 * 
	 * @return current used {@link PlayerDAO} instance.
	 */
	public PlayerDAO getPlayerDAO() {
		return playerDAO;
	}

	/**
	 * Returns the path to an image showing the first player card.
	 * 
	 * @return the path to an image showing the first player card.
	 */
	public String getPlayersCards1Src() {
		return getImgPathFromCard(getPlayersCard(0));
	}

	/**
	 * Returns the textual representation of the first player card.
	 * 
	 * @return the textual representation of the first player card.
	 */
	public String getPlayersCards1Str() {
		return getTextFromCard(getPlayersCard(0));
	}

	/**
	 * Returns the path to an image showing the second player card.
	 * 
	 * @return the path to an image showing the second player card.
	 */
	public String getPlayersCards2Src() {
		return getImgPathFromCard(getPlayersCard(1));
	}

	/***************************************************************************
	 * Methods invoked by pages
	 **************************************************************************/

	/**
	 * Returns the textual representation of the second player card.
	 * 
	 * @return the textual representation of the second player card.
	 */
	public String getPlayersCards2Str() {
		return getTextFromCard(getPlayersCard(1));
	}

	/**
	 * Returns a textual summary of the result of the current {@link Game}.
	 * 
	 * @return a textual summary.
	 */
	public String getResultSummary() {
		final String playersHandRank = getHandRankString(getGame().getShowdownResult().getPlayersHandRank());
		final String dealersHandRank = getHandRankString(getGame().getShowdownResult().getDealersHandRank());

		String s = "";
		if (getGame().getShowdownResult().hasPlayerWon())
			s += "Sie haben mit " + playersHandRank + " gegen " + dealersHandRank + " <em>gewonnen</em>.";
		else if (getGame().getShowdownResult().isSplitPot())
			s += "Der Pot wird geteilt (" + getGame().getShowdownResult().getDealersHandRank() + ").";
		else if (getGame().getShowdownResult().getPlayersHandRank() == null)
			s += "Sie haben aufgegeben und ihren Einsatz verloren.";
		else
			s += "Sie haben mit " + playersHandRank + " gegen " + dealersHandRank + " <em>verloren</em>.";
		return s;
	}

	/**
	 * Returns the path to an image showing the river card.
	 * 
	 * @return the path to an image showing the river card.
	 */
	public String getRiverCardSrc() {
		return getImgPathFromCard(getRiverCard());
	}

	/**
	 * Returns the textual representation of the river card.
	 * 
	 * @return the textual representation of the river card.
	 */
	public String getRiverCardStr() {
		return getTextFromCard(getRiverCard());
	}

	/**
	 * Returns the path to an image showing the turn card.
	 * 
	 * @return the path to an image showing the turn card.
	 */
	public String getTurnCardSrc() {
		return getImgPathFromCard(getTurnCard());
	}

	/**
	 * Returns the textual representation of the turn card.
	 * 
	 * @return the textual representation of the turn card.
	 */
	public String getTurnCardStr() {
		return getTextFromCard(getTurnCard());
	}

	/**
	 * Returns <code>true</code> if the {@link Action} BET is currently possible. <code>false</code> otherwise.
	 * 
	 * @return <code>true</code> if the {@link Action} BET is currently possible. <code>false</code> otherwise.
	 */
	public boolean isBetPossible() {
		return isActionPossible(Action.BET);
	}

	/**
	 * Returns <code>true</code> if the {@link Action} CHECK is currently possible. <code>false</code> otherwise.
	 * 
	 * @return <code>true</code> if the {@link Action} CHECK is currently possible. <code>false</code> otherwise.
	 */
	public boolean isCheckPossible() {
		return isActionPossible(Action.CHECK);
	}

	/**
	 * Returns <code>true</code> if the {@link Action} FOLD is currently possible. <code>false</code> otherwise.
	 * 
	 * @return <code>true</code> if the {@link Action} FOLD is currently possible. <code>false</code> otherwise.
	 */
	public boolean isFoldPossible() {
		return isActionPossible(Action.FOLD);
	}

	/**
	 * Returns <code>true</code> if the current {@link Game} is active. <code>false</code> otherwise.
	 * 
	 * @return <code>true</code> if the current {@link Game} is active. <code>false</code> otherwise.
	 */
	public boolean isGameActive() {
		if (getGame() != null && getGame().getPlayersCards().size() > 0)
			return true;
		else
			return false;
	}

	/**
	 * Returns <code>true</code> if the game is over. <code>false</code> otherwise.
	 * 
	 * @return <code>true</code> if the game is over. <code>false</code> otherwise.
	 */
	public boolean isGameOver() {
		return getGame().isOver();
	}

	/**
	 * Creates a new {@link Game} for the {@link Player} that is currently set and writes the newly created {@link Game}
	 * to the session.
	 * 
	 * @return &quot;success&quot; if the new {@link Game} could be created without errors..
	 */
	public String newGame() {
		// persist player info
		updateLoggedInPlayer();
		// create new game with current player
		setGame(new Game(loggedInPlayer));
		getGame().act(Action.ANTE);
		writeGameToSession();
		return GameController.SUCCESS;
	}

	/**
	 * Quits the current {@link Game}.
	 * 
	 * @return &quot;success&quot; if the new {@link Game} could be quit.
	 */
	public String quitGame() {
		// persist player info
		updateLoggedInPlayer();
		// create new game with current player
		setGame(null);
		writeGameToSession();
		return GameController.SUCCESS;
	}

	/**
	 * Sets the {@link Game} that is currently active. This method is used to inject the session wide {@link Game} bean.
	 * 
	 * @param game
	 *            currently active {@link Game} to set.
	 */
	public void setGame(Game game) {
		this.game = game;
	}

	/**
	 * Sets the currently logged in player. This method is used to inject the currently logged in {@link Player} bean.
	 * 
	 * @param loggedInPlayer
	 *            currently logged in {@link Player}.
	 */
	public void setLoggedInPlayer(Player loggedInPlayer) {
		this.loggedInPlayer = loggedInPlayer;
	}

	/**
	 * Sets the {@link PlayerDAO}. This method is used to inject the {@link PlayerDAO}.
	 * 
	 * @param playerDAO
	 *            to set.
	 */
	public void setPlayerDAO(PlayerDAO playerDAO) {
		this.playerDAO = playerDAO;
	}

	/**
	 * Returns the dealer's card with the index <code>i</code>.
	 * 
	 * @param i
	 *            index of the card.
	 * @return {@link Card} with the specified index <code>i</code>.
	 */
	private Card getDealersCard(int i) {
		Card c = null;
		if (getGame().getShowdownResult() != null) c = getGame().getShowdownResult().getDealersCards().get(i);
		return c;
	}

	/**
	 * Returns the flop's card with the index <code>i</code>.
	 * 
	 * @param i
	 *            index of the card.
	 * @return {@link Card} with the specified index <code>i</code>.
	 */
	private Card getFlopCard(int i) {
		Card c = null;
		if (getGame().getFlopCards().size() > 0) c = getGame().getFlopCards().get(i);
		return c;
	}

	/**
	 * Returns a textual representation of the specified {@link HandRank} <code>handRank</code>.
	 * 
	 * @param handRank
	 *            the {@link HandRank}.
	 * @return the textual representation.
	 */
	private String getHandRankString(HandRank handRank) {
		String s = "";

		if (handRank == null)
			s = "unvollst&auml;ndiger Hand";
		else
			switch (handRank.getRank()) {
			case FLUSH:
				s = "Flush";
				break;
			case FOUROFAKIND:
				s = "Four Of A Kind";
				break;
			case FULLHOUSE:
				s = "Full House";
				break;
			case HIGH:
				s = "High Card";
				break;
			case PAIR:
				s = "Pair";
				break;
			case STRAIGHT:
				s = "Straight";
				break;
			case STRAIGHTFLUSH:
				s = "Straight Flush";
				break;
			case THREEOFAKIND:
				s = "Three Of A Kind";
				break;
			case TWOPAIR:
				s = "Two Pair";
				break;
			}
		return s;
	}

	/**
	 * Returns the path to the image showing the specified {@link Card} <code>card.</code>.
	 * 
	 * @param card
	 *            the {@link Card}.
	 * @return the image path showing the {@link Card}.
	 */
	private String getImgPathFromCard(Card card) {
		if (card == null)
			return "img/deck/bg.png";
		else {
			final String pre = "img/deck/";
			final String post = ".png";

			String suit = "";
			switch (card.getSuit()) {
			case CLUBS:
				suit = "clubs";
				break;
			case DIAMONDS:
				suit = "diamonds";
				break;
			case HEARTS:
				suit = "hearts";
				break;
			case SPADES:
				suit = "spades";
				break;
			}

			String rank = "";
			switch (card.getRank()) {
			case ACE:
				rank = "a";
				break;
			case EIGHT:
				rank = "8";
				break;
			case FIVE:
				rank = "5";
				break;
			case FOUR:
				rank = "4";
				break;
			case JACK:
				rank = "j";
				break;
			case KING:
				rank = "k";
				break;
			case NINE:
				rank = "9";
				break;
			case QUEEN:
				rank = "q";
				break;
			case SEVEN:
				rank = "7";
				break;
			case SIX:
				rank = "6";
				break;
			case TEN:
				rank = "10";
				break;
			case THREE:
				rank = "3";
				break;
			case TWO:
				rank = "2";
				break;
			}
			return pre + suit + "-" + rank + post;
		}
	}

	/**
	 * Returns the player's card with the index <code>i</code>.
	 * 
	 * @param i
	 *            index of the card.
	 * @return {@link Card} with the specified index <code>i</code>.
	 */
	private Card getPlayersCard(int i) {
		Card c = null;
		c = getGame().getPlayersCards().get(i);
		System.out.println("Card: " + c);
		return c;
	}

	/**
	 * Return a textual representaion of the rank of the specified <code>card</code>.
	 * 
	 * @param card
	 *            the {@link Card}
	 * @return the textual representaiton of the rank of the {@link Card}.
	 */
	private String getRankString(Card card) {
		String rank = card.getRank().toString();
		switch (card.getRank()) {
		case ACE:
			rank = "ace";
			break;
		case KING:
			rank = "king";
			break;
		case QUEEN:
			rank = "queen";
			break;
		case JACK:
			rank = "jack";
			break;
		}
		return rank;
	}

	/**
	 * Returns the river card.
	 * 
	 * @return river {@link Card}.
	 */
	private Card getRiverCard() {
		return getGame().getRiverCard();
	}

	/**
	 * Return a textual representaion of the suit of the specified <code>card</code>.
	 * 
	 * @param card
	 *            the {@link Card}
	 * @return the textual representaiton of the suit of the {@link Card}.
	 */
	private String getSuitString(Card card) {
		String suit = "";
		switch (card.getSuit()) {
		case CLUBS:
			suit = "clubs";
			break;
		case DIAMONDS:
			suit = "diamonds";
			break;
		case HEARTS:
			suit = "hearts";
			break;
		case SPADES:
			suit = "spades";
			break;
		}
		return suit;
	}

	/**
	 * Returns a textual representation of the specified <code>card</code>.
	 * 
	 * @param card
	 *            the {@link Card}.
	 * @return the textual representation of the {@link Card}.
	 */
	private String getTextFromCard(Card card) {
		if (card == null)
			return "unknown";
		else
			return getRankString(card) + " of " + getSuitString(card);
	}

	/**
	 * Returns the turn card.
	 * 
	 * @return turn {@link Card}.
	 */
	private Card getTurnCard() {
		return getGame().getTurnCard();
	}

	/**
	 * Returns <code>true</code> if the specified {@link Action} <code>a</code> is possible in the current state of the
	 * {@link Game}.
	 * 
	 * @return <code>true</code> if possible. <code>false</code> otherwise.
	 */
	private boolean isActionPossible(Action a) {
		if (getGame() == null) return false;
		if (getGame().getPossibleActions() == null) return false;
		if (getGame().getPossibleActions().contains(a))
			return true;
		else
			return false;
	}

	/**
	 * Updates the {@link Player} currently logged in using the previously set {@link PlayerDAO}.
	 */
	private void updateLoggedInPlayer() {
		playerDAO.update(loggedInPlayer);
	}

	/**
	 * Writes the game currently active to the session.
	 */
	private void writeGameToSession() {
		final FacesContext context = FacesContext.getCurrentInstance();
		context.getApplication().getExpressionFactory().createValueExpression(context.getELContext(),
		        GameController.EL_GAME, Player.class).setValue(context.getELContext(), getGame());
	}

}
