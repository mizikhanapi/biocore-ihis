<%-- 
    Document   : profile
    Created on : Mar 2, 2017, 9:50:42 AM
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
        <title>iHIS | User Profile</title>
        <!-- header -->

        <%@include file="../assets/header.html" %>
        <%@include file="libraries/headLibrary.jsp" %>
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>-->
        <!--<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">-->
                

    </head>
        





        <!-- header -->
    

    <body>


        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->
                <%@include file="libraries/sideMenus.jsp" %>
                <!-- menu side -->	

                <!-- main -->	

                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file="libraries/topMenus.html" %>
                    <!-- menu top -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="thumbnail">


                                <!-- Tab Menu -->

                                <div class="tabbable-panel">
                                    <h1>PROFILE</h1>
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
                                            <li>
                                                <a href="#PR_tab4" data-toggle="tab">
                                                    CHANGE DISCIPLINE/SUBDISCIPLINE </a>
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
                                            
                                            <div class="tab-pane" id="PR_tab4">

                                                <div id="changeDiscipline">

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


        <script>
          
            $(document).ready(function () {

                $("#personalInfo").load("personalInfo.jsp");
                $("#changePassword").load("changePassword.jsp");
                $("#changePicture").load("changePicture.jsp");
                $('#changeDiscipline').load("changeDiscipline.jsp");


            });

        </script>

    </body>
</html>
