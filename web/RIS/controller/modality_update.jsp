<%-- 
    Document   : modality_update
    Created on : Apr 3, 2017, 5:59:38 PM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    String mod_hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    
    String mod_code = request.getParameter("mod_code");
    String mod_name = request.getParameter("mod_name");
    String status = request.getParameter("status");
    
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    
    String query = "Update ris_modality set modality_name = '"+mod_name+"', status = '"+status+"' "
            + "WHERE modality_cd = '"+mod_code+"' AND hfc_cd = '"+mod_hfc+"'";
    
    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, query);
    
    if(isUpdate){
        out.print("success");
    
    }else{
    
        out.print("fail");
    }
%>
