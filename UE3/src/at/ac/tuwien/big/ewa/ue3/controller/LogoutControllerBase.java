package at.ac.tuwien.big.ewa.ue3.controller;

import javax.faces.context.FacesContext;

import at.ac.tuwien.big.easyholdem.player.Player;

public abstract class LogoutControllerBase extends ForwardToIndexControllerBase {

	public String logout() {
		final Player playerBean = (Player) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get(
		        "playerBean");
		playerBean.setId(0);
		playerBean.setDateOfBirth(null);
		playerBean.setFirstName("");
		playerBean.setGender(null);
		playerBean.setLastName("");
		playerBean.setPassword("");
		playerBean.setStack(0);
		playerBean.setUserName("");

		return "logout";
	}
}
