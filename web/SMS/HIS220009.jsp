<%-- 
    Document   : HIS220009
    Created on : Dec 12, 2017, 6:00:08 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>

<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>

<%    Config.getFile_url(session);
    Config.getBase_url(request);

    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- header -->
        <%@include file = "libraries/stockHeadLibrary.jsp" %>
        <%@include file = "../assets/header.html" %>
        <!-- header -->
    </head>

    <body>

        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->	
                <%@include file = "libraries/stockSideMenus.jsp" %>
                <!-- menu side -->	
                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file = "libraries/stockTopMenus.jsp" %>
                    <!-- menu top -->
                    <div class="row">
                        <div class="col-md-12">
                            <div  class="thumbnail">

                                <h3>Sales List For Stock</h3>
                                <hr class="pemisah"/>

                                <!-- Tab Menu -->
                                <div class="tabbable-panel">
                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs ">
                                            <li class="active">
                                                <a href="#tab_default_1" data-toggle="tab">
                                                    DAILY REPORT </a>
                                            </li>
                                            <li>
                                                <a href="#tab_default_2" data-toggle="tab">
                                                    MONTHLY REPORT </a>
                                            </li>
                                            <li>
                                                <a href="#tab_default_3" data-toggle="tab">
                                                    YEARLY REPORT </a>
                                            </li>
                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_default_1">

                                                <div id="contentRDaily">

                                                    <div id="contentReportDailyTable">
                                                    </div>

                                                </div>

                                            </div>
                                            <div class="tab-pane" id="tab_default_2">

                                                <div id="contentRMonthly">

                                                    <div id="contentReportMonthlyTable">
                                                    </div>

                                                </div>

                                            </div>
                                            <div class="tab-pane" id="tab_default_3">

                                                <div id="contentRYearly">

                                                    <div id="contentReportYearlyTable">
                                                    </div>

                                                </div>

                                            </div>

                                            <%@include file="contentReportSalesDetailModal.jsp" %>
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
        <%@include file = "libraries/stockFootLibrary.jsp" %>
        <!-- Placed at the end of the document so the pages load faster -->

        <script>


            $(document).ready(function () {

                //$('<div class="loading">Loading</div>').appendTo('body');

                $("#contentReportDailyTable").load("contentReportDailyTable.jsp");
                $("#contentReportMonthlyTable").load("contentReportMonthlyTable.jsp");
                $("#contentReportYearlyTable").load("contentReportYearlyTable.jsp");

            });


        </script>

    </body>

</html>