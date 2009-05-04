package at.ac.tuwien.big.ewa.ue3;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import at.ac.tuwien.big.easyholdem.game.Action;
import at.ac.tuwien.big.easyholdem.game.Game;

/**
 * Servlet implementation class for Servlet: PokerServlet
 * 
 * @author Philip Langer
 * @modified Wimsi@BIG
 */
public class PokerServlet extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {

	private static final String ACTION_PARAM_NAME = "act";

	private static final String NEW_GAME_ACTION = "newgame";

	public static final String PLAY_ACTION = "play";
	private static final long serialVersionUID = 2106306679072586429L;

	public static final String SUBMIT_BET_ACTION = "BET";
	public static final String SUBMIT_CHECK_ACTION = "CHECK";
	public static final String SUBMIT_FOLD_ACTION = "FOLD";

	/*
	 * (non-Java-doc)
	 * 
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public PokerServlet() {
		super();
	}

	/*
	 * (non-Java-doc)
	 * 
	 * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(final HttpServletRequest request, final HttpServletResponse response)
	        throws ServletException, IOException {

		final String action = request.getParameter(PokerServlet.ACTION_PARAM_NAME);

		final HttpSession session = request.getSession();

		if (PokerServlet.NEW_GAME_ACTION.equals(action)) {
			session.setAttribute("gameBean", new GameBean());

			final RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/table.jsp");
			dispatcher.forward(request, response);

		} else if (PokerServlet.PLAY_ACTION.equals(action)) {
			final GameBean gb = (GameBean) session.getAttribute("gameBean");
			final Game g = gb.getGame();

			final String sufix = request.getParameter("submit");
			if (PokerServlet.SUBMIT_BET_ACTION.equals(sufix))
				g.act(Action.BET);
			else if (PokerServlet.SUBMIT_CHECK_ACTION.equals(sufix))
				g.act(Action.CHECK);
			else if (PokerServlet.SUBMIT_FOLD_ACTION.equals(sufix)) g.act(Action.FOLD);

			session.setAttribute("gameBean", gb);

			final RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/table.jsp");
			dispatcher.forward(request, response);
		}
	}

}