<%-- 
    Document   : index
    Created on : Jul 20, 2017, 9:43:23 AM
    Author     : -D-
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
        <!-- header -->
<!--        <link href="datepicker/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="bootstrap-3.3.6-dist/css/dataTables.bootstrap.min.css">
        <link href="../assets/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>-->
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
                    <input id="hfcCODE" name="hfcCODE" type="hidden" value="<%=session.getAttribute("HEALTH_FACILITY_CODE").toString()%>">
                    <input id="tQMS_GLOBAL_HFC_CODE" name="hfcCODE" type="hidden" value="<%=session.getAttribute("HEALTH_FACILITY_CODE").toString()%>">
                    <input id="tQMS_GLOBAL_DISCIPLINE_CODE" name="hfcCODE" type="hidden" value="<%=session.getAttribute("DISCIPLINE_CODE").toString()%>">
                    <input id="tQMS_GLOBAL_SUB_DISCIPLINE_CODE" name="hfcCODE" type="hidden" value="<%=session.getAttribute("SUB_DISCIPLINE_CODE").toString()%>">
                   
                    <div class="row">
                        <div class="col-md-12">
                            <div class="thumbnail">
                                <h3 style="margin: 0px;">Queue Maintenance</h3>
                                <hr class="pemisah" />

                                <!-- Tab Menu -->

                                <div class="tabbable-panel">
                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs ">
                                            <!--                                            <li class="active">
                                                                                            <a href="#tab_default_1" data-toggle="tab">
                                                                                                Maintain Queue Type </a>
                                                                                        </li>-->
                                            <li >
                                                <a href="#tab_default_2" data-toggle="tab">
                                                    Maintain Queue Name </a>
                                            </li>
                                            <li>
                                                <a href="#tab_default_3" data-toggle="tab">
                                                    Maintain Queue List </a>
                                            </li>
                                            <li class="active">
                                                <a href="#tab_default_4" data-toggle="tab">
                                                    Assign To Queue </a>
                                            </li>
                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <!--                                            <div class="tab-pane active" id="tab_default_1">
                                                                                            <div id="queueType"></div>
                                                                                        </div>-->
                                            <div class="tab-pane " id="tab_default_2">
                                                <div id="queueName" class="table-guling"></div>
                                            </div>
                                            <div class="tab-pane" id="tab_default_3">
                                                <div id="queueList" class="table-guling"></div>
                                            </div>
                                            <div class="tab-pane active" id="tab_default_4">
                                                <div id="assignToQueue" class="table-guling"></div>
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



        <!--<div id="modal1"></div>-->
        <div id="modal2"></div>
        <div id="modal3"></div>
        <div id="modal4"></div>
        <jsp:include page="assign/AssignToQueueModal.jsp"/>
        
        <%@include file="libraries/footLibrary.jsp" %>

        <script>

//            $('#queueType').load('maintainQueueType.jsp');
            $('#queueName').load('maintain/maintainQueueName.jsp');
            $('#queueList').load('maintain/maintainQueueList.jsp');
            $('#assignToQueue').load('queue/QueueList.jsp');

//            $('#modal1').load('queueTypeModal.jsp');
            $('#modal2').load('maintain/queueNameModal.jsp');
            $('#modal3').load('maintain/queueListModal.jsp');
        </script>

    </body></html>
