<%-- 
    Document   : index
    Created on : Jul 20, 2017, 9:43:23 AM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="main.RMIConnector"%>
<%@include file="../Entrance/validateSession.jsp" %>
<%--<%@include file="validateModuleAccess.jsp" %>--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
<script src="libraries/jquery-3.1.1.min.js"></script>

        <%@include file="../assets/header.html" %>
        <%@include file="libraries/headLibrary.jsp" %>


    </head>

    <body>
        <div class="loading"></div>

        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->		
                <%@include file="libraries/sideMenus.jsp" %>
                <!-- menu side -->	

                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file="libraries/topMenus.jsp" %>
                    <!-- menu top -->
                                       
                    <div class="row">
                        <div class="col-md-12">
                            <div class="thumbnail">
                                <h3 style="margin: 0px;">Queue Report</h3>
                                <hr class="pemisah" />

                                <!-- Tab Menu -->

                                <div class="tabbable-panel">
                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs ">
                                            
                                            <li class="active">
                                                <a href="#tab_default_1" data-toggle="tab">
                                                    List of Queue </a>
                                            </li>
                                            <li>
                                                <a href="#tab_default_2" data-toggle="tab">
                                                    Queue Occupancy </a>
                                            </li>
                                            
                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                           
                                            <div class="tab-pane active" id="tab_default_1">
                                                <div id="RQL_main"></div>
                                                <div id="RQL_table" class="table-guling"></div>
                                            </div>
                                            
                                            <div class="tab-pane" id="tab_default_2">
                                                <div id="RQO_main"></div>
                                                <div id="RQO_table" class="table-guling"></div>
                                            </div>
                                           
                                        </div>
                                        <!-- end of tab content -->
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


        
        <%@include file="libraries/footLibrary.jsp" %>

        <script>
            $('#RQL_main').load('report/queue_list_report_main.jsp');
            //$('#RQL_table').load('report/queue_list_table.jsp');
            
            $('#RQO_main').load('report/queue_occupancy_report_main.jsp');

        </script>

    </body></html>
