package at.ac.tuwien.big.ewa.ue3;

import at.ac.tuwien.big.easyholdem.game.Action;
import at.ac.tuwien.big.easyholdem.game.Game;
import at.ac.tuwien.big.easyholdem.player.Player;
import at.ac.tuwien.big.easyholdem.poker.Card;
import at.ac.tuwien.big.easyholdem.poker.HandRank;
import java.util.Collection;

/**
 * 
 * @author wimsi@BIG
 */
public class GameBean {

	private static final String DEFAULT_USER_NAME = "Gastspieler";
	private static final int DEFAULT_STACK_SIZE = 10000;
	private static final int DEFAULT_BET_SIZE = 10;

	Game g = null;

	public GameBean() {
		Player p = new Player();
		p = new Player();
		p.setUserName(DEFAULT_USER_NAME);
		p.setStack(DEFAULT_STACK_SIZE);
		g = new Game(p, DEFAULT_BET_SIZE);
		g.act(Action.ANTE);
	}

	public Game getGame() {
		return g;
	}

	public String getPotSize() {
		return g.getPotSize() + "";
	}

	public String getFixedBetSize() {
		return g.getFixedBetSize() + "";
	}

	public String getStack() {
		return g.getPlayer().getStack() + "";
	}

	public Collection<Action> getPossibleActions() {
		return g.getPossibleActions();
	}

	public String getPlayerCardOne() {
		return getTextFromCard(g.getPlayersCards().get(0));
	}

	public String getPlayerCardOnePic() {
		return getImgPathFromCard(g.getPlayersCards().get(0));
	}

	public String getPlayerCardTwo() {
		return getTextFromCard(g.getPlayersCards().get(1));
	}

	public String getPlayerCardTwoPic() {
		return getImgPathFromCard(g.getPlayersCards().get(1));
	}

	public String getDealerCardOne() {
		if (g.getShowdownResult() != null) {
			return getTextFromCard(g.getShowdownResult().getDealersCards().get(0));
		} else {
			return getTextFromCard(null);
		}
	}

	public String getDealerCardOnePic() {
		if (g.getShowdownResult() != null) {
			return getImgPathFromCard(g.getShowdownResult().getDealersCards().get(0));
		} else {
			return getImgPathFromCard(null);
		}
	}

	public String getDealerCardTwo() {
		if (g.getShowdownResult() != null) {
			return getTextFromCard(g.getShowdownResult().getDealersCards().get(1));
		} else {
			return getTextFromCard(null);
		}
	}

	public String getDealerCardTwoPic() {
		if (g.getShowdownResult() != null) {
			return getImgPathFromCard(g.getShowdownResult().getDealersCards().get(1));
		} else {
			return getImgPathFromCard(null);
		}
	}

	public String getCommunityCardOne() {
		if (g.getFlopCards() != null & g.getFlopCards().size() == 3) {
			return getTextFromCard(g.getFlopCards().get(0));
		}
		return getTextFromCard(null);
	}

	public String getCommunityCardOnePic() {
		if (g.getFlopCards() != null & g.getFlopCards().size() == 3) {
			return getImgPathFromCard(g.getFlopCards().get(0));
		}
		return getImgPathFromCard(null);
	}

	public String getCommunityCardTwo() {
		if (g.getFlopCards() != null & g.getFlopCards().size() == 3) {
			return getTextFromCard(g.getFlopCards().get(1));
		}
		return getTextFromCard(null);
	}

	public String getCommunityCardTwoPic() {
		if (g.getFlopCards() != null & g.getFlopCards().size() == 3) {
			return getImgPathFromCard(g.getFlopCards().get(1));
		}
		return getImgPathFromCard(null);
	}

	public String getCommunityCardThree() {
		if (g.getFlopCards() != null & g.getFlopCards().size() == 3) {
			return getTextFromCard(g.getFlopCards().get(2));
		}
		return getTextFromCard(null);
	}

	public String getCommunityCardThreePic() {
		if (g.getFlopCards() != null & g.getFlopCards().size() == 3) {
			return getImgPathFromCard(g.getFlopCards().get(2));
		}
		return getImgPathFromCard(null);
	}

	public String getTurnCard() {
		if (g.getTurnCard() != null) {
			return getTextFromCard(g.getTurnCard());
		}
		return getTextFromCard(null);
	}

	public String getTurnCardPic() {
		if (g.getTurnCard() != null) {
			return getImgPathFromCard(g.getTurnCard());
		}
		return getImgPathFromCard(null);
	}

	public String getRiverCard() {
		if (g.getTurnCard() != null) {
			return getTextFromCard(g.getRiverCard());
		}
		return getTextFromCard(null);
	}

	public String getRiverCardPic() {
		if (g.getTurnCard() != null) {
			return getImgPathFromCard(g.getRiverCard());
		}
		return getImgPathFromCard(null);
	}

	public String getPlayersHandRank() {
		return getHandRankString(g.getShowdownResult().getPlayersHandRank());
	}

	public String getDealersHandRank() {
		return getHandRankString(g.getShowdownResult().getDealersHandRank());
	}

	/*
	 * Helper Methods
	 */

	private String getHandRankString(HandRank handRank) {
		String s = "";

		if (handRank == null) {
			s = "unvollst&auml;ndiger Hand";
		} else {
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
		}
		return s;
	}

	private String getImgPathFromCard(Card card) {
		if (card == null) {
			return "img/deck/bg.png";
		} else {
			String pre = "img/deck/";
			String post = ".png";

			String suit = getSuitString(card);

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

	private String getTextFromCard(Card card) {
		if (card == null) {
			return "unknown";
		} else {
			return getRankString(card) + " of " + getSuitString(card);
		}
	}
}
