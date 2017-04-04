<%-- 
    Document   : procedure_update
    Created on : Apr 4, 2017, 11:38:02 PM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    
    String proCode = request.getParameter("procedure_cd");
    String proName = request.getParameter("procedure_name");
    String sell = request.getParameter("sellPrice");
    String buy = request.getParameter("buyPrice");
    String quantity = request.getParameter("quantity");
    String status = request.getParameter("status");
    
    Conn conn = new Conn();
    
    RMIConnector rmic = new RMIConnector();
    
    String query = "Update ris_procedure_master set ris_procedure_name = '"+proName+"', selling_price = '"+sell+"', buying_price = '"+buy+"', quantity = '"+quantity+"', status = '"+status+"' "
            + " Where hfc_cd = '"+hfc_cd+"' AND ris_procedure_cd = '"+proCode+"'";
    
    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, query);
    
    if(isUpdate){
        out.print("success");
    }else{
        out.print("fail");
    }
    
    
%>
