<%-- 
    Document   : fullReportDiagnosis
    Created on : Feb 27, 2017, 12:08:31 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <!-- date picker -->

        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <title> Full report </title>
    </head>
    <body>
        <!-- nav side bar -->
        <div id="head"></div>
        <div id="top"></div>	
        <div id="test"></div>
        <!-- nav side bar -->

        <div class='container'>
            <div class='row'>

                <h1 style='text-align: center'> Diagnosis </h1>

                <div id="DiagnosisTableDiv">

                </div>

                </br></br>
            </div>
        </div>
    </body>
</html>

<script>
    $(document).ready(function () {

        $("#DiagnosisTableDiv").load("fullReportDiagnosisTable.jsp");

        $(document).ready(function () {
            $.ajax({
                type: "post",
                url: "fullReportDiagnosisTable.jsp",
                timeout: 3000,
                success: function (returnHtml) {
                    //console.log(returnHtml);
                    $('#DiagnosisTableDiv').html(returnHtml);

                }, error: function (jqXHR, textStatus, errorThrown) {

                    console.log("ERROR: " + errorThrown);
                }
            });
        });

    });
</script>


<script>

    $("#test").load("libraries/reportSideMenus.jsp");
    $("#head").load("libraries/reportHeader.jsp");
    $("#top").load("libraries/reportTopMenus.jsp");


</script>
