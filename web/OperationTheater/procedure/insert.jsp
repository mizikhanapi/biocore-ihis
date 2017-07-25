<%-- 
    Document   : insert
    Created on : Jul 21, 2017, 10:14:30 PM
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
    String creator = (String) session.getAttribute("USER_ID");

    Conn conn = new Conn();

    try {
        String sqlCheck = "SELECT procedure_cd FROM opt_procedure where hfc_cd='"+hfc_cd+"' and category_cd='"+category_code+"' and procedure_cd='"+proCode+"' limit 1;";
        ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);

        if (duplicate.size() > 0) {

            out.print("duplicate");

        } else {
            String query = "INSERT INTO opt_procedure(hfc_cd, category_cd, procedure_cd, `procedure_shortName`, `procedure_longName`, quantity, buying_price, selling_price, created_by, created_date, status) "
                    + "VALUES('"+hfc_cd+"', '"+category_code+"', '"+proCode+"', '"+nameS+"', '"+nameL+"', '"+quantity+"', '"+buy+"', '"+sell+"', '"+creator+"', now(), '"+status+"');";
            RMIConnector rmi = new RMIConnector();
            boolean isInsert = rmi.setQuerySQL(conn.HOST, conn.PORT, query);

            if (isInsert) {
                out.print("success");

            } else {

                out.print("fail "+query);
            }

        }
    } 
    catch (Exception e) {
        System.out.println("OT procedure insert");
        e.printStackTrace();
        out.println("Opps!");
    }


%>