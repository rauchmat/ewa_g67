package ewa.poker.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import at.ac.tuwien.big.easyholdem.game.Action;
import at.ac.tuwien.big.easyholdem.game.Game;
import at.ac.tuwien.big.easyholdem.player.Player;
import at.ac.tuwien.big.easyholdem.poker.Card;
import at.ac.tuwien.big.easyholdem.poker.Cards;
import at.ac.tuwien.big.easyholdem.probsim.ProbabilitySimulator;

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
	private static final String PROBABILITY_BEAN_ID = "probabilityBean";

	private static final long serialVersionUID = 7830604605299588034L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (request.getParameterMap().containsKey(NEWGAME_KEY)) {
			debugMessage("Action: NEWGAME");
			startGame(request, response);
		} else if (request.getParameterMap().containsKey(CHANGEUSERDATA_KEY)) {
			debugMessage("Action: CHANGEUSERDATA");
			// TODO: handle request
			
			RequestDispatcher disp = getServletContext().getRequestDispatcher(
					GAME_PATH);
			disp.forward(request, response);
		} else if (request.getParameterMap().containsKey(LOGOUT_KEY)) {
			debugMessage("Action: LOGOUT");
			// TODO: handle request
			
			RequestDispatcher disp = getServletContext().getRequestDispatcher(
					GAME_PATH);
			disp.forward(request, response);
		} else if (request.getParameterMap().containsKey(BET_KEY)) {
			debugMessage("Action: BET");
			
			HttpSession session = request.getSession(false);
			
			// TODO better error handling
			if(session == null) return;
			
			Game gameBean = (Game) session.getAttribute(GAME_BEAN_ID);
			
			// TODO better error handling
			if(gameBean == null) return;
			
			gameBean.act(Action.BET);
			
			createProbabilitySimulator(session, gameBean);
			
			RequestDispatcher disp = getServletContext().getRequestDispatcher(
					GAME_PATH);
			disp.forward(request, response);
		} else if (request.getParameterMap().containsKey(CHECK_KEY)) {
			debugMessage("Action: CHECK");
			
			HttpSession session = request.getSession(false);
			
			// TODO better error handling
			if(session == null) return;
			
			Game gameBean = (Game) session.getAttribute(GAME_BEAN_ID);
			
			// TODO better error handling
			if(gameBean == null) return;
			
			gameBean.act(Action.CHECK);
			
			createProbabilitySimulator(session, gameBean);
			
			RequestDispatcher disp = getServletContext().getRequestDispatcher(
					GAME_PATH);
			disp.forward(request, response);
		} else if (request.getParameterMap().containsKey(FOLD_KEY)) {
			debugMessage("Action: FOLD");
			
			HttpSession session = request.getSession(false);
			
			// TODO better error handling
			if(session == null) return;
			
			Game gameBean = (Game) session.getAttribute(GAME_BEAN_ID);
			
			// TODO better error handling
			if(gameBean == null) return;
			gameBean.act(Action.FOLD);
			
			session.setAttribute(PROBABILITY_BEAN_ID, null);
			
			RequestDispatcher disp = getServletContext().getRequestDispatcher(
					GAME_PATH);
			disp.forward(request, response);
		} else { //default
			debugMessage("Action: DEFAULT");
			
			Game gameBean = null;
			
			HttpSession session = request.getSession(false);
			
			if(session != null)
				gameBean = (Game) session.getAttribute(GAME_BEAN_ID);
			
			if(gameBean == null)
				startGame(request, response);
			else {
				RequestDispatcher disp = getServletContext().getRequestDispatcher(GAME_PATH);
				disp.forward(request, response);
			}
		}
	}
	
	private static void debugMessage(String message) {
		System.out.println(message);
	}
	
	private void createProbabilitySimulator(HttpSession session, Game gameBean) {
		List<Card> cards = new Vector<Card>();
		
		if(gameBean.getFlopCards() != null)
			cards.addAll(gameBean.getFlopCards());
		
		if(gameBean.getTurnCard() != null)
			cards.add(gameBean.getTurnCard());
		
		if(gameBean.getRiverCard() != null)
			cards.add(gameBean.getRiverCard());
		
		Cards board = new Cards(cards.size());
		board.addAll(cards);
		ProbabilitySimulator probabilityBean = new ProbabilitySimulator(gameBean.getPlayersCards(), board);
		
		session.setAttribute(PROBABILITY_BEAN_ID, probabilityBean.simulate());
	}

	private void startGame(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		debugMessage("Starting new game");
		
		HttpSession session = request.getSession(true);
		
		Game oldGameBean = (Game) session.getAttribute(GAME_BEAN_ID);
		int oldStackSize = Integer.MIN_VALUE;
		
		if(oldGameBean != null) {
			oldStackSize = oldGameBean.getPlayer().getStack();
			debugMessage("Got old stack: " + oldStackSize);
		}

		Game gameBean = new Game(getPlayer(oldStackSize), DEFAULT_BET_SIZE);
		
		session.setAttribute(GAME_BEAN_ID, gameBean);

		// By default every game is played
		gameBean.act(Action.ANTE);
		
		createProbabilitySimulator(session, gameBean);

		RequestDispatcher disp = getServletContext().getRequestDispatcher(
				GAME_PATH);
		disp.forward(request, response);
	}

	private static Player getPlayer(int oldStackSize) {
		Player player = new Player();
		player.setUserName(DEFAULT_USER_NAME);
		player.setStack(oldStackSize != Integer.MIN_VALUE ? oldStackSize : DEFAULT_STACK_SIZE);
		return player;
	}
}
