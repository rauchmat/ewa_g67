package at.ac.tuwien.big.ewa.ue4.bsp1.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import at.ac.tuwien.big.ewa.ue4.bsp1.domain.Chat;
import at.ac.tuwien.big.ewa.ue4.bsp1.domain.Message;

public class ChatController extends HttpServlet {

	private static final long serialVersionUID = 7830604605299588034L;

	private void ensureChat() {
		if (getServletContext().getAttribute("chat") == null) {
			Chat chat = new Chat();
			getServletContext().setAttribute("chat", chat);
		}
	}

	private Chat getChat() {
		ensureChat();
		return (Chat) getServletContext().getAttribute("chat");

	}

	private void setChat(Chat chat) {
		ensureChat();
		getServletContext().setAttribute("chat", chat);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		final Chat chat = getChat();
		
		resp.setContentType("text/xml;charset=UTF-8");
		final PrintWriter out = resp.getWriter();

		try {
			out.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
			int revision = 0;
			if (req.getParameter("revision") != null) {
				try {
					revision = Integer.parseInt(req.getParameter("revision"));
				} catch (final NumberFormatException e) {
				}
			}
			
			out.println(chat.serialize(revision));
		} finally {
			out.close();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException {
		final Chat chat = getChat();
		
		if (req.getParameter("username") != null
				&& req.getParameter("messagetext") != null) {

			// new message
			final String userName = req.getParameter("username").toString();
			final String message = req.getParameter("messagetext").toString();

			chat.add(new Message(userName, message));

			setChat(chat);
		}
	}
}
