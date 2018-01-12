<%-- 
    Document   : queue
    Created on : Mar 16, 2017, 10:14:31 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>
<%@include file="validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>

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
<!--        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="bootstrap-3.3.6-dist/js/bootbox.min.js" type="text/javascript"></script>
        <script src="bootstrap-3.3.6-dist/js/onKeyPress.js" type="text/javascript"></script>
        <script src="datepicker/jquery-ui.js" type="text/javascript"></script>
        
        <script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>
        <script src="bootstrap-3.3.6-dist/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="../assets/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../assets/js/dataTables.bootstrap.min.js" type="text/javascript"></script>-->
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
                                            <li class="active">
                                                <a href="#tab_default_2" data-toggle="tab">
                                                    Maintain Queue Name </a>
                                            </li>
                                            <li>
                                                <a href="#tab_default_3" data-toggle="tab">
                                                    Maintain Queue List </a>
                                            </li>
                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <!--                                            <div class="tab-pane active" id="tab_default_1">
                                                                                            <div id="queueType"></div>
                                                                                        </div>-->
                                            <div class="tab-pane active" id="tab_default_2">
                                                <div id="queueName" class="table-guling"></div>
                                            </div>
                                            <div class="tab-pane" id="tab_default_3">
                                                <div id="queueList" class="table-guling"></div>
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

        <%@include file="libraries/footLibrary.jsp" %>
        
        <script src="../assets/js/rd.jquery.preventKey.js"></script>

        <script>
            $(function () {
                preventPipeKeyPress(document);
                preventPipeKeyUp("input");
                codeValidityKeyUp(".code-input");
                $('.modal').css("overflow", "auto");
            });
        
//            $('#queueType').load('maintainQueueType.jsp');
            $('#queueName').load('maintainQueueName.jsp');
            $('#queueList').load('maintainQueueList.jsp');

//            $('#modal1').load('queueTypeModal.jsp');
            $('#modal2').load('queueNameModal.jsp');
            $('#modal3').load('queueListModal.jsp');
        </script>

    </body></html>
