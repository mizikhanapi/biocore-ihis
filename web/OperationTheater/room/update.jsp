<%-- 
    Document   : update
    Created on : Jul 22, 2017, 6:51:04 AM
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
       
        String query = "UPDATE opt_room set room_name='"+name+"' , status='"+status+"' WHERE room_no='"+code+"' and hfc_cd='"+hfc_cd+"';";
        RMIConnector rmi = new RMIConnector();
        boolean isInsert = rmi.setQuerySQL(conn.HOST, conn.PORT, query);

        if (isInsert) {
            out.print("success");

        } else {

            out.print("fail "+query);
        }

        
    } 
    catch (Exception e) {
        System.out.println("OT room update");
        e.printStackTrace();
        out.println("Opps!");
    }


%>

