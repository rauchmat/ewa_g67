package at.ac.tuwien.big.ewa.ue3.controller;

import java.io.IOException;

import javax.faces.event.PhaseEvent;

import at.ac.tuwien.big.easyholdem.player.Player;
import at.ac.tuwien.big.ewa.ue3.Constants;

public class LoginController {

	protected Player player;

	public void beforePhase(PhaseEvent phase) {
		if (player != null && player.getId() != 0) try {
			phase.getFacesContext().getExternalContext().redirect("welcome.jsp");
		} catch (final IOException e) {
			e.printStackTrace();
		}
	}

	public Player getPlayer() {
		return player;
	}

	public String login() {
		final Player serverPlayer = Constants.playerDao.getPlayerByUsername(player.getUserName());

		if (serverPlayer == null) return "failUser";

		if (!player.getPassword().equals(serverPlayer.getPassword())) return "failPassword";

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

	public void setPlayer(Player player) {
		this.player = player;
	}

}
