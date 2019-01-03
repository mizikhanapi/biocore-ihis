<%-- 
    Document   : HIS040012
    Created on : Aug 19, 2017, 2:47:43 AM
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
                    <div class="row">
                        <div class="col-md-12">
                            <div class="thumbnail">

                                <h3 style="margin: 0px;">List Of Incomplete Order</h3>
                                <hr class="pemisah" />

                                <div id="contentReportIncompleteOrderList">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- main -->		
        </div>


        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file = "libraries/pharmacyFootLibrary.jsp" %>
        <!-- Placed at the end of the document so the pages load faster -->

        <script>

            $(document).ready(function () {
                $('#PISPage8').removeClass('collapsed');
                $('#PISPage8').attr('aria-expanded', true);
                //report submenu
                $('#Report').addClass('in');
                $('#Report').attr('aria-expanded', true);
                $('#PISPage8R6').addClass('active');
                $('<div class="loading">Loading</div>').appendTo('body');
                $("#contentReportIncompleteOrderList").load("manageReportIncompleteOrderListTable.jsp");


            });

        </script>

    </body>

</html>