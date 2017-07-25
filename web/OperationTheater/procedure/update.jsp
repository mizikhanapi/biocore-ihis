<%-- 
    Document   : update
    Created on : Jul 21, 2017, 10:44:00 PM
    Author     : Ardhi Surya Ibrahim; rdsurya147@gmail.com; insta:@rdcfc
--%>

<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String category_code = request.getParameter("category_code");
    String proCode = request.getParameter("proCode");
    String nameS = request.getParameter("nameS");
    String nameL = request.getParameter("nameL");
    String buy = request.getParameter("buy");
    String sell = request.getParameter("sell");
    String quantity = request.getParameter("quantity");
    String status = request.getParameter("status");

    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    
    Conn conn = new Conn();

    try {
        
        String query = "Update opt_procedure set `procedure_shortName`='"+nameS+"', `procedure_longName`='"+nameL+"', quantity='"+quantity+"', "
                + "buying_price='"+buy+"', selling_price='"+sell+"', status='"+status+"' "
                + "WHERE hfc_cd='"+hfc_cd+"' and category_cd='"+category_code+"' and procedure_cd='"+proCode+"';";
                
        RMIConnector rmi = new RMIConnector();
        boolean isInsert = rmi.setQuerySQL(conn.HOST, conn.PORT, query);

        if (isInsert) {
            out.print("success");

        } else {

            out.print("fail "+query);
        }

        
    } 
    catch (Exception e) {
        System.out.println("OT procedure update");
        e.printStackTrace();
        out.println("Opps!");
    }


%>
