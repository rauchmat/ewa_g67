package at.ac.tuwien.big.ewa.ue3.converter;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.ConverterException;

import at.ac.tuwien.big.easyholdem.player.Player.Gender;

public class GenderConverter implements Converter {

	public Object getAsObject(FacesContext context, UIComponent component, String value) {
		try {
			return Enum.valueOf(Gender.class, value);
		} catch (final Exception e) {
			final FacesMessage message = new FacesMessage();
			message.setDetail(e.getMessage());
			message.setSummary("Gender is missing or not valid");
			message.setSeverity(FacesMessage.SEVERITY_ERROR);
			throw new ConverterException(message);
		}
	}

	public String getAsString(FacesContext facesContext, UIComponent uiComponent, Object value) {
		return value.toString();
	}

}
