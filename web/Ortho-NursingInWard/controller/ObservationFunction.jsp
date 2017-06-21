<%-- 
    Document   : ObservationFuntion
    Created on : 21-Jun-2017, 12:46:52
    Author     : shay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="NIW_helper.ObservationUtils"%>
<%
ObservationUtils obU = new ObservationUtils();
String methodName = request.getParameter("methodName");
String data = request.getParameter("datas");
Boolean result;
//String result;
if(methodName.equalsIgnoreCase("add")){
    result = obU.addObservation(data);
    out.print(result);
}
%>
