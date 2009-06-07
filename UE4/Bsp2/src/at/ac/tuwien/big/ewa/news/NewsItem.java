/**
 * NewsItem.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package at.ac.tuwien.big.ewa.news;

@SuppressWarnings("unchecked")
public class NewsItem implements java.io.Serializable {
	private static final long serialVersionUID = 7349088002567687418L;

	// Type metadata
	private static org.apache.axis.description.TypeDesc typeDesc = new org.apache.axis.description.TypeDesc(
	        NewsItem.class, true);

	static {
		NewsItem.typeDesc.setXmlType(new javax.xml.namespace.QName("http://news.ewa.big.tuwien.ac.at/", "newsItem"));
		org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
		elemField.setFieldName("date");
		elemField.setXmlName(new javax.xml.namespace.QName("", "date"));
		elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "dateTime"));
		elemField.setMinOccurs(0);
		elemField.setNillable(false);
		NewsItem.typeDesc.addFieldDesc(elemField);
		elemField = new org.apache.axis.description.ElementDesc();
		elemField.setFieldName("description");
		elemField.setXmlName(new javax.xml.namespace.QName("", "description"));
		elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
		elemField.setMinOccurs(0);
		elemField.setNillable(false);
		NewsItem.typeDesc.addFieldDesc(elemField);
		elemField = new org.apache.axis.description.ElementDesc();
		elemField.setFieldName("link");
		elemField.setXmlName(new javax.xml.namespace.QName("", "link"));
		elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
		elemField.setMinOccurs(0);
		elemField.setNillable(false);
		NewsItem.typeDesc.addFieldDesc(elemField);
	}

	/**
	 * Get Custom Deserializer
	 */
	public static org.apache.axis.encoding.Deserializer getDeserializer(java.lang.String mechType,
	        java.lang.Class _javaType, javax.xml.namespace.QName _xmlType) {
		return new org.apache.axis.encoding.ser.BeanDeserializer(_javaType, _xmlType, NewsItem.typeDesc);
	}

	/**
	 * Get Custom Serializer
	 */
	public static org.apache.axis.encoding.Serializer getSerializer(java.lang.String mechType,
	        java.lang.Class _javaType, javax.xml.namespace.QName _xmlType) {
		return new org.apache.axis.encoding.ser.BeanSerializer(_javaType, _xmlType, NewsItem.typeDesc);
	}

	/**
	 * Return type metadata object
	 */
	public static org.apache.axis.description.TypeDesc getTypeDesc() {
		return NewsItem.typeDesc;
	}

	private java.lang.Object __equalsCalc = null;

	private boolean __hashCodeCalc = false;

	private java.util.Calendar date;

	private java.lang.String description;

	private java.lang.String link;

	public NewsItem() {
	}

	public NewsItem(java.util.Calendar date, java.lang.String description, java.lang.String link) {
		this.date = date;
		this.description = description;
		this.link = link;
	}

	@Override
	public synchronized boolean equals(java.lang.Object obj) {
		if (!(obj instanceof NewsItem)) return false;
		final NewsItem other = (NewsItem) obj;
		if (obj == null) return false;
		if (this == obj) return true;
		if (__equalsCalc != null) return __equalsCalc == obj;
		__equalsCalc = obj;
		boolean _equals;
		_equals = true
		        && (date == null && other.getDate() == null || date != null && date.equals(other.getDate()))
		        && (description == null && other.getDescription() == null || description != null
		                && description.equals(other.getDescription()))
		        && (link == null && other.getLink() == null || link != null && link.equals(other.getLink()));
		__equalsCalc = null;
		return _equals;
	}

	/**
	 * Gets the date value for this NewsItem.
	 * 
	 * @return date
	 */
	public java.util.Calendar getDate() {
		return date;
	}

	/**
	 * Gets the description value for this NewsItem.
	 * 
	 * @return description
	 */
	public java.lang.String getDescription() {
		return description;
	}

	/**
	 * Gets the link value for this NewsItem.
	 * 
	 * @return link
	 */
	public java.lang.String getLink() {
		return link;
	}

	@Override
	public synchronized int hashCode() {
		if (__hashCodeCalc) return 0;
		__hashCodeCalc = true;
		int _hashCode = 1;
		if (getDate() != null) _hashCode += getDate().hashCode();
		if (getDescription() != null) _hashCode += getDescription().hashCode();
		if (getLink() != null) _hashCode += getLink().hashCode();
		__hashCodeCalc = false;
		return _hashCode;
	}

	/**
	 * Sets the date value for this NewsItem.
	 * 
	 * @param date
	 */
	public void setDate(java.util.Calendar date) {
		this.date = date;
	}

	/**
	 * Sets the description value for this NewsItem.
	 * 
	 * @param description
	 */
	public void setDescription(java.lang.String description) {
		this.description = description;
	}

	/**
	 * Sets the link value for this NewsItem.
	 * 
	 * @param link
	 */
	public void setLink(java.lang.String link) {
		this.link = link;
	}

}
