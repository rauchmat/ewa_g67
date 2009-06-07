/**
 * NewsService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package at.ac.tuwien.big.ewa.news;

public interface NewsService extends javax.xml.rpc.Service {
    public java.lang.String getNewsPortAddress();

    public at.ac.tuwien.big.ewa.news.News getNewsPort() throws javax.xml.rpc.ServiceException;

    public at.ac.tuwien.big.ewa.news.News getNewsPort(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
