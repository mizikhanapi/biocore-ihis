<%-- 
    Document   : MainPage
    Created on : Nov 4, 2016, 4:07:05 PM
    Author     : Ahmed
--%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">   
        <title>Main Page</title>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <%@include file="../assets/header.html"%>
        <link rel="stylesheet" href="assets/css/loading.css">
        <link href="assets/datepicker/jquery-ui.css" rel="stylesheet">
        <link href="bootstrap-3.3.6-dist/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>


    </head>
    <body>


        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->		
                <%@include file = "libraries/sideMenus.jsp" %>
                <!-- menu side -->	

                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file = "libraries/topMenus.html" %>
                    <!-- menu top -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="thumbnail">
                                <h2>Receive Specimen</h2>
                                <hr/>
                                <div class="table-responsive" id='viewMTS'></div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>


        </div> 

        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/datepicker/jquery-ui.js"></script>
        <script src="assets/js/form-validator.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script> 
        <script src="assets/js/w3data.js"></script>
        <script src="assets/js/bootbox.min.js"></script>  
        <script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>
        <script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>
        <script src="bootstrap-3.3.6-dist/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script>
            function a()
            {
            <%
                try {
                    String error = request.getParameter("error");
                    if (error != null) {
            %>
                alert('<%=error%>');
                location.href = 'MainPage.jsp';
            <%
                    }
                } catch (Exception e) {
                }
            %>
            }
        </script>
        <script>
            w3IncludeHTML();

            $(document).ready(function () {
                //$("#WardOccupancy").load("WardOccupancy.jsp");
                $("#viewMTS").load("viewMTS.jsp");


                $("#headerindex").load("libraries/header.html");
                $("#topmenuindex").load("libraries/topMenus.html");
                $("#sidemenus").load("libraries/sideMenus.jsp");
//                $("#WardOccupancyTable").load("WardOccupancy-Table.jsp");

            });

        </script>
    </body>
</html>
