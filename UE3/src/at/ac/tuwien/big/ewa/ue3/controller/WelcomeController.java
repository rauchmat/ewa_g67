package at.ac.tuwien.big.ewa.ue3.controller;

import at.ac.tuwien.big.easyholdem.player.Player;

public class WelcomeController extends LogoutControllerBase {
	private Player player;

	public String account() {
		return "account";
	}

	public Player getPlayer() {
		return player;
	}

	public void setPlayer(Player player) {
		this.player = player;
	}

	public String table() {
		return "table";
	}

}
