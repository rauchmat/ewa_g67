package at.ac.tuwien.big.ewa.ue3;

import java.util.Collection;

import javax.faces.context.FacesContext;

import at.ac.tuwien.big.easyholdem.game.Action;
import at.ac.tuwien.big.easyholdem.game.Game;
import at.ac.tuwien.big.easyholdem.player.Player;
import at.ac.tuwien.big.easyholdem.poker.Card;
import at.ac.tuwien.big.easyholdem.poker.HandRank;

public class GameBean {

	public static final int DEFAULT_BET_SIZE = 10;

	private Game game = null;

	public GameBean() {
		game = new Game(getPlayer(), GameBean.DEFAULT_BET_SIZE);
	}

	public boolean getCanBet() {
		return getPossibleActions().contains(Action.BET);
	}

	public boolean getCanCheck() {
		return getPossibleActions().contains(Action.CHECK);
	}

	public boolean getCanFold() {
		return getPossibleActions().contains(Action.FOLD);
	}

	public String getCommunityCardOne() {
		if (game.getFlopCards() != null & game.getFlopCards().size() == 3)
		    return getTextFromCard(game.getFlopCards().get(0));
		return getTextFromCard(null);
	}

	public String getCommunityCardOnePicture() {
		if (game.getFlopCards() != null & game.getFlopCards().size() == 3)
		    return getImgPathFromCard(game.getFlopCards().get(0));
		return getImgPathFromCard(null);
	}

	public String getCommunityCardThree() {
		if (game.getFlopCards() != null & game.getFlopCards().size() == 3)
		    return getTextFromCard(game.getFlopCards().get(2));
		return getTextFromCard(null);
	}

	public String getCommunityCardThreePicture() {
		if (game.getFlopCards() != null & game.getFlopCards().size() == 3)
		    return getImgPathFromCard(game.getFlopCards().get(2));
		return getImgPathFromCard(null);
	}

	public String getCommunityCardTwo() {
		if (game.getFlopCards() != null & game.getFlopCards().size() == 3)
		    return getTextFromCard(game.getFlopCards().get(1));
		return getTextFromCard(null);
	}

	public String getCommunityCardTwoPicture() {
		if (game.getFlopCards() != null & game.getFlopCards().size() == 3)
		    return getImgPathFromCard(game.getFlopCards().get(1));
		return getImgPathFromCard(null);
	}

	public String getDealerCardOne() {
		if (game.getShowdownResult() != null)
			return getTextFromCard(game.getShowdownResult().getDealersCards().get(0));
		else
			return getTextFromCard(null);
	}

	public String getDealerCardOnePicture() {
		if (game.getShowdownResult() != null)
			return getImgPathFromCard(game.getShowdownResult().getDealersCards().get(0));
		else
			return getImgPathFromCard(null);
	}

	public String getDealerCardTwo() {
		if (game.getShowdownResult() != null)
			return getTextFromCard(game.getShowdownResult().getDealersCards().get(1));
		else
			return getTextFromCard(null);
	}

	public String getDealerCardTwoPicture() {
		if (game.getShowdownResult() != null)
			return getImgPathFromCard(game.getShowdownResult().getDealersCards().get(1));
		else
			return getImgPathFromCard(null);
	}

	public String getDealersHandRank() {
		return getHandRankString(game.getShowdownResult().getDealersHandRank());
	}

	public String getFixedBetSize() {
		return game.getFixedBetSize() + "";
	}

	public Game getGame() {
		return game;
	}

	public Player getPlayer() {
		return (Player) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("playerBean");
	}

	public String getPlayerCardOne() {
		if (game.getPlayersCards().size() < 1) return "unknown";

		return getTextFromCard(game.getPlayersCards().get(0));
	}

	public String getPlayerCardOnePicture() {
		if (game.getPlayersCards().size() < 1) return "img/deck/bg.png";

		return getImgPathFromCard(game.getPlayersCards().get(0));
	}

	public String getPlayerCardTwo() {
		if (game.getPlayersCards().size() < 2) return "unknown";

		return getTextFromCard(game.getPlayersCards().get(1));
	}

	public String getPlayerCardTwoPicture() {
		if (game.getPlayersCards().size() < 2) return "img/deck/bg.png";

		return getImgPathFromCard(game.getPlayersCards().get(1));
	}

	public String getPlayersHandRank() {
		return getHandRankString(game.getShowdownResult().getPlayersHandRank());
	}

	public Collection<Action> getPossibleActions() {
		return game.getPossibleActions();
	}

	public String getPotSize() {
		return game.getPotSize() + "";
	}

	public String getRiverCard() {
		if (game.getTurnCard() != null) return getTextFromCard(game.getRiverCard());
		return getTextFromCard(null);
	}

	public String getRiverCardPicture() {
		if (game.getTurnCard() != null) return getImgPathFromCard(game.getRiverCard());
		return getImgPathFromCard(null);
	}

	public String getStack() {
		return game.getPlayer().getStack() + "";
	}

	public String getTurnCard() {
		if (game.getTurnCard() != null) return getTextFromCard(game.getTurnCard());
		return getTextFromCard(null);
	}

	public String getTurnCardPicture() {
		if (game.getTurnCard() != null) return getImgPathFromCard(game.getTurnCard());
		return getImgPathFromCard(null);
	}

	public void setGame(Game game) {
		this.game = game;
	}

	public void setPlayer(Player player) {
		// this.player = player;
		//
		// game = new Game(player, GameBean.DEFAULT_BET_SIZE);
	}

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

	private String getImgPathFromCard(Card card) {
		if (card == null)
			return "img/deck/bg.png";
		else {
			final String pre = "img/deck/";
			final String post = ".png";

			final String suit = getSuitString(card);

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

	private String getTextFromCard(Card card) {
		if (card == null)
			return "unknown";
		else
			return getRankString(card) + " of " + getSuitString(card);
	}
}
