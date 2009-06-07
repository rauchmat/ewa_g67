package at.ac.tuwien.big.ewa.ue4.bsp1.domain;

public class Message {

	private final String text;
	private final String username;

	public Message(String username, String text) {
		this.username = username;
		this.text = text;
	}

	public String getText() {
		return text;
	}

	public String getUsername() {
		return username;
	}

	public String serialize() {
		StringBuilder sb = new StringBuilder();
		sb.append("<message>");
		sb.append("<username>");
		sb.append(username);
		sb.append("</username>");
		sb.append("<text>");
		sb.append(text);
		sb.append("</text>");
		sb.append("</message>");
		return sb.toString();
	}
}
