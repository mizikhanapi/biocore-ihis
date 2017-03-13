<%-- 
    Document   : FullReport
    Created on : Feb 19, 2017, 12:49:19 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="/resourcesdemos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="js/jquery.js" type="text/javascript"></script>
        <script src="js/jquery.dataTables.js" type="text/javascript"></script>
        <%@include file = "../assets/header.html" %>


        <title> Full report </title>
    </head>
    <body>

        <div class="main" style="background: #f2ff4f8;"> 
            <!-- menu top -->
            <%@ include file ="libraries/reportTopMenus.jsp" %>
            <!-- menu top -->

            <!-- side bar -->
            <%@ include file ="libraries/reportSideMenus.jsp" %>
            <!-- side bar -->
        </div>

        <div class="container">
            <div class="row">

                <div id="searchFullReport">
                </div>

                <!--                    <div id="DiagnosisTable">
                                    </div>-->

            </div>
        </div>
    </body>
</html>

<script>
    $(document).ready(function () {
        $("#searchFullReport").load("searchFullReport.jsp");
        $("#DiagnosisTable").load("fullReportDiagnosisTable.jsp");

//        $(document).ready(function () {
//            $.ajax({
//                type: "post",
//                url: "fullReportDiagnosisTable.jsp",
//                timeout: 3000,
//                success: function (returnHtml) {
//                    //console.log(returnHtml);
//                    $('#DiagnosisTable').html(returnHtml);
//
//                }, error: function (jqXHR, textStatus, errorThrown) {
//
//                    console.log("ERROR: " + errorThrown);
//                }
//            });
//        });

    });
</script>