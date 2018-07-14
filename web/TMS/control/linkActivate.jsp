<%-- 
    Document   : linkActivate
    Created on : Apr 13, 2018, 8:33:15 PM
    Author     : user
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
            String token = request.getParameter("token");
            String[] data = token.split("l0l");

            if (data.length != 3) {
                out.print("<h3 style='color:red'>Invalid Link!<h3>");
                return;
            }

            Config.getBase_url(request);
            Config.getFile_url(session);
            
            String url="../register-tenant-manager.jsp";
            
            if("HIS-CARE".equals(data[2].trim())){
                url = "../../Entrance/Sign-in";
            }
            else if("JOMLAH".equals(data[2].trim())){
                url = "../../JOMLOKA/";
            }

            Conn con = new Conn();
            String query = "SELECT user_id FROM adm_users "
                    + "WHERE `HEALTH_FACILITY_CODE`='???' AND `STATUS`='link' AND `USER_ID`='" + data[1].trim() + "' AND `USER_TYPE`='TENANT' AND `USER_STATUS`='" + data[0].trim() + "' limit 1;";
            if (con.getData(query).size() < 1) {
                response.sendRedirect(url);
//                out.print("<h3 style='color:red'>Invalid Link!<h3>");
                return;
            }

            RMIConnector rmi = new RMIConnector();
            query = "Update adm_users set `STATUS`='0', `LOGIN_STATUS`='0' WHERE `USER_ID`='" + data[1].trim() + "';";
            boolean isUpdate = rmi.setQuerySQL(con.HOST, con.PORT, query);

            if (isUpdate) {
                response.sendRedirect(url);
            } else {
                out.print("<h3>Fail to activate account. Try again later.<h3>");
            }

        %>
    </body>
</html>