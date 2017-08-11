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
                                                    Maintain Ward/ facility type </a>
                                            </li>
                                            <li>
                                                <a href="#tab_default_2" data-toggle="tab">
                                                    Maintain Ward/ facility ID </a>
                                            </li>
                                            <li>
                                                <a href="#tab_default_3" data-toggle="tab">
                                                    Assign bed to ward </a>
                                            </li>
                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_default_1">
                                                <div>
                                                    <div id="FacilityTypeMain">
                                                        <%@include file = "facility-type.jsp" %>
                                                    </div>
                                                    <div  id="FacilityTypeTable">
                                                        <%@include file = "facilityType-Table.jsp" %>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="tab_default_2">
                                                <div>
                                                    <div  id="FacilityIDMain"> 
                                                        <%@include file = "facility-id.jsp" %>
                                                    </div>

                                                    <div id="FacilityIDTable"> 
                                                        <%@include file = "facilityID-Table.jsp" %>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="tab-pane" id="tab_default_3">

                                                <div>
                                                    <div id="AssignBed">  <%@include file = "assign-bed-to-ward.jsp" %>
                                                    </div>
                                                    <div id="AssignBedTable">  
                                                        <%@include file = "assign-bed-to-ward-table.jsp" %>
                                                    </div>
                                                </div>    
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
        <script src="ReportLibraries/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="ReportLibraries/js/bootbox.min.js" type="text/javascript"></script>
        <script src="ReportLibraries/js/jquery.dataTables.min.js"></script>
        <script src="ReportLibraries/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="ReportLibraries/js/dataTables.buttons.min.js" type="text/javascript"></script>
        <script src="ReportLibraries/js/buttons.flash.min.js" type="text/javascript"></script>
        <script src="ReportLibraries/js/jszip.min.js" type="text/javascript"></script>
        <script src="ReportLibraries/js/pdfmake.min.js" type="text/javascript"></script>
        <script src="ReportLibraries/js/vfs_fonts.js" type="text/javascript"></script>
        <script src="ReportLibraries/js/buttons.html5.min.js" type="text/javascript"></script>
        <script src="ReportLibraries/js/buttons.print.min.js" type="text/javascript"></script>
        <script src="ReportLibraries/js/buttons.colVis.min.js" type="text/javascript"></script>
        <script src="ReportLibraries/js/papaparse.min.js"></script>
        <script src="ReportLibraries/js/jquery.multi-select.js" type="text/javascript"></script>
        <!-- Script Goes Here -->
    </body>
</html>

<script type="text/javascript">
    $(document).ready(function () {



    });
            </script