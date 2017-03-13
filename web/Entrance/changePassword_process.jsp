<%-- 
    Document   : changePassword_process
    Created on : Mar 2, 2017, 4:15:34 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    String newPassword = request.getParameter("newPassword");
    String oldPassword = request.getParameter("oldPassword");
    String userID = session.getAttribute("USER_ID").toString();

    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();

    String sql = "SELECT password from adm_users WHERE user_id = '" + userID + "'";

    ArrayList<ArrayList<String>> dataPassword = conn.getData(sql);

    String pass = "";

    if (dataPassword.size() > 0) {
        pass = dataPassword.get(0).get(0);

        if (pass.equals(oldPassword)) {

            String sqlUpdate = "UPDATE adm_users set password = '" + newPassword + "' WHERE user_id = '" + userID + "'";

            boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);

            if (isUpdate) {

                out.print("success");

            } else {

                out.print("fail");

            }

        } else {

            out.print("Old password is wrong");

        }

    } else {

        out.print("User not found");

    }


%>
