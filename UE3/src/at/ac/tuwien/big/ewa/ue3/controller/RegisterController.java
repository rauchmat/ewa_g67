package at.ac.tuwien.big.ewa.ue3.controller;

import javax.faces.model.SelectItem;

import at.ac.tuwien.big.easyholdem.player.Player.Gender;

public class RegisterController {

	private static final String FAIL = "fail";

	private static final String SUCCESS = "success";

	public SelectItem[] getGenders() {
		return new SelectItem[] { new SelectItem(Gender.FEMALE.toString(), "weiblich"),
		        new SelectItem(Gender.MALE.toString(), "männlich") };
	}

	public String getRequiredMessage() {
		return "Eingabe benötigt";
	}

	public String register() {
		return RegisterController.FAIL;
	}

}
