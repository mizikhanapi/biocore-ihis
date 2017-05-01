<%-- 
    Document   : mcMain2
    Created on : Apr 17, 2017, 3:16:21 PM
    Author     : user
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>
<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>
<%    Config.getBase_url(request);
    Config.getFile_url(session);
    Conn conn = new Conn();


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
        <title>Print MC</title>
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

    </body>
</html>


<script>
    $(document).ready(function () {
        $("#SearchPatientdiv").load("searchMc.jsp");
        $("#mcTableDivision").load("mcTable.jsp");

        $(document).ready(function () {
            $.ajax({
                type: "post",
                url: "mcTable.jsp",
                timeout: 3000,
                success: function (returnHtml) {
                    //console.log(returnHtml);
                    $('#mcTableDivision').html(returnHtml);

                }, error: function (jqXHR, textStatus, errorThrown) {

                    console.log("ERROR: " + errorThrown);
                }
            });
        });

    });
</script>
