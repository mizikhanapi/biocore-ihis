<%-- 
    Document   : User_Administration_Maintenance
    Created on : Feb 16, 2017, 2:27:00 AM
    Author     : user
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="main.RMIConnector"%>
<%@include file="validateSession.jsp" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iHIS | User Administration</title>
        <!-- header -->
        <%@include file="../assets/header.html"%>
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>-->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="bootstrap-3.3.6-dist/css/dataTables.bootstrap.min.css">
        <link rel="stylesheet" href="css/table.css">
        <link href="libraries/loader_animation.css" rel="stylesheet" type="text/css"/>
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>-->
        <script src="libraries/jquery-3.1.1.min.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!--<script src="http://www.w3schools.com/lib/w3data.js"></script>-->

        <script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>
        <script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>
        <script src="bootstrap-3.3.6-dist/js/dataTables.bootstrap.min.js" type="text/javascript"></script>




        <!-- header -->
    </head>

    <body>


        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->		
                <%@include file="libraries/sideMenus.jsp"%>
                <!-- menu side -->	

                <!-- main -->	

                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file="libraries/topMenus.jsp"%>
                    <!-- menu top -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="thumbnail">


                                <!-- Tab Menu -->

                                <div class="tabbable-panel">
                                    <h1>User Administration Maintenance</h1>
                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs ">
                                            <li class="active">
                                                <a href="#UAM_tab1" data-toggle="tab">
                                                    USER </a>
                                            </li>
                                            <li>
                                                <a href="#UAM_tab2" data-toggle="tab">
                                                    ROLE </a>
                                            </li>
                                            <li>
                                                <a href="#UAM_tab3" data-toggle="tab">
                                                    ASSIGN ROLE TO USER </a>
                                            </li>
                                            <li>
                                                <a href="#UAM_tab4" data-toggle="tab">
                                                    ASSIGN RESPONSIBILITY TO ROLE </a>
                                            </li>

                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="UAM_tab1">

                                                <div id="user">

                                                    <div id="userMain">
                                                    </div>
                                                    <div id="userTable">
                                                    </div>

                                                </div>

                                            </div>
                                            <div class="tab-pane" id="UAM_tab2">

                                                <div id="role">
                                                    <div id="roleMain">
                                                    </div>
                                                    <div id="roleTable">
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="tab-pane" id="UAM_tab3">

                                                <div id="accessrole">
                                                    <div id="accessRoleMain">
                                                    </div>
                                                    <div id="accessRoleTable">
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="tab-pane" id="UAM_tab4">

                                                <div id="responsibility">
                                                    <div id="responsibilityMain">
                                                    </div>
                                                    <div id="responsibilityTable">
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








        <script>


            $(document).ready(function () {

                $("#userMain").load("user_main.jsp");
                $("#userTable").load("user_table.jsp");

                $("#roleMain").load("role_main.jsp");
                $("#roleTable").load("role_table.jsp");

                $("#accessRoleMain").load("accessRole_main.jsp");
                $("#accessRoleTable").load("accessRole_table.jsp");

                $("#responsibilityMain").load("responsibility_main.jsp");
                $("#responsibilityTable").load("responsibility_table.jsp");


            });

        </script>

    </body>
</html>
