package at.ac.tuwien.big.ewa.ue3.controller;

import javax.faces.model.SelectItem;

import at.ac.tuwien.big.easyholdem.player.Player;
import at.ac.tuwien.big.easyholdem.player.Player.Gender;

public class UserdataControllerBase {

	private Player requestPlayer;

	public SelectItem[] getGenders() {
		return new SelectItem[] { new SelectItem(Gender.FEMALE.toString(), "weiblich"),
		        new SelectItem(Gender.MALE.toString(), "männlich") };
	}

	public Player getRequestPlayer() {
		return requestPlayer;
	}

	public String getRequiredMessage() {
		return "Eingabe benötigt";
	}

	public void setRequestPlayer(Player requestPlayer) {
		this.requestPlayer = requestPlayer;
	}

}