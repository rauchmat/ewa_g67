package at.ac.tuwien.big.ewa.ue3.web;

import java.text.SimpleDateFormat;

import at.ac.tuwien.big.ewa.ue3.NewsPoller;

import com.icesoft.faces.async.render.OnDemandRenderer;
import com.icesoft.faces.async.render.Renderable;
import com.icesoft.faces.webapp.xmlhttp.PersistentFacesState;
import com.icesoft.faces.webapp.xmlhttp.RenderingException;

public class NewsController implements Renderable {

	private static SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
	private NewsPoller poller;
	private OnDemandRenderer renderer;
	private final PersistentFacesState state = PersistentFacesState.getInstance();

	public String getDateString() {
		if (poller == null || poller.getLatestNews() == null) return "";

		return NewsController.dateFormat.format(poller.getLatestNews().getDate().getTime());
	}

	public String getDescription() {
		if (poller == null || poller.getLatestNews() == null) return "";

		return poller.getLatestNews().getDescription();
	}

	public String getLink() {
		if (poller == null || poller.getLatestNews() == null) return "";

		return poller.getLatestNews().getLink();
	}

	public NewsPoller getPoller() {
		return poller;
	}

	public PersistentFacesState getState() {
		return state;
	}

	public boolean isNewsAvailable() {
		return poller != null && poller.getLatestNews() != null;
	}

	public void renderingException(RenderingException arg0) {
		unregisterFromRenderer();
	}

	public void setNewsPoller(NewsPoller poller) {
		this.poller = poller;
	}

	public void setRenderer(OnDemandRenderer renderer) {
		unregisterFromRenderer();

		this.renderer = renderer;

		if (renderer == null) return;

		this.renderer.add(this);
		this.renderer.requestRender();
	}

	private void unregisterFromRenderer() {
		if (renderer != null) {
			renderer.remove(this);
			renderer = null;
		}
	}
}
