package at.ac.tuwien.big.ewa.ue3.controller;

import java.io.IOException;

import javax.faces.event.PhaseEvent;
import javax.faces.model.SelectItem;
import javax.servlet.http.HttpServletRequest;

import at.ac.tuwien.big.easyholdem.player.Player;
import at.ac.tuwien.big.easyholdem.player.Player.Gender;
import at.ac.tuwien.big.ewa.ue3.Constants;

public class RegisterController {

	private static final String FAIL = "fail";

	private static final String SUCCESS = "success";

	private Player player;

	public void beforePhase(PhaseEvent phase) {
		if (player != null && player.getId() != 0) try {
			phase.getFacesContext().getExternalContext().redirect("welcome.jsp");
		} catch (final IOException e) {
			e.printStackTrace();
		}
	}

	public SelectItem[] getGenders() {
		return new SelectItem[] { new SelectItem(Gender.FEMALE.toString(), "weiblich"),
		        new SelectItem(Gender.MALE.toString(), "männlich") };
	}

	public Player getPlayer() {
		return player;
	}

	public String getRequiredMessage() {
		return "Eingabe benötigt";
	}

	public String register() {
		try {
			final HttpServletRequest request = (HttpServletRequest) javax.faces.context.FacesContext
			        .getCurrentInstance().getExternalContext().getRequest();
			final Player playerBean = (Player) request.getAttribute("registerPlayerBean");

			Constants.playerDao.persist(playerBean);

			if (playerBean.getId() == 0) return RegisterController.FAIL;

			return RegisterController.SUCCESS;
		} catch (final Exception e) {
			return RegisterController.FAIL;
		}
	}

	public void setPlayer(Player player) {
		this.player = player;
	}
}
