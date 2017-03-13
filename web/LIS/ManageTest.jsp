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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">   
        <title>Main Page</title>
         <%@include file="../assets/header.html"%>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="assets/js/jquery.min.js"></script>
        <!-- Custom styles for this template -->
        <link rel="stylesheet" href="assets/css/loading.css">
        <link href="assets/datepicker/jquery-ui.css" rel="stylesheet">    
        <link href="assets/datepicker/jquery-ui.css" rel="stylesheet">
        <script src="assets/datepicker/jquery-ui.js"></script>
        <script src="assets/js/form-validator.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script> 
        <script src="assets/js/w3data.js"></script>
        <script src="assets/js/bootbox.min.js"></script>  
        
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
                <div class="row" >
                    <div class="col-md-12" >
                        <div class="tabbable-line" id="navDiv">
                            <ul class="nav nav-tabs" id="ulTabs">
                                <li class="active"> <a href="#tab_default_1" data-toggle="tab" >Verify Specimen For Test</a> </li>
                                <li> <a href="#tab_default_2" data-toggle="tab"> Verify Test Result </a> </li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-md-12">
                        <div class="thumbnail">


                            <!-- Tab Menu -->

                            <div class="tabbable-panel">
                                <div class="tabbable-line">
                                    
                                    <!-- tab content -->
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="tab_default_1">
                                            <div class="table-responsive" id='viewMT'></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Tab Menu -->

                        </div>
                    </div>
                </div>

            </div>

        </div>
              
            
             </div> 
       
        <script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>
        
         <script>
        w3IncludeHTML();

        $(document).ready(function () {
            //$("#WardOccupancy").load("WardOccupancy.jsp");
            $("#viewMT").load("viewMT.jsp");
            
            $("#headerindex").load("libraries/header.html");
            $("#topmenuindex").load("libraries/topMenus.html");
            $("#sidemenus").load("libraries/sideMenus.jsp");
//                $("#WardOccupancyTable").load("WardOccupancy-Table.jsp");

        });

    </script>
    <script>
                        function a() 
                        {
                            <%
                            try
                            {
                                String error = request.getParameter("error");
                                if (error != null) 
                                {
                                    %>
                                    alert('<%=error %>');
                                    location.href = 'MainPage.jsp';
                                    <%
                                }
                            } 
                            catch (Exception e) 
                            {
                            }
                            %>
                        }
                    </script>
    </body>
</html>




