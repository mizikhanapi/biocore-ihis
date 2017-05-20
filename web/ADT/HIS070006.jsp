<%-- 
    Document   : manageReport
    Created on : Feb 27, 2017, 11:36:51 AM
    Author     : Shammugam
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>

<%
    Config.getFile_url(session);
    Config.getBase_url(request);

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


        <script src="old/assets/js/jquery.min.js"></script>
        <link rel="stylesheet" href="old/assets/css/loading.css">
        <link href="old/assets/datepicker/jquery-ui.css" rel="stylesheet">    
        <script src="old/assets/js/form-validator.min.js"></script>
        <script src="old/assets/js/bootstrap.min.js"></script> 
        <script src="old/assets/js/bootbox.min.js"></script>
        <script src="old/assets/datepicker/jquery-ui.js"></script>
        <script src="old/assets/js/searchDisipline.js" type="text/javascript"></script>
        <script src="../PMS/libraries/lib/js/search/searchDisipline.js" type="text/javascript"></script>
        <script src="old/assets/js/WardMain.js" type="text/javascript"></script>
        <script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>
        <!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>-->
        <!--        <script type="text/javascript" src="../javascript.js"></script>-->
        <script src="old/assets/js/OccuPatient.js" type="text/javascript"></script>
        <script src="old/assets/js/onKeyPress.js" type="text/javascript"></script>
        <script src="old/assets/js/IPMain.js" type="text/javascript"></script>
        <script src="old/assets/js/onKeyPress.js" type="text/javascript"></script>

        <!-- header -->
        <%@include file = "../assets/header.html" %>

        <!-- header -->
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
                        <div class="col-md-12" style="height: 100%;">
                            <div class="thumbnail">

                                <!-- Tab Menu -->
                                <div class="tabbable-panel">
                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs ">
                                            <li class="active">
                                                <a href="#tab_default_1" data-toggle="tab">
                                                    List Of Admission Per Day </a>
                                            </li>
                                            <li>
                                                <a href="#tab_default_2" data-toggle="tab">
                                                    List Of Discharge Per Day  </a>
                                            </li>
                                            
                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_default_1">

                                                <div id="contentAdmit">

                                                    <div id="contentAdmitTable">
                                                    </div>
                                                    <div id="contentReportDailyButton">
                                                    </div>

                                                </div>

                                            </div>
                                            <div class="tab-pane" id="tab_default_2">

                                                <div id="contentDischarge">

                                                    <div id="contentDischargeTable">
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

        <!-- Placed at the end of the document so the pages load faster -->
      
        <!-- Placed at the end of the document so the pages load faster -->

        <script>

            $('<div class="loading">Loading</div>').appendTo('body');

            $(document).ready(function () {
                $("#contentAdmitTable").load("PatientAdmitTable.jsp");
                $("#contentDischarge").load("PatientDischargeTable.jsp");
                //$("#contentReportYearlyTable").load("manageReportYearlyTable.jsp");
            });

        </script>

    </body>

</html>