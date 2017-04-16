<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="Config.connect"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page session="true" %>
<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="20; URL=HIS070004.jsp">

        <!-- header -->
        <%@include file = "../assets/header.html" %>

        <!-- header -->
    </head>

    <body>
        <!--    <input type="text" id="test">-->

        <%    Config.getBase_url(request);
            Config.getFile_url(session);
            Conn conn = new Conn();
            String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();

        %>


        <!-- header -->


        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->
                <%@include file = "libraries/sideMenus.jsp" %>
                <!-- menu side --> 

                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">


                    <!-- menu top -->
                    <%@include file = "libraries/topMenus.html" %>
                    <!-- menu top -->

                    <div class="row">
                        <div class="col-md-12">
                            <div class="thumbnail">


                                <!-- Tab Menu -->

                                <div class="tabbable-panel">
                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs ">
                                            <li class="active">
                                                <a href="#tab_default_1" data-toggle="tab">
                                                    Bed Booking Master Summary </a>
                                            </li>


                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_default_1">

                                                <div>
                                                    <div>
                                                        <%     Date datenow = new Date();
                                                            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/YYYY | HH:mm:ss");
                                                             out.print("Date :");
                                                            out.print(sdf.format(datenow));
                                                        %>
                                                    </div> </br>
                                                    <div class="col-md-6">
                                                        <div id="bed">
                                                            <%@include file = "bedsummary.jsp" %>
                                                        </div>
                                                    </div>



                                                    <div class="col-md-6">
                                                        <div id="BedRemarks">
                                                            <%@include file = "BedRemarks.jsp" %>
                                                        </div>

                                                    </div>
                                                    </br>

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




    </body>
</html>
