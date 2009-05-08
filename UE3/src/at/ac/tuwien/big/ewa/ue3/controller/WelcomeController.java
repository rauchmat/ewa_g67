package at.ac.tuwien.big.ewa.ue3.controller;

import at.ac.tuwien.big.easyholdem.player.Player;

public class WelcomeController {
	private Player player;

	public String account() {
		return "account";
	}

	public Player getPlayer() {
		return player;
	}

	public String logout() {
		// TODO clear player bean

		return "logout";
	}

	public void setPlayer(Player player) {
		this.player = player;
	}

	public String table() {
		return "table";
	}

}
