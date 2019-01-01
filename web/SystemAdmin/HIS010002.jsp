<%-- 
    Document   : User_Administration_Maintenance
    Created on : Feb 16, 2017, 2:27:00 AM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="main.RMIConnector"%>
<%@include file="validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iHIS | User Administration</title>
        <!-- header -->
        <script src="libraries/jquery-3.1.1.min.js" type="text/javascript"></script>
        <%@include file="../assets/header.html"%>


        <%@include file="libraries/headLibrary.jsp" %>

    </head>

    <body>
        <div class="loading"></div>

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
                                <h3 style="margin: 0px;">User Administration Maintenance</h3>
                                <hr class="pemisah" />

                                <!-- Tab Menu -->

                                <div class="tabbable-panel">
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
                                                    ASSIGN PAGE TO ROLE </a>
                                            </li>

                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="UAM_tab1">

                                                <div id="user">

                                                    <div id="userMain">
                                                    </div>
                                                    <div id="userTable" class="table-guling">
                                                    </div>

                                                </div>

                                            </div>
                                            <div class="tab-pane" id="UAM_tab2">

                                                <div id="role">
                                                    <div id="roleMain">
                                                    </div>
                                                    <div id="roleTable" class="table-guling">
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="tab-pane" id="UAM_tab3">

                                                <div id="accessrole">
                                                    <div id="accessRoleMain">
                                                    </div>
                                                    <div id="accessRoleTable" class="table-guling">
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="tab-pane" id="UAM_tab4">

                                                <div id="responsibility">
                                                    <div id="responsibilityMain">
                                                    </div>
                                                    <div id="responsibilityTable" class="table-guling">
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


        <%@include file="libraries/footLibrary.jsp" %>




        <script src="../assets/js/rd.jquery.preventKey.js"></script>
        <script>

            $(function () {
                preventPipeKeyPress(document);
                preventPipeKeyUp("input");
                codeValidityKeyUp(".code-input");
                $('.modal').css("overflow", "auto");
            });



            $("#userMain").load("user_main.jsp");
            $("#userTable").load("user_table.jsp");

            $("#roleMain").load("role_main.jsp");
            $("#roleTable").load("role_table.jsp");

            $("#accessRoleMain").load("accessRole_main.jsp");
            $("#accessRoleTable").load("accessRole_table.jsp");

            $("#responsibilityMain").load("responsibility_main.jsp");
            $("#responsibilityTable").load("responsibility_table.jsp");




        </script>

    </body>
</html>
