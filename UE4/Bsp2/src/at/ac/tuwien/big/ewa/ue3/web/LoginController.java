package at.ac.tuwien.big.ewa.ue3.web;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

import at.ac.tuwien.big.easyholdem.player.Player;
import at.ac.tuwien.big.easyholdem.player.PlayerDAO;

/**
 * Controller class handling all requests and actions concerning the login
 * process.
 * 
 * @author Philip Langer
 */
public class LoginController {

	/**
	 * Expression language expression representing the <code>player</code>
	 * bean.
	 */
	private static final String EL_PLAYER = "#{player}";

	/**
	 * Return value indicating a successful completion of an action.
	 */
	private static final String SUCCESS = "success";

	/**
	 * Return value indicating a unsuccessful completion of an action.
	 */
	private static final String FAIL = "fail";

	/**
	 * The injected {@link Player} currently logged in.
	 */
	private Player loggedInPlayer;

	/**
	 * The injected {@link PlayerDAO} to use for persisting {@link Player}s.
	 */
	private PlayerDAO playerDAO;

	/**
	 * The login user name field.
	 */
	private String loginUser;

	/**
	 * The login user password field.
	 */
	private String loginPassword;

	/***************************************************************************
	 * Managed property methods
	 **************************************************************************/

	/**
	 * Returns the {@link Player} that is currently logged in.
	 * 
	 * @return currently logged in {@link Player}.
	 */
	public Player getLoggedInPlayer() {
		return loggedInPlayer;
	}

	/**
	 * Sets the currently logged in player. This method is used to inject the
	 * currently logged in {@link Player} bean.
	 * 
	 * @param loggedInPlayer
	 *            currently logged in {@link Player}.
	 */
	public void setLoggedInPlayer(Player loggedInPlayer) {
		this.loggedInPlayer = loggedInPlayer;
	}

	/**
	 * Returns the previously injected {@link PlayerDAO} bean.
	 * 
	 * @return current used {@link PlayerDAO} instance.
	 */
	public PlayerDAO getPlayerDAO() {
		return playerDAO;
	}
	
	/**
	 * Sets the {@link PlayerDAO}. This method is used to inject the
	 * {@link PlayerDAO}.
	 * 
	 * @param playerDAO
	 *            to set.
	 */
	public void setPlayerDAO(PlayerDAO playerDAO) {
		this.playerDAO = playerDAO;
	}

	/***************************************************************************
	 * Methods invoked by pages
	 **************************************************************************/

	/**
	 * Returns <code>true</code> if in the current session there is a user
	 * currently logged in. <code>false</code> otherwise.
	 * 
	 * @return <code>true</code> if logged in. <code>false</code> otherwise.
	 */
	public boolean isLoggedIn() {
		if (loggedInPlayer != null && loggedInPlayer.getUserName() != null) {
			return true;
		}
		return false;
	}

	/**
	 * Logs out the current user.
	 * 
	 * @return Returns &quot;success&quot; always.
	 */
	public String logout() {
		FacesContext context = FacesContext.getCurrentInstance();
		context.getApplication().getExpressionFactory().createValueExpression(
				context.getELContext(), EL_PLAYER, Player.class).setValue(
				context.getELContext(), null);
		return SUCCESS;
	}

	/**
	 * Logs in the user identified by the user name field and password field.
	 * 
	 * @return &quot;success&quot; if the authentication was successful.
	 *         &quot;fail&quot; otherwise.
	 */
	public String login() {
		FacesContext context = FacesContext.getCurrentInstance();
		Player p = playerDAO.getPlayerByUsername(loginUser);
		if (p != null && p.getPassword().equals(loginPassword)) {
			this.loggedInPlayer = p;
			context.getApplication().getExpressionFactory()
					.createValueExpression(context.getELContext(), EL_PLAYER,
							Player.class).setValue(context.getELContext(), p);
			return SUCCESS;
		} else {
			this.loggedInPlayer = null;
			context.addMessage(null, new FacesMessage("Login fehlgeschlagen."));
			return FAIL;
		}
	}

	/**
	 * Returns the set user name field value.
	 * 
	 * @return user name field value.
	 */
	public String getLoginUser() {
		return loginUser;
	}

	/**
	 * Sets the value of the user name field.
	 * 
	 * @param loginUser
	 *            user name field value.
	 */
	public void setLoginUser(String loginUser) {
		this.loginUser = loginUser;
	}

	/**
	 * Returns the password field value.
	 * 
	 * @return the password field value.
	 */
	public String getLoginPassword() {
		return loginPassword;
	}

	/**
	 * Sets the password field value.
	 * 
	 * @param loginPassword
	 *            the password field value.
	 */
	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}

}
