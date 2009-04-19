package ewa.poker.helper;

import at.ac.tuwien.big.easyholdem.game.Game;
import at.ac.tuwien.big.easyholdem.game.State;
import at.ac.tuwien.big.easyholdem.poker.Card;
import at.ac.tuwien.big.easyholdem.poker.Cards;

public class CardHelper {
	
	private static String getSuitText(Card card) {
		String suit = "";
		switch (card.getSuit()) {
		case CLUBS:
			suit = "Clubs";
			break;
		case DIAMONDS:
			suit = "Diamonds";
			break;
		case HEARTS:
			suit = "Hearts";
			break;
		case SPADES:
			suit = "Spades";
			break;
		}
		return suit;
	}
	
	private static String getSuitImageIdentifier(Card card) {
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
	
	private static String getRankImageIdentifier(Card card) {
		String rank = card.getRank().toString();
		switch(card.getRank()) {
		case ACE: rank="a"; break;
		case KING: rank="k"; break;
		case QUEEN: rank="q"; break;
		case JACK: rank="j"; break;
		case TEN: rank="10"; break;
		case NINE: rank="9"; break;
		case EIGHT: rank="8"; break;
		case SEVEN: rank="7"; break;
		case SIX: rank="6"; break;
		case FIVE: rank="5"; break;
		case FOUR: rank="4"; break;
		case THREE: rank="3"; break;
		case TWO: rank="2"; break;
		}
		return rank;
	}

	private static String getRankText(Card card) {
		String rank = card.getRank().toString();
		switch(card.getRank()) {
		case ACE: rank="Ace"; break;
		case KING: rank="King"; break;
		case QUEEN: rank="Queen"; break;
		case JACK: rank="Jack"; break;
		case TEN: rank="10"; break;
		case NINE: rank="9"; break;
		case EIGHT: rank="8"; break;
		case SEVEN: rank="7"; break;
		case SIX: rank="6"; break;
		case FIVE: rank="5"; break;
		case FOUR: rank="4"; break;
		case THREE: rank="3"; break;
		case TWO: rank="2"; break;
		}
		return rank;
	}

	public static String getTextFromCard(final Card card) {
		if (card == null) {
			return "unknown";
		} else {
			return String.format("%s of %s", getRankText(card), getSuitText(card));
		}
	}
	
	public static String getImageFromCard(final Card card) {
		if (card == null) {
			return "img/deck/bg.png";
		} else {
			return String.format("img/deck/%s-%s.png", getSuitImageIdentifier(card), getRankImageIdentifier(card));
		}
	}

}
