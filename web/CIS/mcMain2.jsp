<%-- 
    Document   : mcMain2
    Created on : Apr 17, 2017, 3:16:21 PM
    Author     : user
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
        <%//@ include file ="libraries/reportSideMenus.jsp" %>
        <!-- side bar -->
        <div class="main" style="background: #f2ff4f8;"> 
            <!-- menu top -->
            <%//@ include file ="libraries/reportTopMenus.jsp" %>
            <!-- menu top -->
            <div class="container-fluid">
                <div class="row">

                    <div class="col-md-12">
                        <div class="thumbnail">
                            <h3 style="margin: 0px;">Print MC </h3>
                            <hr class="pemisah"/>
                            <div id="SearchPatientdiv">
                            </div>

                            <div id="mcTableDivision">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <script src="../assets/js/jquery-1.12.4.js" type="text/javascript"></script>
        <script src="../assets/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../assets/js/dataTables.buttons.min.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.flash.min.js" type="text/javascript"></script>
        <script src="../assets/js/jszip.min.js" type="text/javascript"></script>
        <script src="../assets/js/pdfmake.min.js" type="text/javascript"></script>
        <script src="../assets/js/vfs_fonts.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.html5.min.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.print.min.js" type="text/javascript"></script>

   
        <script>
            $(document).ready(function () {
                $("#SearchPatientdiv").load("searchMc.jsp");
                //$("#mcTableDivision").load("mcTable.jsp");

                $(document).ready(function () {
                    $.ajax({
                        type: "post",
                        url: "mcTable.jsp",
                        timeout: 3000,
                        success: function (returnHtml) {
                            //console.log(returnHtml);
                            $('#mcTableDivision1').html(returnHtml);

                        }, error: function (jqXHR, textStatus, errorThrown) {

                            console.log("ERROR: " + errorThrown);
                        }
                    });
                });

            });
        </script>
    </body>
</html>