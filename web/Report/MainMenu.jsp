<%-- 
    Document   : MainMenu
    Created on : Feb 19, 2017, 12:01:30 AM
    Author     : User
--%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>

<%
    String modules = session.getAttribute("MODULE_CODE").toString();

    ArrayList<String> arrayModule = new ArrayList<String>(Arrays.asList(modules.split("\\|")));

    boolean mod01, mod02, mod03, mod04, mod05, mod06, mod07, mod08, mod09, mod10, mod11, mod12, mod13, mod14, mod15, mod16, mod17;

    mod01 = mod02 = mod03 = mod04 = mod05 = mod06 = mod07 = mod08 = mod09 = mod10 = mod11 = mod12 = mod13 = mod14 = mod15 = mod16 = mod17 = false;

    for (int i = 0; i < arrayModule.size(); i++) {

        if (arrayModule.get(i).equalsIgnoreCase("01")) {

            mod01 = true;

        } else if (arrayModule.get(i).equalsIgnoreCase("02")) {

            mod02 = true;

        } else if (arrayModule.get(i).equalsIgnoreCase("03")) {

            mod03 = true;

        } else if (arrayModule.get(i).equalsIgnoreCase("04")) {

            mod04 = true;

        } else if (arrayModule.get(i).equalsIgnoreCase("05")) {

            mod05 = true;

        } else if (arrayModule.get(i).equalsIgnoreCase("06")) {

            mod06 = true;

        } else if (arrayModule.get(i).equalsIgnoreCase("07")) {

            mod07 = true;

        } else if (arrayModule.get(i).equalsIgnoreCase("08")) {

            mod08 = true;

        } else if (arrayModule.get(i).equalsIgnoreCase("09")) {

            mod09 = true;

        } else if (arrayModule.get(i).equalsIgnoreCase("10")) {

            mod10 = true;

        } else if (arrayModule.get(i).equalsIgnoreCase("11")) {

            mod11 = true;

        } else if (arrayModule.get(i).equalsIgnoreCase("12")) {

            mod12 = true;

        } else if (arrayModule.get(i).equalsIgnoreCase("13")) {

            mod13 = true;

        } else if (arrayModule.get(i).equalsIgnoreCase("14")) {

            mod14 = true;

        } else if (arrayModule.get(i).equalsIgnoreCase("15")) {

            mod15 = true;

        } else if (arrayModule.get(i).equalsIgnoreCase("16")) {

            mod16 = true;

        } else if (arrayModule.get(i).equalsIgnoreCase("17")) {

            mod17 = true;

        }
    }


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--header -->
        <%@include file = "../assets/header.html" %>
        <!--header -->
        <title>Report</title>
    </head>
    <body>


        <div class="container-fluid">
            <div class="row">      
                <div class="main-dashboard" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@ include file ="libraries/reportTopMenus-dashboard.html" %>
                    <!-- menu top -->

                    <div class="row">

                        <div class="col-md-3">
                            <div class="panel panel-default panel-report">
                                <!-- Default panel contents -->
                                <div class="panel-heading">Outpatient Registration</div>
                                <!-- List group -->
                                <ul class="list-group">
                                    <li class="list-group-item"><a href="">Insert Report Menu</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="panel panel-default panel-report">
                                <!-- Default panel contents -->
                                <div class="panel-heading">Patient Consultation</div>
                                <!-- List group -->
                                <ul class="list-group">
                                    <li class="list-group-item"><a href="mcMain2.jsp">Reprint MC</a></li>
                                    <li class="list-group-item"><a href="timeSlipMain2.jsp">Reprint Time Slip</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="panel panel-default panel-report">
                                <!-- Default panel contents -->
                                <div class="panel-heading">Pharmacy Info System</div>
                                <!-- List group -->
                                <ul class="list-group">
                                    <li class="list-group-item"><a href="psMain.jsp">Prescription Slip</a></li>
                                    <li class="list-group-item"><a href="dsMain.jsp">Dispensing Sheet</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="panel panel-default panel-report">
                                <!-- Default panel contents -->
                                <div class="panel-heading">Laboratory Info System</div>
                                <!-- List group -->
                                <ul class="list-group">
                                    <li class="list-group-item"><a href="">Insert Report Menu</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="panel panel-default panel-report">
                                <!-- Default panel contents -->
                                <div class="panel-heading">Inpatient Management</div>
                                <!-- List group -->
                                <ul class="list-group">
                                    <li class="list-group-item"><a href="">Insert Report Menu</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="panel panel-default panel-report">
                                <!-- Default panel contents -->
                                <div class="panel-heading">Billing System</div>
                                <!-- List group -->
                                <ul class="list-group">
                                    <li class="list-group-item"><a href="">Insert Report Menu</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="panel panel-default panel-report">
                                <!-- Default panel contents -->
                                <div class="panel-heading">Patient Appointment</div>
                                <!-- List group -->
                                <ul class="list-group">
                                    <li class="list-group-item"><a href="">Insert Report Menu</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="panel panel-default panel-report">
                                <!-- Default panel contents -->
                                <div class="panel-heading">System Administrator</div>
                                <!-- List group -->
                                <ul class="list-group">
                                    <li class="list-group-item"><a href="dataAnalysisMain.jsp">Data Analysis</a></li>
                                    <li class="list-group-item"><a href="ICD10Main.jsp">ICD10 </a></li>
                                    <li class="list-group-item"><a href="laporanKosPerubatan.jsp">Report Health Cost </a></li>
                                    <li class="list-group-item"><a href="drugOrderList.jsp">Total Drug Cost </a></li>

                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="panel panel-default panel-report">
                                <!-- Default panel contents -->
                                <div class="panel-heading">Kiosk</div>
                                <!-- List group -->
                                <ul class="list-group">
                                    <li class="list-group-item"><a href="">Insert Report Menu</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="panel panel-default panel-report">
                                <!-- Default panel contents -->
                                <div class="panel-heading">Radiology Info System</div>
                                <!-- List group -->
                                <ul class="list-group">
                                    <li class="list-group-item"><a href="">Insert Report Menu</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script>

            //    $("#test").load("libraries/reportSideMenus.jsp");
            //    $("#head").load("libraries/reportHeader.jsp");
            //    $("#top").load("libraries/reportTopMenus.jsp");

        </script>
    </body>
</html>