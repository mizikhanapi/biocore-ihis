<%-- 
    Document   : procedure1_delete
    Created on : May 18, 2017, 2:28:41 AM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();

    String code_1 = request.getParameter("code_1");
    String code = request.getParameter("code");
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");

    RMIConnector rmi = new RMIConnector();
    String query = "Delete from cis_procedure_2 where procedure_1_cd = '" + code_1 + "' and procedure_2_cd = '" + code + "' AND hfc_cd = '" + hfc_cd + "'";
    boolean isDelete = rmi.setQuerySQL(conn.HOST, conn.PORT, query);

    if (isDelete) {
        out.print("success");
    } else {
        out.print("fail");
    }


%>
