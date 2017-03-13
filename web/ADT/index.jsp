<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="old/assets/datepicker/jquery-ui.css">
        <script src="old/assets/js/jquery.min.js"></script>
        <!-- Custom styles for this template -->
        
        <link rel="stylesheet" href="old/assets/css/loading.css">
        <link href="old/assets/datepicker/jquery-ui.css" rel="stylesheet">    
        <script src="old/assets/datepicker/jquery-ui.js"></script>
        <script src="old/assets/js/form-validator.min.js"></script>
        <script src="old/assets/js/bootstrap.min.js"></script> 
        <script src="old/assets/js/w3data.js"></script>
        <script src="old/assets/js/bootbox.min.js"></script>   
       
        <!-- header -->
        <%@include file = "../assets/header.html" %>
    
        <!-- header -->
    </head>

    <body>
        <%
            String hfc = "04010101";
            String dataSystemStatus = "1";
            session.setAttribute("HFC", hfc);
            session.setAttribute("SYSTEMSTAT", dataSystemStatus);
            Config.getFile_url(session);
            Config.getBase_url(request);
            Conn conn = new Conn();

            //out.println("--------------------------------------------------------------------ipcall: " + conn.getIpCall() + " ");
            //out.println(Config.getFile_url(session));
%>


        <!-- menu
    
        -->    <div class="container-fluid">
            <div class="row"> <!--
                <!-- menu side -->
                <%@include file = "libraries/sideMenus.jsp" %>
                <!-- menu side --> 
               
                    
                <!-- main -->
                <div class="main" style="background: #f2f4f8;">

                    <!-- menu top -->
                    <%@include file = "libraries/topMenus.html" %>
                    <!-- menu top -->

                </div>

                <!-- main --> 
                <div>
                    welcome
                    <h4>Maintain Ward/Facility ID</h4>


                </div>
            </div>
        </div>


        <!-- Bootstrap core JavaScript
            ================================================== --> 
        <!-- Placed at the end of the document so the pages load faster --> 
        <!-- Bootstrap core JavaScript
            ================================================== --> 
        <!-- Placed at the end of the document so the pages load faster --> 
        <!--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
            <script src="http://www.w3schools.com/lib/w3data.js"></script> -->


        <script>
            var patientDOM = [];

            //load page to the div
            //$("#headerindex").load("libraries/header.html");
            //$("#topmenuindex").load("libraries/topMenus.html");
//            $("#maintainWardCode").load("MaintainWard.jsp");
//            $("#inpatientRegistration").load("registrationV2.jsp");
//            $("#wardOccupancy").load("WardOccupancy.jsp");
//            $("#patientTransfer").load("PatientTransfer.jsp");
            //$("#sidemenus").load("libraries/sideMenus.jsp");
            w3IncludeHTML();
        </script>


    </body>
</html>