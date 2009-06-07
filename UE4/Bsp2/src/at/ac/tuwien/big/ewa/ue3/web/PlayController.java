package at.ac.tuwien.big.ewa.ue3.web;

public class PlayController {

	private GameController gameController;
	private LoginController loginController;

	public GameController getGameController() {
		return gameController;
	}

	public LoginController getLoginController() {
		return loginController;
	}

	public boolean isGameStartedAndLoggedIn() {
		return gameController.isGameActive() && loginController.isLoggedIn();
	}

	public boolean isGameStoppedAndLoggedIn() {
		return !gameController.isGameActive() && loginController.isLoggedIn();
	}

	public void setGameController(GameController gameController) {
		this.gameController = gameController;
	}

	public void setLoginController(LoginController loginController) {
		this.loginController = loginController;
	}

}
