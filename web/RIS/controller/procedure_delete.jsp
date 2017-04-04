<%-- 
    Document   : procedure_delete
    Created on : Apr 4, 2017, 11:51:25 PM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    
    String proCode = request.getParameter("proCode");
    
    Conn conn = new Conn();
    
    RMIConnector rmic = new RMIConnector();
    
    String query = "Delete from ris_procedure_master where hfc_cd = '"+hfc_cd+"' AND ris_procedure_cd = '"+proCode+"'";
    
    boolean isDelete = rmic.setQuerySQL(conn.HOST, conn.PORT, query);
    
    if(isDelete){
        out.print("success");
    }else{
        out.print("fail");
        
    }

%>
