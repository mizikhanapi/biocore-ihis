<%-- 
    Document   : insert
    Created on : Jul 20, 2017, 4:17:07 PM
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
    String creator = (String) session.getAttribute("USER_ID");

    Conn conn = new Conn();

    try {
        String sqlCheck = "SELECT category_cd FROM opt_procedure_category where hfc_cd='"+hfc_cd+"' and category_cd='"+code+"' limit 1;";
        ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);

        if (duplicate.size() > 0) {

            out.print("duplicate");

        } else {
            String query = "INSERT INTO opt_procedure_category(hfc_cd, category_cd, category_name, status, created_by, created_date) "
                    + "VALUES('"+hfc_cd+"', '"+code+"', '"+name+"', '"+status+"', '"+creator+"', now());";
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
        System.out.println("OT category insert");
        e.printStackTrace();
        out.println("Opps!");
    }


%>