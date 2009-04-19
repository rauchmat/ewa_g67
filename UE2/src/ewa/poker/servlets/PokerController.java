package ewa.poker.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import at.ac.tuwien.big.easyholdem.game.Action;
import at.ac.tuwien.big.easyholdem.game.Game;
import at.ac.tuwien.big.easyholdem.player.Player;

public class PokerController extends HttpServlet {

	private static final String DEFAULT_USER_NAME = "Gastspieler";
	private static final int DEFAULT_STACK_SIZE = 10000;
	private static final int DEFAULT_BET_SIZE = 10;

	private static final String NEWGAME_KEY = "newGame";
	private static final String CHANGEUSERDATA_KEY = "changeUserData";
	private static final String LOGOUT_KEY = "logout";
	private static final String BET_KEY = "Bet";
	private static final String FOLD_KEY = "Fold";
	private static final String CHECK_KEY = "Check";

	private static final String GAME_PATH = "/game.jsp";
	private static final String GAME_BEAN_ID = "gameBean";

	private static final long serialVersionUID = 7830604605299588034L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		if (req.getParameterMap().containsKey(NEWGAME_KEY)) {
			startGame(req, resp);
		}
		if (req.getParameterMap().containsKey(CHANGEUSERDATA_KEY)) {
			// TODO: handle request
		}
		if (req.getParameterMap().containsKey(LOGOUT_KEY)) {
			// TODO: handle request
		}
		if (req.getParameterMap().containsKey(BET_KEY)) {
			Game gameBean = (Game) req.getAttribute(GAME_BEAN_ID);
			gameBean.act(Action.BET);
			
			RequestDispatcher disp = getServletContext().getRequestDispatcher(
					GAME_PATH);
			disp.forward(req, resp);
		}
		if (req.getParameterMap().containsKey(CHECK_KEY)) {
			Game gameBean = (Game) req.getAttribute(GAME_BEAN_ID);
			gameBean.act(Action.CHECK);
			
			RequestDispatcher disp = getServletContext().getRequestDispatcher(
					GAME_PATH);
			disp.forward(req, resp);
		}
		if (req.getParameterMap().containsKey(FOLD_KEY)) {
			Game gameBean = (Game) req.getAttribute(GAME_BEAN_ID);
			gameBean.act(Action.FOLD);
			
			RequestDispatcher disp = getServletContext().getRequestDispatcher(
					GAME_PATH);
			disp.forward(req, resp);
		}
		else {
			//default
			startGame(req, resp);
			System.out.println("asdf");
		}
	}

	private void startGame(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession(true);

		Game gameBean = new Game(getPlayer(), DEFAULT_BET_SIZE);
		session.setAttribute(GAME_BEAN_ID, gameBean);

		// Standardly, every game is played
		gameBean.act(Action.ANTE);

		RequestDispatcher disp = getServletContext().getRequestDispatcher(
				GAME_PATH);
		disp.forward(req, resp);
	}

	private static Player getPlayer() {
		Player player = new Player();
		player.setUserName(DEFAULT_USER_NAME);
		player.setStack(DEFAULT_STACK_SIZE);
		return player;
	}
}
