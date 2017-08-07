<%-- 
    Document   : HIS180002
    Created on : May 10, 2017, 6:17:41 PM
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
        <title>iHIS | CIS Procedure Management</title>
        <!-- header -->
        <%@include file="libraries/headLibrary.jsp" %>
        <%@include file = "../assets/header.html" %>
        <link href="libraries/css/multi-select.css" rel="stylesheet"/>
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
                                                <a href="#tab_default_1" data-toggle="tab">
                                                    LEVEL 1</a>
                                            </li>
                                            <li>
                                                <a href="#tab_default_2" data-toggle="tab">
                                                    LEVEL 2</a>
                                            </li>
                                            <li>
                                                <a href="#tab_default_3" data-toggle="tab">
                                                    LEVEL 3</a>
                                            </li>
                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_default_1">
                                                <div id="procedureMain">

                                                </div>
                                                <div id="procedureTable" class="table-guling">

                                                </div>
                                                <%@include file="procedure_modal/procedure_modal.jsp" %>
                                            </div>
                                            
                                            <div class="tab-pane" id="tab_default_2">
                                                <div id="procedure1Main">

                                                </div>
                                                <div id="procedure1Table" class="table-guling">

                                                </div>
                                                <%@include file="procedure_modal/procedure1_modal.jsp" %>                                                
                                                
                                            </div>
                                                
                                            <div class="tab-pane" id="tab_default_3">
                                                <div id="procedure2Main">

                                                </div>
                                                <div id="procedure2Table" class="table-guling">

                                                </div>
                                                <%@include file="procedure_modal/procedure2_modal.jsp" %>                                                
                                                
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
        <script src="libraries/js/jquery.multi-select.js"></script>
        <!-- Placed at the end of the document so the pages load faster -->
        

        <script>

           // createScreenLoading();


            $("#procedureMain").load("procedure_main.jsp");
            $("#procedureTable").load("procedure_table.jsp");
            
            $("#procedure1Main").load("procedure1_main.jsp");
            $("#procedure1Table").load("procedure1_table.jsp");
            
            $("#procedure2Main").load("procedure2_main.jsp");
            $("#procedure2Table").load("procedure2_table.jsp");
            
            
           // destroyScreenLoading();

        </script>

    </body>

</html>
