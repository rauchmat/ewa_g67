package at.ac.tuwien.big.ewa.ue3.controller;

import javax.faces.model.SelectItem;
import javax.servlet.http.HttpServletRequest;

import at.ac.tuwien.big.easyholdem.player.Player;
import at.ac.tuwien.big.easyholdem.player.Player.Gender;
import at.ac.tuwien.big.ewa.ue3.Constants;

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
}
