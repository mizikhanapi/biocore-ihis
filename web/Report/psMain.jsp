<%-- 
    Document   : psMain
    Created on : Apr 25, 2017, 3:01:42 AM
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <title>Print MC</title>
        <%@include file = "../assets/header.html" %>
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
                <div class="form-group">

                    <h3 style="text-align: center">Prescription Slip </h3>

                    <div id="SearchPatientdiv">
                    </div>

                    <div id="psTableDivision">
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>


<script>
    $(document).ready(function () {
        $("#SearchPatientdiv").load("searchPs.jsp");
        $("#dsTableDivision").load("psTable.jsp");

        $(document).ready(function () {
            $.ajax({
                type: "post",
                url: "psTable.jsp",
                timeout: 3000,
                success: function (returnHtml) {
                    //console.log(returnHtml);
                    $('#psTableDivision').html(returnHtml);

                }, error: function (jqXHR, textStatus, errorThrown) {

                    console.log("ERROR: " + errorThrown);
                }
            });
        });

    });
</script>
