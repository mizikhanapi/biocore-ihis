<%-- 
    Document   : timeSlipMain2
    Created on : Apr 19, 2017, 1:42:43 PM
    Author     : user
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>
<%    Conn conn = new Conn();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Main Page</title>


        <script src="../assets/js/jquery.min.js"></script>
        <script src="../assets/js/jquery-ui.js" type="text/javascript"></script>
        <script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>

        <%@include file="../assets/header.html"%>
        <link href="../assets/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css"/>
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
                            <h3 style="margin: 0px;">Time Slip </h3>
                            <hr class="pemisah"/>

                            <div id="SearchPatientTCdiv">
                            </div>

                            <div id="tsTableDivision">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-1.12.4.js" type="text/javascript"></script>
        <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
        <script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
        <script src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js" type="text/javascript" language="javascript"></script>

        <script>
            $(document).ready(function () {
                $("#SearchPatientTCdiv").load("searchTs.jsp");
                $("#tsTableDivision").load("tsTable.jsp");

                $(document).ready(function () {
                    $.ajax({
                        type: "post",
                        url: "tsTable.jsp",
                        timeout: 3000,
                        success: function (returnHtml) {
                            //console.log(returnHtml);
                            $('#tsTableDivision').html(returnHtml);

                        }, error: function (jqXHR, textStatus, errorThrown) {

                            console.log("ERROR: " + errorThrown);
                        }
                    });
                });

            });
        </script>
    </body>
</html>

