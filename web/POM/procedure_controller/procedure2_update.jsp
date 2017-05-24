<%-- 
    Document   : procedure1_update
    Created on : May 18, 2017, 2:20:12 AM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    RMIConnector rmi = new RMIConnector();
    
    String code_1 = request.getParameter("code_1");
    String code = request.getParameter("code");
    String name = request.getParameter("name");
    String status = request.getParameter("status");
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    
    String query = "Update cis_procedure_2 set procedure_2_name = '"+name+"', status = '"+status+"' "
            + "Where procedure_1_cd = '"+code_1+"' and procedure_2_cd = '"+code+"'  and hfc_cd = '"+hfc_cd+"' ";
    boolean isUpdate = rmi.setQuerySQL(conn.HOST, conn.PORT, query);
    
    if(isUpdate){
        out.print("success");
    }else{
        out.print("fail");
    }
    

%>
