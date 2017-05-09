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
        <script src="assets/js/jquery.min.js"></script>
        <%@include file="../assets/header.html"%>

        <link href="bootstrap-3.3.6-dist/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" href="assets/css/loading.css">
        <link href="assets/datepicker/jquery-ui.css" rel="stylesheet"> 
    </head>

    <body>
        <div class="loading"></div>
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
                                        <li class="active"> 
                                            <a href="#tab_default_1" data-toggle="tab" >ORDER LIST</a>
                                        </li>
                                        <li> 
                                            <a href="#tab_default_2" data-toggle="tab">ORDER DETAIL</a> 
                                        </li>
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
                                                <div id="OrderMaster"></div>
                                            </div>

                                            <!--
                                                PMI master index  tab
                                            -->
                                            <div class="tab-pane" id="tab_default_2">
                                                <div id="OrderDetail"></div>
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

            //$('<div class="loading">Loading</div>').appendTo('body');

            $("#OrderMaster").load("OrderMaster1.jsp");
            $("#OrderDetail").load("OrderDetail1.jsp");

        </script>
    </body>
</html>