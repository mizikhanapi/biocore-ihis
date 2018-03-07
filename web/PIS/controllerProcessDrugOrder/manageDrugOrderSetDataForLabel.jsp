<%-- 
    Document   : manageDrugOrderSetDataForLabel
    Created on : Mar 7, 2018, 1:55:00 PM
    Author     : Shammugam
--%>

<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();

    String labelData = request.getParameter("labelData");

    session.setAttribute("PHARMACY_GENERATED_LABEL_DATA", labelData);

%>
