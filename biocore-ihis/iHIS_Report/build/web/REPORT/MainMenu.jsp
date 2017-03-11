<%-- 
    Document   : MainMenu
    Created on : Feb 19, 2017, 12:01:30 AM
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


        <title>Report</title>
    </head>
    <body>
        <!--header -->
        <%@include file = "../assets/header.html" %>
        <!--header -->

        <div class="main" style="background: #f2f4f8;">
            <!-- menu top -->
            <%@ include file ="libraries/reportTopMenus.jsp" %>
            <!-- menu top -->
            <!-- side bar -->
            <%@ include file ="libraries/reportSideMenus.jsp" %>
            <!-- side bar -->

        </div>


        <div class="container">
            <h1>REPORT MAIN SCREEN</h1>

        </div>

    </body>
</html>


<script>

//    $("#test").load("libraries/reportSideMenus.jsp");
//    $("#head").load("libraries/reportHeader.jsp");
    //    $("#top").load("libraries/reportTopMenus.jsp");

</script>
