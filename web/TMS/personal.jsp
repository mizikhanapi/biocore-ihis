<%-- 
    Document   : personal
    Created on : Apr 16, 2018, 1:56:04 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="main.RMIConnector"%>
<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iHIS | User Profile</title>
        <!-- header -->

        <%@include file="../assets/header.html" %>
        <%@include file="libraries/headLibrary.jsp" %>
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>-->
        <!--<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">-->
                

    </head>
        
   

    <body>


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


                                <!-- Tab Menu -->

                                <div class="tabbable-panel">
                                    <h4>PROFILE</h4>
                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs ">
                                            <li class="active">
                                                <a href="#PR_tab1" data-toggle="tab">
                                                    PERSONAL INFORMATION </a>
                                            </li>
                                            <li>
                                                <a href="#PR_tab2" data-toggle="tab">
                                                    CHANGE PASSWORD </a>
                                            </li>
                                            <li>
                                                <a href="#PR_tab3" data-toggle="tab">
                                                    UPLOAD PICTURE </a>
                                            </li>
                                           

                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="PR_tab1">

                                                <div id="personalInfo">

                                                </div>

                                            </div>
                                            <div class="tab-pane" id="PR_tab2">

                                                <div id="changePassword">

                                                </div>

                                            </div>
                                            
                                            <div class="tab-pane" id="PR_tab3">

                                                <div id="changePicture">

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





        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <%@include file="libraries/footLibrary.jsp" %>
        <script type="text/javascript" src="../assets/js/rd.jquery.validator.js"></script>

        <script>
          
            $(document).ready(function () {

                $("#personalInfo").load("personal/personalInfo.jsp");
                $("#changePassword").load("../Entrance/changePassword.jsp");
                $("#changePicture").load("../Entrance/changePicture.jsp");
               
            });

        </script>

    </body>
</html>

