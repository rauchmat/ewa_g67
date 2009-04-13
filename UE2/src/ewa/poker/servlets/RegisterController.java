package ewa.poker.servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import at.ac.tuwien.big.easyholdem.player.Player;
import at.ac.tuwien.big.easyholdem.player.Player.Gender;

public class RegisterController extends HttpServlet {

	private static final long serialVersionUID = 8481382501325549952L;
	private final DateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Player player = createPlayerFromRequest(request);

		System.out.println(player);
	}

	private Player createPlayerFromRequest(HttpServletRequest request) {
		String firstName = request.getParameter("firstname");
		String lastName = request.getParameter("lastname");
		String dayOfBirthString = request.getParameter("dateofbirth");
		String sexString = request.getParameter("sex");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String stackString = request.getParameter("stack");

		Date dayOfBirth;
		try {
			dayOfBirth = dateFormat.parse(dayOfBirthString);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

		Gender gender;
		if (sexString.equalsIgnoreCase("m")) {
			gender = Gender.MALE;
		} else if (sexString.equalsIgnoreCase("w")) {
			gender = Gender.FEMALE;
		} else {
			System.err.println("Invalid gender: " + sexString);
			return null;
		}

		int stack;
		try {
			stack = Integer.parseInt(stackString);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

		Player player = new Player();
		player.setFirstName(firstName);
		player.setLastName(lastName);
		player.setDateOfBirth(dayOfBirth);
		player.setGender(gender);
		player.setUserName(username);
		player.setPassword(password);
		player.setStack(stack);
		return player;
	}
}
