package at.ac.tuwien.big.ewa.ue3.controller;

import javax.faces.model.SelectItem;

import at.ac.tuwien.big.easyholdem.player.Player;
import at.ac.tuwien.big.ewa.ue3.Constants;

public class RegisterController extends ForwardToWelcomeControllerBase {

	private static final String FAIL = "fail";

	private static final String SUCCESS = "success";

	private final UserdataControllerBase userdataController = new UserdataControllerBase();

	public SelectItem[] getGenders() {
		return userdataController.getGenders();
	}

	public Player getRequestPlayer() {
		return userdataController.getRequestPlayer();
	}

	public String getRequiredMessage() {
		return userdataController.getRequiredMessage();
	}

	public String register() {
		try {
			Constants.playerDao.persist(getRequestPlayer());

			if (getRequestPlayer().getId() == 0) return RegisterController.FAIL;

			return RegisterController.SUCCESS;
		} catch (final Exception e) {
			return RegisterController.FAIL;
		}
	}

	public void setRequestPlayer(Player requestPlayer) {
		userdataController.setRequestPlayer(requestPlayer);
	}

}
