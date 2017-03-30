<%-- 
    Document   : bodySystem_update
    Created on : Mar 30, 2017, 10:16:23 AM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String bs_code = request.getParameter("bs_code");
    String bs_name = request.getParameter("bs_name");
    String status = request.getParameter("status");
    
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    
    String query = "Update ris_body_system set body_system_name = '"+bs_name+"', status = '"+status+"' "
            + "WHERE hfc_cd = '"+hfc_cd+"' AND body_system_cd = '"+bs_code+"'";
    
    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, query);
    
    if(isUpdate){
        out.print("success");
    }else{
        out.print("fail");
    }

%>
