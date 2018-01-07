<%-- 
    Document   : HIS180001
    Created on : May 10, 2017, 7:38:38 AM
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
        <title>iHIS | Procedure Order Management</title>
        <!-- header -->
        <%@include file="libraries/headLibrary.jsp" %>
        <%@include file = "../assets/header.html" %>
        <!-- header -->
    </head>

    <body>
        <div class="loading"></div>
        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->	
                <%@include file = "libraries/sideMenus.jsp" %>
                <!-- menu side -->	
                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file = "libraries/topMenus.jsp" %>
                    <!-- menu top -->
                    <div class="row">
                        <div class="col-md-12">
                            <div  class="thumbnail">


                                <!-- Tab Menu -->
                                <div class="tabbable-panel">
                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs ">
                                            <li class="active">
                                                <a href="#tab_default_1" data-toggle="tab" onclick="reloadOrderMasterList()">
                                                    ORDER LIST</a>
                                            </li>
                                            <li>
                                                <a href="#tab_default_2" data-toggle="tab">
                                                    ORDER DETAIL</a>
                                            </li>
                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_default_1">
                                                <div id="risOrderMain">

                                                </div>
                                                <div id="risOrderListContent">

                                                </div>
                                            </div>
                                            <div class="tab-pane" id="tab_default_2">
                                                <div id="risOrderDetailContent">

                                                </div>
                                                <%@include file="order_modal/requestNewOrder_modal.jsp" %>
                                                <%@include file="order_modal/prepareResult_modal.jsp" %>

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
        <script type="text/javascript" src="../assets/js/rd.jquery.preventKey.js"></script>
        <!-- Placed at the end of the document so the pages load faster -->


        <script>

            // createScreenLoading();
            $(function () {
                preventPipeKeyPress(document);
                preventPipeKeyUp("input");
                codeValidityKeyUp(".code-input");
            });



            $("#risOrderMain").load("risManageOrderMaster_main.jsp");
            $("#risOrderListContent").load("risManageOrderListTable.jsp");
            $("#risOrderDetailContent").load("risManageOrderListBasicInfoNew.jsp");

            // destroyScreenLoading();

        </script>

    </body>

</html>