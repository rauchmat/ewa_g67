/**
 * NewsServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package at.ac.tuwien.big.ewa.news;

@SuppressWarnings("unchecked")
public class NewsServiceLocator extends org.apache.axis.client.Service implements at.ac.tuwien.big.ewa.news.NewsService {

	private static final long serialVersionUID = 3176108888855974653L;

	// Use to get a proxy class for NewsPort
	private java.lang.String NewsPort_address = "http://pephimon.big.tuwien.ac.at:80/NewsService/NewsService";

	// The WSDD service name defaults to the port name.
	private java.lang.String NewsPortWSDDServiceName = "NewsPort";

	private java.util.HashSet ports = null;

	public NewsServiceLocator() {
	}

	public NewsServiceLocator(java.lang.String wsdlLoc, javax.xml.namespace.QName sName)
	        throws javax.xml.rpc.ServiceException {
		super(wsdlLoc, sName);
	}

	public NewsServiceLocator(org.apache.axis.EngineConfiguration config) {
		super(config);
	}

	public at.ac.tuwien.big.ewa.news.News getNewsPort() throws javax.xml.rpc.ServiceException {
		java.net.URL endpoint;
		try {
			endpoint = new java.net.URL(NewsPort_address);
		} catch (final java.net.MalformedURLException e) {
			throw new javax.xml.rpc.ServiceException(e);
		}
		return getNewsPort(endpoint);
	}

	public at.ac.tuwien.big.ewa.news.News getNewsPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
		try {
			final at.ac.tuwien.big.ewa.news.NewsPortBindingStub _stub = new at.ac.tuwien.big.ewa.news.NewsPortBindingStub(
			        portAddress, this);
			_stub.setPortName(getNewsPortWSDDServiceName());
			return _stub;
		} catch (final org.apache.axis.AxisFault e) {
			return null;
		}
	}

	public java.lang.String getNewsPortAddress() {
		return NewsPort_address;
	}

	public java.lang.String getNewsPortWSDDServiceName() {
		return NewsPortWSDDServiceName;
	}

	/**
	 * For the given interface, get the stub implementation. If this service has no port for the given interface, then
	 * ServiceException is thrown.
	 */
	@Override
	public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
		try {
			if (at.ac.tuwien.big.ewa.news.News.class.isAssignableFrom(serviceEndpointInterface)) {
				final at.ac.tuwien.big.ewa.news.NewsPortBindingStub _stub = new at.ac.tuwien.big.ewa.news.NewsPortBindingStub(
				        new java.net.URL(NewsPort_address), this);
				_stub.setPortName(getNewsPortWSDDServiceName());
				return _stub;
			}
		} catch (final java.lang.Throwable t) {
			throw new javax.xml.rpc.ServiceException(t);
		}
		throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  "
		        + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
	}

	/**
	 * For the given interface, get the stub implementation. If this service has no port for the given interface, then
	 * ServiceException is thrown.
	 */
	@Override
	public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface)
	        throws javax.xml.rpc.ServiceException {
		if (portName == null) return getPort(serviceEndpointInterface);
		final java.lang.String inputPortName = portName.getLocalPart();
		if ("NewsPort".equals(inputPortName))
			return getNewsPort();
		else {
			final java.rmi.Remote _stub = getPort(serviceEndpointInterface);
			((org.apache.axis.client.Stub) _stub).setPortName(portName);
			return _stub;
		}
	}

	@Override
	public java.util.Iterator getPorts() {
		if (ports == null) {
			ports = new java.util.HashSet();
			ports.add(new javax.xml.namespace.QName("http://news.ewa.big.tuwien.ac.at/", "NewsPort"));
		}
		return ports.iterator();
	}

	@Override
	public javax.xml.namespace.QName getServiceName() {
		return new javax.xml.namespace.QName("http://news.ewa.big.tuwien.ac.at/", "NewsService");
	}

	/**
	 * Set the endpoint address for the specified port name.
	 */
	public void setEndpointAddress(java.lang.String portName, java.lang.String address)
	        throws javax.xml.rpc.ServiceException {

		if ("NewsPort".equals(portName))
			setNewsPortEndpointAddress(address);
		else
			throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
	}

	/**
	 * Set the endpoint address for the specified port name.
	 */
	public void setEndpointAddress(javax.xml.namespace.QName portName, java.lang.String address)
	        throws javax.xml.rpc.ServiceException {
		setEndpointAddress(portName.getLocalPart(), address);
	}

	public void setNewsPortEndpointAddress(java.lang.String address) {
		NewsPort_address = address;
	}

	public void setNewsPortWSDDServiceName(java.lang.String name) {
		NewsPortWSDDServiceName = name;
	}

}
