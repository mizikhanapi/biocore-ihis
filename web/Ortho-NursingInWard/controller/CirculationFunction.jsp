<%-- 
    Document   : CirculationFunction
    Created on : Jul 8, 2017, 10:35:57 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="NIW_helper.CirculationUtils"%>
<%
    CirculationUtils cirUt = new CirculationUtils();

    String data = request.getParameter("dataString");
    String methodName = request.getParameter("methodName");

    Boolean result;

    if (methodName.equalsIgnoreCase("view") && !data.equalsIgnoreCase("null")) {
        ArrayList<ArrayList<String>> datas = cirUt.getCirculation(data);

%>