<%-- 
    Document   : HIS190002
    Created on : Jul 20, 2017, 2:52:16 PM
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
        <title>iHIS | OT Procedure</title>
        <!-- header -->
        <%@include file = "libraries/headLibrary.jsp" %>
        <%@include file = "../assets/header.html" %>
        <link rel="stylesheet" href="../assets/css/multi-select.css">
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
                                                    CATEGORY</a>
                                            </li>
                                            <li>
                                                <a href="#tab_default_2" data-toggle="tab">
                                                    PROCEDURE</a>
                                            </li>
                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_default_1">
                                                <div id="OT_categoryMain">

                                                </div>
                                                <div id="OT_categoryTable" class="table-guling">

                                                </div>
                                            </div>
                                            <div class="tab-pane" id="tab_default_2">
                                                <div id="OT_procedureMain">

                                                </div>
                                                <div id="OT_procedureTable" class="table-guling">

                                                </div>
                                                <%--<%@include file="order_modal/requestNewOrder_modal.jsp" %>--%>
                                                <%--<%@include file="order_modal/setExamDate_modal.jsp" %>--%>
                                                <%--<%@include file="order_modal/prepareResult_modal.jsp" %>--%>
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
        <script type="text/javascript" src="../assets/js/jquery.multi-select.js"></script>
        
        <script>

            $('<div class="loading">&nbsp;</div>').appendTo('body');


            $('#OT_categoryMain').load('category/main.jsp');
            $('#OT_categoryTable').load('category/table.jsp');
            
            $('#OT_procedureMain').load('procedure/main.jsp');
            $('#OT_procedureTable').load('procedure/table.jsp');
        </script>

    </body>

</html>
