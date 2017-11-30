<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="Config.Config"%>
<%@page import="main.RMIConnector"%>
<%@ page session="true" %>
<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>
<%  String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String id = session.getAttribute("USER_ID").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


        <script src="old/assets/js/jquery.min.js"></script>
        <link rel="stylesheet" href="old/assets/css/loading.css">
        <link rel="stylesheet" href="../assets/css/mystyles.css">
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
        <div class="loading"></div>

        <%
            Conn conn = new Conn();
        %>


        <!-- header -->


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
                                                    List of Patient Discharge </a>
                                            </li>
                                            <li>
                                                <a href="#tab_default_2" data-toggle="tab">
                                                    Patient Discharge </a>
                                            </li>

                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_default_1">
                                                <div>
                                                    <div id="DischargeList">
                                                        <%@include file = "DischargeList.jsp" %>
                                                    </div>
                                                    </br>

                                                </div>
                                            </div>

                                            <div class="tab-pane" id="tab_default_2">
                                                <div>
                                                    <div  id="DischargePatient"> 
                                                        <%--  <%@include file = "DischargePatient.jsp" %> --%>
                                                        <%@include file="discharge/dischargeTab.jsp" %>
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

        <script src="PMS/libraries/lib/js/onKeyPress.js" type="text/javascript"></script>
        <script src="old/assets/js/onKeyPress.js" type="text/javascript"></script>
        <script src="../assets/js/create_destroy_loading.js" type="text/javascript"></script>
  

    </body>
</html>