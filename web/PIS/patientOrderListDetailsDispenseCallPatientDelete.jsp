<%-- 
    Document   : patientOrderListDetailsDispenseCallPatientDelete
    Created on : Jul 29, 2017, 8:13:21 PM
    Author     : Shammugam
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>

<%
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    // Requesting Parameter
    String callDeclineNo = request.getParameter("callDeclineNo");

    // Delete From Calling System
    String sql = "DELETE FROM qcs_calling_system_queue WHERE Id = '" + callDeclineNo + "'  ";
    boolean isDeleteCalling = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

    if (isDeleteCalling == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }


%>
