<%-- 
    Document   : registerProcessRegisterUserActivate
    Created on : Jul 26, 2018, 1:10:58 PM
    Author     : Shammugam
--%>

<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Activation</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" type="image/png" href="../../assets/favicon.png"/>
    </head>
    <body>
        <%
            // Getting Parameter
            String token = request.getParameter("token");
            String[] data = token.split("<ShammugamRamasamySeperator>");            
            
            // Connection 
            Conn con = new Conn();
            
            String query = "SELECT user_id FROM adm_users "
                    + " WHERE health_facility_code='' AND status='link' AND user_id='" + data[1].trim() + "' AND "
                    + " user_type='JOMLOKA Customer' AND `USER_STATUS`='" + data[0].trim() + "' limit 1;";
            if (con.getData(query).size() < 1) {
                out.print("<h3 style='color:red'>Invalid Link!<h3>");
                return;
            }

            RMIConnector rmi = new RMIConnector();
            
            query = "Update adm_users SET status='0', login_status='0' WHERE user_id='" + data[1].trim() + "';";
            
            boolean isUpdate = rmi.setQuerySQL(con.HOST, con.PORT, query);

            // Status To Get As Return
            if (isUpdate) {
                out.print("<h3>Your account is activated. Have a good day !<h3>  <script> window.close(); </script> ");
            } else {
                out.print("<h3>Fail to activate account. Try again later.<h3>");
            }

        %>
    </body>
</html>