<%-- 
    Document   : timeslip
    Created on : Feb 16, 2017, 5:04:53 AM
    Author     : user
--%>

<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.io.*"%> 
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String name = request.getParameter("name");
            String episode = request.getParameter("episode");
            String pmi = request.getParameter("pmi");

        %>
            <div class="col-md-12">
                <div class="form-group">
                    <label for=""> Name: <%=name%></label>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for=""> Episode Date: <%=episode%></label>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for=""> PMI No.: <%=pmi%></label>
                </div>
            </div>
        
    </body>
</html>
