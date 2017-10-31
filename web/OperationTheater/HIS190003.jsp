<%-- 
    Document   : HIS190003
    Created on : Jul 22, 2017, 4:27:05 AM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>

<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iHIS | OT Room</title>
        <!-- header -->
        <%@include file = "libraries/headLibrary.jsp" %>
        <%@include file = "../assets/header.html" %>
        <link href="libraries/css/jquery.datetimepicker.css" rel="stylesheet">
        <!-- header -->
    </head>

    <body>
        <div class="loading"></div>
        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->	
                <%@include file = "libraries/SideMenus.jsp" %>
                <!-- menu side -->	
                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file = "libraries/TopMenus.jsp" %>
                    <!-- menu top -->
                    <div class="row">
                        <div class="col-md-12">
                            <div  class="thumbnail">


                                <!-- Tab Menu -->
                                <div class="tabbable-panel">
                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs ">
                                            <li class="active">
                                                <a href="#tab_default_1" data-toggle="tab">
                                                    ROOM</a>
                                            </li>
                                            <li>
                                                <a href="#tab_default_2" data-toggle="tab">
                                                    SCHEDULE</a>
                                            </li>
                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_default_1">
                                                <div id="roomMain">

                                                </div>
                                                <div id="roomTable" class="table-guling">

                                                </div>
                                            </div>
                                            <div class="tab-pane" id="tab_default_2">
                                                <div id="scheduleMain">

                                                </div>
                                                <div id="scheduleTable" class="table-guling">

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
        <%@include file = "libraries/footLibrary.jsp" %>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="libraries/js/jquery.datetimepicker.full.min.js"></script>

        <script>

            $('<div class="loading">&nbsp;</div>').appendTo('body');


            $('#roomMain').load('room/main.jsp');
            $('#roomTable').load('room/table.jsp');
            
            $('#scheduleMain').load('schedule/main.jsp');
            $('#scheduleTable').load('schedule/table.jsp');
        </script>

    </body>

</html>
