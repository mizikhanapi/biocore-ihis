<%-- 
    Document   : update
    Created on : Jul 20, 2017, 5:19:47 PM
    Author     : user
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

    try {
       
        String query = "UPDATE opt_procedure_category set category_name='"+name+"' , status='"+status+"' WHERE category_cd='"+code+"' and hfc_cd='"+hfc_cd+"';";
        RMIConnector rmi = new RMIConnector();
        boolean isInsert = rmi.setQuerySQL(conn.HOST, conn.PORT, query);

        if (isInsert) {
            out.print("success");

        } else {

            out.print("fail "+query);
        }

        
    } 
    catch (Exception e) {
        System.out.println("OT category update");
        e.printStackTrace();
        out.println("Opps!");
    }


%>
