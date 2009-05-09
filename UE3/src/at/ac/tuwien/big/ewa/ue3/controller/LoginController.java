package at.ac.tuwien.big.ewa.ue3.controller;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

import at.ac.tuwien.big.easyholdem.player.Player;
import at.ac.tuwien.big.ewa.ue3.Constants;

public class LoginController extends ForwardToWelcomeControllerBase {

	public String login() {
		final Player serverPlayer = Constants.playerDao.getPlayerByUsername(player.getUserName());

		if (serverPlayer == null) {
			final FacesContext context = FacesContext.getCurrentInstance();

			context.addMessage("sendeLogin:username", new FacesMessage("Ungültiger Username."));

			return "failUser";
		}

		if (!player.getPassword().equals(serverPlayer.getPassword())) {
			final FacesContext context = FacesContext.getCurrentInstance();

			context.addMessage("sendeLogin:password", new FacesMessage("Ungültiges Passwort."));

			return "failPassword";
		}

		final FacesContext ctx = FacesContext.getCurrentInstance();

		final Player player = (Player) ctx.getExternalContext().getSessionMap().get("playerBean");
		player.setDateOfBirth(serverPlayer.getDateOfBirth());
		player.setFirstName(serverPlayer.getFirstName());
		player.setGender(serverPlayer.getGender());
		player.setId(serverPlayer.getId());
		player.setLastName(serverPlayer.getLastName());
		player.setPassword(serverPlayer.getPassword());
		player.setStack(serverPlayer.getStack());
		player.setUserName(serverPlayer.getUserName());

		return "success";
	}

}
