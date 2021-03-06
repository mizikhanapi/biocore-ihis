<%-- 
    Document   : HIS050008
    Created on : Jan 30, 2018, 7:03:49 PM
    Author     : Shammugam
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>

<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iHIS | LIS</title>
        <!-- header -->
        <%@include file = "libraries/labHeadLibrary.jsp" %>
        <%@include file = "../assets/header.html" %>
    </head>



    <body>
        <div class="container-fluid">
            <div class="row">
                <!-- menu side -->		
                <%@include file = "libraries/sideMenus.jsp" %>
                <!-- menu side -->
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file = "libraries/topMenus.jsp" %>
                    <!-- menu top -->
                    <div class="row">

                        <div class="col-md-12">
                            <div class="thumbnail">

                                <h3 style="margin: 0px;">List Of Test Code</h3>
                                <hr class="pemisah" />
                                <div id="ReportItemListMain">
                                </div>
                                <hr class="pemisah" />
                                <div id="ReportItemListTable">
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>


        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file = "libraries/labFootLibrary.jsp" %>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="libraries/js/jquery.check-file.js" type="text/javascript"></script>


        <script>

             //report main head
            $('#LISPageSeventh').removeClass('collapsed'); 
            $('#LISPageSeventh').attr('aria-expanded', true);
            //report submenu
            $('#Report').addClass('in');
            $('#Report').attr('aria-expanded', true);
            $('#LISPageSeventhR2').addClass('active');

            $('<div class="loading">Loading</div>').appendTo('body');

            $("#ReportItemListMain").load("manageReportItemCodeListMain.jsp");
            $("#ReportItemListTable").load("manageReportItemCodeListTable.jsp");


        </script>

    </body>
</html>
