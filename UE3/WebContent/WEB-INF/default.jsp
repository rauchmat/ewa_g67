<%@page contentType="application/xhtml+xml; charset=utf-8" %>
<%
String redirect = request.getContextPath() + "/faces/index.jsp";
response.sendRedirect(redirect);
%>