<%-- 
    Document   : master_lookup_update
    Created on : Jan 25, 2017, 6:35:07 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  
    
    String userID = (String)session.getAttribute("USER_ID");
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    
    String last = userID.substring(userID.length() - 1);
    
    if(!hfc.equals("99_iHIS_99") || !last.equals("9")){
    
        out.print("Sorry, you are not authorized to do that!");
        return;    
    }
//    Config.getBase_url(request);
//    Config.getFile_url(session);
    Conn conn  = new Conn();
    
    String masterCode = request.getParameter("masterCode");
    String masterDesc = request.getParameter("masterDesc");
    String masterSource = request.getParameter("masterSource");
    String status = request.getParameter("status");

    RMIConnector rmic = new RMIConnector();

    String sqlUpdate = "UPDATE adm_lookup_master SET description = '"+masterDesc+"', source_indicator = '"+masterSource+"', status = '"+status+"'"+
                        " WHERE master_reference_code = '"+masterCode+"'";
    
    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);
    
    
    if (isUpdate == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>
