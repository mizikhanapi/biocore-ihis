<%-- 
    Document   : delete
    Created on : Jul 21, 2017, 10:59:55 PM
    Author     : Ardhi Surya Ibrahim; rdsurya147@gmail.com; insta:@rdcfc
--%>

<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    String proCode = request.getParameter("proCode");
    String catCode = request.getParameter("catCode");
    
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    
    try{
        RMIConnector rmi = new RMIConnector(); 
        String query = "Delete from opt_procedure where category_cd = '"+catCode+"' AND hfc_cd = '"+hfc_cd+"' and procedure_cd='"+proCode+"';";
        boolean isDelete = rmi.setQuerySQL(conn.HOST, conn.PORT, query);
        
        if(isDelete){
            out.print("success");
        }else{
            out.print("fail");
        }
    }
    catch(Exception e){
        System.out.println("OT delete procedure");
        e.printStackTrace();
        out.print("Oopps!");
    }
    
   
        
        
    
    
%>


