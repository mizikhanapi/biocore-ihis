<%-- 
    Document   : HIS040003
    Created on : May 9, 2017, 6:02:28 PM
    Author     : Shammugam
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>

<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>

<%    Config.getFile_url(session);
    Config.getBase_url(request);
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- header -->
        <%@include file = "libraries/pharmacyHeadLibrary.jsp" %>
        <%@include file = "../assets/header.html" %>
        <!-- header -->
    </head>

    <body>
        <input value="<%=leModuleCode%>" id="mainModuleCodeForGeberalPagesUsage" type="hidden">
        <div class="container-fluid">
            <div class="row">       

                <!-- menu side -->		
                <%@include file = "libraries/pharmacySideMenus.jsp" %>
                <!-- menu side -->	

                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">

                    <!-- menu top -->
                    <%@include file = "libraries/pharmacyTopMenus.jsp" %>
                    <!-- menu top -->

                    <%@include file = "../GNL/manageStockQuantity/manageStockQuantityMainPage.jsp" %>

                </div>
                <!-- main -->		

            </div>
        </div>




        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file = "libraries/pharmacyFootLibrary.jsp" %>
        <!-- Placed at the end of the document so the pages load faster -->


    </body>

</html>