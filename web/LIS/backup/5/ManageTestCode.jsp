<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@ page session="true" %>
<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Main Page</title>
        <%@include file="../assets/header.html"%>

        <link href="bootstrap-3.3.6-dist/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" href="assets/css/loading.css">
        <link href="assets/datepicker/jquery-ui.css" rel="stylesheet"> 

    </head>

    <body>
        <div class="container-fluid">
            <div class="row"> 
                <!-- menu side -->		
                <%@include file = "libraries/sideMenus.jsp" %>
                <!-- menu side --> 

                <!-- main -->
                <div class="main" style="background: #f2f4f8;" >
                    <!-- menu top -->
                    <%@include file = "libraries/topMenus.html" %>
                    <!-- menu top -->

                    <div class="row" >
                        <div class="col-md-12" >
                            <div class="thumbnail">    
                                <div class="tabbable-line" id="navDiv">
                                    <ul class="nav nav-tabs" id="ulTabs">
                                        <li class="active"> <a href="#tab_default_1" data-toggle="tab" >Maintain Test Category</a> </li>
                                        <li> <a href="#tab_default_2" data-toggle="tab"> Maintain Test Detail </a> </li>
                                    </ul>
                                </div>
                                <!-- Tab Menu -->

                                <div class="tabbable-panel">
                                    <div class="tabbable-line">
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <!--
                                                search and registation tab
                                            -->
                                            <div class="tab-pane active" id="tab_default_1">
                                                <div id="MaintainTestCategory"></div>
                                            </div>

                                            <!--
                                                PMI master index  tab
                                            -->
                                            <div class="tab-pane" id="tab_default_2">
                                                <div id="MaintainTestDetail"></div>
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
            <!-- main --> 
        </div>
                           
        <script src="../assets/js/jquery.min.js" type="text/javascript"></script>
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
            var patientDOM = [];

            //load page to the div
            $("#headerindex").load("libraries/header.html");
            $("#topmenuindex").load("libraries/topMenus.html");
            $("#MaintainTestCategory").load("Maintain_test_Category.jsp");
            $("#MaintainTestDetail").load("Maintain_Test_Detail.jsp");

            //w3IncludeHTML();
        </script>
    </body>
</html>