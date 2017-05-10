<%-- 
    Document   : procedure_delete
    Created on : May 10, 2017, 7:11:58 PM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    String code = request.getParameter("code");
    
    String sqlCheck = "Select procedure_cd from cis_procedure_1 where procedure_cd = '"+code+"' limit 1";
    ArrayList<ArrayList<String>> looked = conn.getData(sqlCheck);
    
    if(looked.size() > 0){
        out.print("look");
    
    }else{
        RMIConnector rmi = new RMIConnector(); 
        String query = "Delete from cis_procedure where procedure_cd = '"+code+"'";
        boolean isDelete = rmi.setQuerySQL(conn.HOST, conn.PORT, query);
        
        if(isDelete){
            out.print("success");
        }else{
            out.print("fail");
        }
        
    
    }
%>
