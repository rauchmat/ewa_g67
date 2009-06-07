package at.ac.tuwien.big.ewa.ue4.bsp1.domain;

import java.util.ArrayList;

public class Chat extends ArrayList<Message> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public String serialize(int revision) {
		StringBuilder sb = new StringBuilder();
		sb.append("<chat>");
		
		for (int i = revision; i < this.size(); i++) {
			sb.append(this.get(i).serialize());
		}
		
		sb.append("<revision>");
		sb.append(this.size());
		sb.append("</revision>");
		
		sb.append("</chat>");
		return sb.toString();		
	}

}
