<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="Config.Config"%>
<%@page import="main.RMIConnector"%>
<%@ page session="true" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- header -->
        <%@include file = "../assets/header.html" %>
        <link rel="stylesheet" href="old/assets/datepicker/jquery-ui.css">
        <link rel="stylesheet" href="old/assets/css/loading.css">
        <link href="old/assets/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="old/assets/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="old/assets/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <!-- header -->
        <script src="old/assets/js/jquery.min.js"></script>
    </head>

    <body>
        <div class="loading"></div>
        <%//            Config.getFile_url(session);
//            Config.getBase_url(request);
            Conn conn = new Conn();

        %>
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

                                <!-- Tab Menu -->
                                <div class="tabbable-panel">
                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs ">
                                            <li class="active">
                                                <a href="#tab_default_1" data-toggle="tab">
                                                    Maintain Hospital Charges </a>
                                            </li>


                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_default_1">
                                                <div>
                                                    <div  id="FacilityIDMain"> 
                                                        <%@include file = "hospitalCharges.jsp" %>
                                                    </div>

                                                    <div id="FacilityIDTable"> 
                                                        <%@include file = "hospitalCharges-Table.jsp" %>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="tab_default_2">


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

        <!-- Script Goes Here -->

        <script src="old/assets/datepicker/jquery-ui.js"></script>
        <script src="old/assets/js/form-validator.min.js"></script>
        <script src="old/assets/js/bootbox.min.js"></script>
        <script src="old/assets/js/dataTables.bootstrap.min.js"></script>
                   <script src="PMS/libraries/lib/js/onKeyPress.js" type="text/javascript"></script>
                    <script src="old/assets/js/onKeyPress.js" type="text/javascript"></script>
        <!-- Script Goes Here -->
    </body>
</html>