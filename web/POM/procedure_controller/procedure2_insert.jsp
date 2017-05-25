<%-- 
    Document   : procedure1_insert
    Created on : May 17, 2017, 10:52:27 AM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String code_1 = request.getParameter("code_1");
    String code = request.getParameter("code");
    String name = request.getParameter("name");
    String status = request.getParameter("status");
    
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    
    Conn conn = new Conn();
    
    String sqlCheck = "Select procedure_2_cd from cis_procedure_2 where procedure_2_cd = '"+code+"' and hfc_cd = '"+hfc_cd+"'  limit 1";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);
    
    if(duplicate.size()>0){
    
        out.print("duplicate");
    
    }else{
        String query = "Insert into cis_procedure_2(procedure_2_cd, procedure_2_name, procedure_1_cd, status, hfc_cd) "
                + "values('"+code+"', '"+name+"', '"+code_1+"', '"+status+"', '"+hfc_cd+"') ";
        RMIConnector rmi = new RMIConnector();
        boolean isInsert = rmi.setQuerySQL(conn.HOST, conn.PORT, query);
        
        if(isInsert){
            out.print("success");
        
        }else{
        
            out.print("fail");
        }
    
    }
    
%>
