<%-- 
    Document   : procedure_insert
    Created on : May 10, 2017, 6:54:58 PM
    Author     : Ardhi Surya Ibrahim; rdsurya147@gmail.com; insta:@rdcfc
--%>

<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String code = request.getParameter("code");
    String name = request.getParameter("name");
    String status = request.getParameter("status");
    
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    
    Conn conn = new Conn();
    
    String sqlCheck = "Select procedure_cd from cis_procedure where procedure_cd = '"+code+"' and hfc_cd = '"+hfc_cd+"' limit 1";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);
    
    if(duplicate.size()>0){
    
        out.print("duplicate");
    
    }else{
        String query = "Insert into cis_procedure(procedure_cd, procedure_name, status, hfc_cd) "
                + "values('"+code+"', '"+name+"', '"+status+"', '"+hfc_cd+"') ";
        RMIConnector rmi = new RMIConnector();
        boolean isInsert = rmi.setQuerySQL(conn.HOST, conn.PORT, query);
        
        if(isInsert){
            out.print("success");
        
        }else{
        
            out.print("fail");
        }
    
    }
    
%>
