<%-- 
    Document   : tsMain
    Created on : Nov 1, 2018, 3:14:58 AM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>
<%    //Config.getBase_url(request);
    //Config.getFile_url(session);
    Conn conn = new Conn();


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Sick Leave</title>


        <%@include file="../assets/header.html"%>

        <script src="../assets/js/jquery.min.js"></script>
        <script src="../assets/js/jquery-ui.js" type="text/javascript"></script>
        <script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="../assets/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../assets/js/highcharts.js" type="text/javascript"></script>
        <script src="../assets/js/highcharts-exporting.js" type="text/javascript"></script>


    </head>
    <body>
        <!-- side bar -->
        <%@ include file ="libraries/reportSideMenus.jsp" %>
        <!-- side bar -->
        <div class="main" style="background: #f2ff4f8;"> 
            <!-- menu top -->
            <%@ include file ="libraries/reportTopMenus.jsp" %>
            <!-- menu top -->
            <div class="container-fluid">
                <div class="row">

                    <div class="col-md-12">
                        <div class="thumbnail">

                            <h3 style="margin: 0px;">Print Time Slip </h3>

                            <hr class="pemisah"/>

                            <div id="SearchPatientTSDiv">
                            </div>

                            <div id="tsTableDivisionDiv">
                            </div>

                            <%@include file = "tsModal.jsp" %>

                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script src="../assets/js/jquery-ui.js" type="text/javascript"></script>
        <script src="../assets/js/bootbox.min.js" type="text/javascript"></script>
        <script src="../assets/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../assets/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="../assets/js/dataTables.buttons.min.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.flash.min.js" type="text/javascript"></script>
        <script src="../assets/js/jszip.min.js" type="text/javascript"></script>
        <script src="../assets/js/pdfmake.min.js" type="text/javascript"></script>
        <script src="../assets/js/vfs_fonts.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.html5.min.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.print.min.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.colVis.min.js" type="text/javascript"></script>


        <script>
            $(document).ready(function () {
                $("#SearchPatientTSDiv").load("tsSearch.jsp");
            });
        </script>
    </body>
</html>