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
        <!-- header -->
        <%@include file = "libraries/pharmacyHeadLibrary.jsp" %>
        <%@include file = "../assets/header.html" %>
        <!-- header -->
    </head>


    <style>
        /* Absolute Center Spinner */
        .loading {
            position: fixed;
            z-index: 999;
            height: 2em;
            width: 2em;
            overflow: show;
            margin: auto;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
        }

        /* Transparent Overlay */
        .loading:before {
            content: '';
            display: block;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.3);
        }

        /* :not(:required) hides these rules from IE9 and below */
        .loading:not(:required) {
            /* hide "loading..." text */
            font: 0/0 a;
            color: transparent;
            text-shadow: none;
            background-color: transparent;
            border: 0;
        }

        .loading:not(:required):after {
            content: '';
            display: block;
            font-size: 10px;
            width: 1em;
            height: 1em;
            margin-top: -0.5em;
            -webkit-animation: spinner 1500ms infinite linear;
            -moz-animation: spinner 1500ms infinite linear;
            -ms-animation: spinner 1500ms infinite linear;
            -o-animation: spinner 1500ms infinite linear;
            animation: spinner 1500ms infinite linear;
            border-radius: 0.5em;
            -webkit-box-shadow: rgba(0, 0, 0, 0.75) 1.5em 0 0 0, rgba(0, 0, 0, 0.75) 1.1em 1.1em 0 0, rgba(0, 0, 0, 0.75) 0 1.5em 0 0, rgba(0, 0, 0, 0.75) -1.1em 1.1em 0 0, rgba(0, 0, 0, 0.5) -1.5em 0 0 0, rgba(0, 0, 0, 0.5) -1.1em -1.1em 0 0, rgba(0, 0, 0, 0.75) 0 -1.5em 0 0, rgba(0, 0, 0, 0.75) 1.1em -1.1em 0 0;
            box-shadow: rgba(0, 0, 0, 0.75) 1.5em 0 0 0, rgba(0, 0, 0, 0.75) 1.1em 1.1em 0 0, rgba(0, 0, 0, 0.75) 0 1.5em 0 0, rgba(0, 0, 0, 0.75) -1.1em 1.1em 0 0, rgba(0, 0, 0, 0.75) -1.5em 0 0 0, rgba(0, 0, 0, 0.75) -1.1em -1.1em 0 0, rgba(0, 0, 0, 0.75) 0 -1.5em 0 0, rgba(0, 0, 0, 0.75) 1.1em -1.1em 0 0;
        }

        /* Animation */

        @-webkit-keyframes spinner {
            0% {
                -webkit-transform: rotate(0deg);
                -moz-transform: rotate(0deg);
                -ms-transform: rotate(0deg);
                -o-transform: rotate(0deg);
                transform: rotate(0deg);
            }
            100% {
                -webkit-transform: rotate(360deg);
                -moz-transform: rotate(360deg);
                -ms-transform: rotate(360deg);
                -o-transform: rotate(360deg);
                transform: rotate(360deg);
            }
        }

    </style>


    <body>

        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->	
                <%@include file = "libraries/pharmacySideMenus.jsp" %>
                <!-- menu side -->
                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file = "libraries/pharmacyTopMenus.jsp" %>
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
                                                    <div id="contentReportDailyButton">
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
        <%@include file = "libraries/pharmacyFootLibrary.jsp" %>
        <!-- Placed at the end of the document so the pages load faster -->

        <script>

            $('<div class="loading">Loading</div>').appendTo('body');

            $(document).ready(function () {
                $("#contentReportDailyTable").load("manageReportDailyTable.jsp");
                $("#contentReportMonthlyTable").load("manageReportMonthlyTable.jsp");
                $("#contentReportYearlyTable").load("manageReportYearlyTable.jsp");
            });

        </script>

    </body>

</html>