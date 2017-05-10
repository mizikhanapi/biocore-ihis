<%-- 
    Document   : procedure_update
    Created on : May 10, 2017, 7:05:24 PM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    RMIConnector rmi = new RMIConnector();
    
    String code = request.getParameter("code");
    String name = request.getParameter("name");
    String status = request.getParameter("status");
    
    String query = "Update cis_procedure set procedure_name = '"+name+"', status = '"+status+"' "
            + "Where procedure_cd = '"+code+"' ";
    boolean isUpdate = rmi.setQuerySQL(conn.HOST, conn.PORT, query);
    
    if(isUpdate){
        out.print("success");
    }else{
        out.print("fail");
    }
    

%>


