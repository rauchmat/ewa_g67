package at.ac.tuwien.big.ewa.ue3.controller;

import java.io.IOException;

import javax.faces.event.PhaseEvent;

import at.ac.tuwien.big.easyholdem.player.Player;

public class ForwardToIndexControllerBase extends PlayerControllerBase {

	public void beforePhase(PhaseEvent phaseEvent) {
		final Player player = (Player) phaseEvent.getFacesContext().getExternalContext().getSessionMap().get(
		        "playerBean");

		if (player == null || player.getId() == 0) try {
			phaseEvent.getFacesContext().getExternalContext().redirect("index.jsp");
			System.out.println(this.getClass().toString() + " forwarded to Index");
		} catch (final IOException e) {
			System.err.println("Forwarding to Index Failed");
			e.printStackTrace();
		}
	}

}
