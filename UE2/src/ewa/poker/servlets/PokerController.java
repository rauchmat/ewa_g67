package ewa.poker.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PokerController extends HttpServlet {

	private static final String NEWGAME_KEY = "newGame";
	private static final String CHANGEUSERDATA_KEY = "changeUserData";
	private static final String LOGOUT_KEY = "logout";
	
	private static final long serialVersionUID = 7830604605299588034L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		if (req.getParameterMap().containsKey(NEWGAME_KEY)) {
			RequestDispatcher disp = getServletContext().getRequestDispatcher("/table.jsp");
			disp.forward(req, resp);
		}
		if (req.getParameterMap().containsKey(CHANGEUSERDATA_KEY)) {
			//TODO: handle request
		}
		if (req.getParameterMap().containsKey(LOGOUT_KEY)) {
			//TODO: handle request
		}
	}
}
