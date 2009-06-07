package at.ac.tuwien.big.ewa.ue4.bsp1.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChatController extends HttpServlet {

	private static final long serialVersionUID = 7830604605299588034L;

	@Override
	public void init() throws ServletException {
		super.init();

		final Vector<Message> messages = new Vector<Message>();
		getServletContext().setAttribute("messages", messages);
	}

	@SuppressWarnings("unchecked")
	private Vector<Message> getMessages() {
		return (Vector<Message>) getServletContext().getAttribute("messages");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/xml;charset=UTF-8");
		final PrintWriter out = response.getWriter();

		final Vector<Message> messages = getMessages();

		try {
			out.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
			out.print("<chat>");

			if (request.getParameter("notify") != null) {

				int lastId = 0;
				if (request.getParameter("lastId") != null) try {
					lastId = Integer.parseInt(request.getParameter("lastId"));
				} catch (final NumberFormatException e) {
				}

				for (int i = lastId; i < messages.size(); i++)
					out.println(messages.get(i).getOutputMessage());

				out.print("<lastId>" + messages.size() + "</lastId>");
			}
			out.print("</chat>");
		} finally {
			out.close();
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
	        IOException {
		response.setContentType("text/xml;charset=UTF-8");
		final PrintWriter out = response.getWriter();

		final Vector<Message> messages = getMessages();

		try {
			out.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
			out.print("<chat>");
			if (request.getParameter("username") != null && request.getParameter("message") != null) {

				// new message
				final String userName = request.getParameter("username").toString();
				final String message = request.getParameter("message").toString();

				messages.addElement(new Message(userName, message));

				getServletContext().setAttribute("messages", messages);

				out.print("Message OK");
			}
			out.print("</chat>");
		} finally {
			out.close();
		}
	}
}
