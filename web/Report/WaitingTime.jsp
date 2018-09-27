<%-- 
    Document   : WaitingTime
    Created on : Sep 27, 2018, 9:20:49 AM
    Author     : user
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <script src="../assets/js/jquery.min.js" type="text/javascript"></script>
        <script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="../assets/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/mystyles.css" rel="stylesheet" type="text/css"/>
        <%@include file = "../assets/header.html" %>
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

                            <h3 style="margin: 0px;"> Waiting Time Report </h3>
                            <hr class="pemisah" />

                            <div id="reportWaitingTimeMainDIV">
                            </div>

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
        <script src="../assets/js/create_destroy_loading.js" type="text/javascript"></script>


        <script>

            $("#reportWaitingTimeMainDIV").load("WaitingTimeMain.jsp");

        </script>


    </body>
</html>