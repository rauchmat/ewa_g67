package at.ac.tuwien.big.ewa.ue4.bsp1.servlets;

import java.sql.Time;
import java.util.Date;

public class Message {

	private final String message;
	private final Time time;
	private final String username;

	public Message(String username, String message) {
		this.username = username;
		this.message = message;
		time = new Time(new Date().getTime());
	}

	public String getMessage() {
		return message;
	}

	public String getOutputMessage() {
		return "<message><username>" + username + "</username><text>" + message + "</text><time>" + time
		        + "</time></message>";
	}

	public Time getTime() {
		return time;
	}

	public String getUsername() {
		return username;
	}
}
