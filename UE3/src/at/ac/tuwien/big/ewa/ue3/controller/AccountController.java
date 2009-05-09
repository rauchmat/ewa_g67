package at.ac.tuwien.big.ewa.ue3.controller;

import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;

import at.ac.tuwien.big.easyholdem.player.Player;
import at.ac.tuwien.big.ewa.ue3.Constants;

public class AccountController extends LogoutControllerBase {

	private final UserdataControllerBase userdataController = new UserdataControllerBase();

	public String cancel() {
		return "cancel";
	}

	public SelectItem[] getGenders() {
		return userdataController.getGenders();
	}

	public Player getRequestPlayer() {
		return userdataController.getRequestPlayer();
	}

	public String getRequiredMessage() {
		return userdataController.getRequiredMessage();
	}

	public String save() {
		final Player databasePlayer = Constants.playerDao.getPlayerById(player.getId());

		databasePlayer.setStack(player.getStack());

		if (player.getPassword() != null && player.getPassword().length() > 8)
		    databasePlayer.setPassword(player.getPassword());

		final Player playerBean = (Player) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get(
		        "playerBean");
		playerBean.setStack(databasePlayer.getStack());
		playerBean.setPassword(databasePlayer.getPassword());

		Constants.playerDao.update(databasePlayer);

		return "save";
	}

	public void setRequestPlayer(Player requestPlayer) {
		userdataController.setRequestPlayer(requestPlayer);
	}

}
