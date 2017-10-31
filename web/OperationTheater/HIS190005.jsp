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
        <link href="../assets/css/jquery.flexdatalist.min.css" rel="stylesheet" type="text/css">
        <%@include file = "../assets/header.html" %>
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
                                            
                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_default_1">
                                                <div id="OT_categoryMain">

                                                </div>
                                                <div id="OT_categoryTable" class="table-guling">

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
        <script src="libraries/js/jquery.check-file.js" type="text/javascript"></script>
        <script src="../assets/js/jquery.flexdatalist.min.js" type="text/javascript"></script>
        

        <script>

            $('<div class="loading">&nbsp;</div>').appendTo('body');


            $('#OT_categoryMain').load('searchTest/main.jsp');
            //$('#OT_categoryTable').load('category/table.jsp');
            
        </script>

    </body>

</html>
