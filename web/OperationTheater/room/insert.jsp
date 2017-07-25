<%-- 
    Document   : insert
    Created on : Jul 22, 2017, 6:28:48 AM
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
    String dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
    String subDis_cd = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
    
    Conn conn = new Conn();

    try {
        String sqlCheck = "SELECT room_no FROM opt_room where hfc_cd='"+hfc_cd+"' and room_no='"+code+"' limit 1;";
        ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);

        if (duplicate.size() > 0) {

            out.print("duplicate");

        } else {
            String query = "INSERT INTO opt_room(hfc_cd, discipline_cd, `subdiscipline_cd`, room_no, room_name, status) "
                    + "VALUES('"+hfc_cd+"', '"+dis_cd+"', '"+subDis_cd+"', '"+code+"', '"+name+"', '"+status+"');";
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
        System.out.println("OT room insert");
        e.printStackTrace();
        out.println("Opps!");
    }


%>
