package at.ac.tuwien.big.ewa.ue3.validator;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;

import at.ac.tuwien.big.easyholdem.player.Player;
import at.ac.tuwien.big.ewa.ue3.Constants;

public class UsernameValidator implements Validator {

	public void validate(FacesContext facesContext, UIComponent uiComponent, Object value) throws ValidatorException {
		final String enteredUsername = (String) value;

		if (enteredUsername.length() == 0) {
			final FacesMessage message = new FacesMessage();
			message.setDetail("Empty usernames not allowed");
			message.setSummary("Username not valid");
			message.setSeverity(FacesMessage.SEVERITY_ERROR);
			throw new ValidatorException(message);
		}

		final Player p = Constants.playerDao.getPlayerByUsername(enteredUsername);

		if (p != null) {
			final FacesMessage message = new FacesMessage();
			message.setDetail("A user with that name already exists.");
			message.setSummary("Username not valid");
			message.setSeverity(FacesMessage.SEVERITY_ERROR);
			throw new ValidatorException(message);
		}
	}

}
