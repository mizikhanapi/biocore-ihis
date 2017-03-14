<%-- 
    Document   : MainMenu
    Created on : Feb 19, 2017, 12:01:30 AM
    Author     : User
--%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>

<%
    String modules = session.getAttribute("MODULE_CODE").toString();
    
    
    ArrayList<String> arrayModule = new  ArrayList<String>(Arrays.asList(modules.split("\\|")));
    
    boolean mod01, mod02, mod03, mod04, mod05, mod06, mod07, mod08, mod09, mod10, mod11, mod12, mod13, mod14, mod15, mod16, mod17; 
    
    mod01= mod02= mod03= mod04= mod05= mod06= mod07= mod08= mod09= mod10= mod11= mod12= mod13= mod14= mod15= mod16= mod17 = false;
    
    for(int i = 0; i<arrayModule.size(); i++){
        
        if(arrayModule.get(i).equalsIgnoreCase("01")){
        
            mod01 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("02")){
            
            mod02 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("03")){
            
            mod03 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("04")){
            
            mod04 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("05")){
            
            mod05 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("06")){
            
            mod06 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("07")){
            
            mod07 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("08")){
            
            mod08 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("09")){
            
            mod09 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("10")){
            
            mod10 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("11")){
            
            mod11 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("12")){
            
            mod12 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("13")){
            
            mod13 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("14")){
            
            mod14 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("15")){
            
            mod15 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("16")){
            
            mod16 = true;
            
        }else if(arrayModule.get(i).equalsIgnoreCase("17")){
            
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
        <!-- side bar -->
        <%@ include file ="libraries/reportSideMenus.jsp" %>
        <!-- side bar -->

        <div class="container-fluid">
            <div class="row">      
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@ include file ="libraries/reportTopMenus.jsp" %>
                    <!-- menu top -->

                    <div class="row">
                        <%if (mod03) {%>
                        <div class="col-md-3">
                            <a href="../PMS/index.jsp" class="thumbnail">
                                <div class="kotak text-center">
                                    <i class="fa fa-user" aria-hidden="true" style="color: #17A086;font-size: 4em;"></i>
                                    <h3>Outpatient Management</h3>
                                </div>
                            </a>
                        </div>
                        <%
                            }

                            if (mod02) {
                        %>

                        <div class="col-md-3">
                            <a href="../CIS/CIS000000.jsp" class="thumbnail">
                                <div class="kotak text-center">
                                    <i class="fa fa-user-md" aria-hidden="true" style="color: #E84C3D;font-size: 4em;"></i>
                                    <h3>Patient Consultation</h3>
                                </div>
                            </a>
                        </div>
                        <%
                            }

                            if (mod04) {
                        %>

                        <div class="col-md-3">
                            <a href="../PIS/manageInventory.jsp" class="thumbnail">
                                <div class="kotak text-center">
                                    <i class="fa fa-medkit" aria-hidden="true" style="color: #9A67A0;font-size: 4em;"></i>
                                    <h3>Pharmacy Info System</h3>
                                </div>
                            </a>
                        </div>
                        <%
                            }

                            if (mod05) {
                        %>

                        <div class="col-md-3">
                            <a href="../LIS/MainPage.jsp" class="thumbnail">
                                <div class="kotak text-center">
                                    <i class="fa fa-database" aria-hidden="true" style="color: #F26353;font-size: 4em;"></i>
                                    <h3>Laboratory Info System</h3>
                                </div>
                            </a>
                        </div>
                        <%
                            }

                            if (mod06) {
                        %>

                        <div class="col-md-3">
                            <a href="../RIS/receive-order.html" class="thumbnail">
                                <div class="kotak text-center">
                                    <i class="fa fa-cogs" aria-hidden="true" style="color: #2A80B9;font-size: 4em;"></i>
                                    <h3>Radiology Information System</h3>
                                </div>
                            </a>
                        </div>
                        <%
                            }

                            if (mod07) {
                        %>

                        <div class="col-md-3">
                            <a href="../ADT/index.jsp" class="thumbnail">
                                <div class="kotak text-center">
                                    <i class="fa fa-bed" aria-hidden="true" style="color: #DE3975;font-size: 4em;"></i>
                                    <h3>Inpatient Management</h3>
                                </div>
                            </a>
                        </div>
                        <%
                            }

                            if (mod08) {
                        %>

                        <div class="col-md-3">
                            <a href="../Billing/billing.jsp" class="thumbnail">
                                <div class="kotak text-center">
                                    <i class="fa fa-credit-card" aria-hidden="true" style="color: #34A8DA;font-size: 4em;"></i>
                                    <h3>Billing System</h3>
                                </div>
                            </a>
                        </div>
                        <%
                            }

                            if (mod03) {
                        %>

                        <div class="col-md-3">
                            <a href="http://biocore-stag.utem.edu.my/CSS_Appointment/" class="thumbnail">
                                <div class="kotak text-center">
                                    <i class="fa fa-calendar" aria-hidden="true" style="color: #33B3AA;font-size: 4em;"></i>
                                    <h3>Patient Appointment</h3>
                                </div>
                            </a>
                        </div>
                        <%
                            }

                            if (mod01) {
                        %>


                        <div class="col-md-3">
                            <a href="../SystemAdmin/Lookup-Maintenance.jsp" class="thumbnail">
                                <div class="kotak text-center">
                                    <i class="fa fa-desktop" aria-hidden="true" style="color: #FDC671;font-size: 4em;"></i>
                                    <h3>System Administration</h3>
                                </div>
                            </a>
                        </div>

                        <div class="col-md-3">
                            <a href="../Registration/" class="thumbnail">
                                <div class="kotak text-center">
                                    <i class="fa fa-users" aria-hidden="true" style="color: #c0a16b;font-size: 4em;"></i>
                                    <h3>Registration</h3>
                                </div>
                            </a>
                        </div>
                        <%
                            }

                            if (mod11) {
                        %>

                        <div class="col-md-3">
                            <a href="../Report/MainMenu.jsp" class="thumbnail">
                                <div class="kotak text-center">
                                    <i class="fa fa-file-text" aria-hidden="true" style="color: #17A086;font-size: 4em;"></i>
                                    <h3>Reports</h3>
                                </div>
                            </a>
                        </div>
                        <%
                            }
                        %>
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