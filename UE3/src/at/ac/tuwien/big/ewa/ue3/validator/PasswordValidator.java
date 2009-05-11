package at.ac.tuwien.big.ewa.ue3.validator;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;
import javax.servlet.http.HttpServletRequest;

import at.ac.tuwien.big.easyholdem.player.Player;
import at.ac.tuwien.big.ewa.ue3.Constants;

public class PasswordValidator implements Validator {

	public void validate(FacesContext facesContext, UIComponent uiComponent, Object value) throws ValidatorException {
		final String enteredPassword = (String) value;

		// TODO HACK! shouldnt access request with validator (put logic to controller, but beforehand figure out how to
		// pass messagess from action to view)
		final HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext()
		        .getRequest();
		Player p = (Player) request.getAttribute("loginPlayerBean");

		if (p == null) {
			final FacesMessage message = new FacesMessage();
			message.setDetail("Benutzerobjekt nicht gefunden.");
			message.setSummary("Benutzerobjekt nicht gefunden.");
			message.setSeverity(FacesMessage.SEVERITY_ERROR);
			throw new ValidatorException(message);
		}

		System.out.println(p.getUserName());

		p = Constants.playerDao.getPlayerByUsername(p.getUserName());

		if (p == null) {
			final FacesMessage message = new FacesMessage();
			message.setDetail("Benutzername nicht korrekt.");
			message.setSummary("Benutzername nicht korrekt.");
			message.setSeverity(FacesMessage.SEVERITY_ERROR);
			throw new ValidatorException(message);
		}

		System.out.println(p.getUserName());
		System.out.println(p.getPassword());
		System.out.println(enteredPassword);

		if (!enteredPassword.equals(p.getPassword())) {
			final FacesMessage message = new FacesMessage();
			message.setDetail("Passwort nicht korrekt.");
			message.setSummary("Password nicht korrekt.");
			message.setSeverity(FacesMessage.SEVERITY_ERROR);
			throw new ValidatorException(message);
		}
	}

}
