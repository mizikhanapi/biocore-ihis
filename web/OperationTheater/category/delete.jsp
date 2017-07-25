<%-- 
    Document   : delete
    Created on : Jul 20, 2017, 5:45:07 PM
    Author     : Ardhi Surya Ibrahim; rdsurya147@gmail.com; insta:@rdcfc
--%>

<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    String code = request.getParameter("code");
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    
    try{
        String sqlCheck = "Select procedure_cd from opt_procedure where category_cd='"+code+"' and hfc_cd='"+hfc_cd+"' limit 1;";
        ArrayList<ArrayList<String>> looked = conn.getData(sqlCheck);

        if(looked.size() > 0){
            out.print("no");

        }else{
            RMIConnector rmi = new RMIConnector(); 
            String query = "Delete from opt_procedure_category where category_cd = '"+code+"' AND hfc_cd = '"+hfc_cd+"'";
            boolean isDelete = rmi.setQuerySQL(conn.HOST, conn.PORT, query);

            if(isDelete){
                out.print("success");
            }else{
                out.print("fail");
            }


        }
    
    }
    catch(Exception e){
        System.out.println("OT delete category");
        e.printStackTrace();
        out.print("Oopps!");
    }
    
    
%>

