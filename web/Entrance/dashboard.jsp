
<%@page import="dBConn.Conn"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>


<%@include file="validateSession.jsp" %>
<%
    //------------------- Checking whether super user or not ------------------------------
    if (session.getAttribute("HFC_99") == null) {
        String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
        session.setAttribute("HFC_99", hfc_cd);

        //setting discipline and subdiscipline name
        Conn conn = new Conn();

        String dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
        String sub_cd = (String) session.getAttribute("SUB_DISCIPLINE_CODE");

        String query = "select dis.discipline_name, sub.subdiscipline_name "
                + "from adm_discipline dis "
                + "join adm_subdiscipline sub on sub.discipline_cd = dis.discipline_cd and sub.subdiscipline_hfc_cd = dis.discipline_hfc_cd "
                + "where dis.discipline_cd = '" + dis_cd + "' AND sub.subdiscipline_cd = '" + sub_cd + "' and dis.discipline_hfc_cd = '" + hfc_cd + "' LIMIT 1;";

        ArrayList<ArrayList<String>> dataDis = conn.getData(query);

        session.setAttribute("DISCIPLINE_NAME", dataDis.get(0).get(0));
        session.setAttribute("SUB_DISCIPLINE_NAME", dataDis.get(0).get(1));

    }

    String hfc_99 = (String) session.getAttribute("HFC_99");
    String user_99 = (String) session.getAttribute("USER_ID");
    String last_9 = user_99.substring(user_99.length() - 1);

    //====================================================================================
    String modules = session.getAttribute("MODULE_CODE").toString();

    ArrayList<String> arrayModule = new ArrayList<String>(Arrays.asList(modules.split("\\|")));

    boolean mod01, mod02, mod03, mod04, mod05, mod06, mod07, mod08, mod09, mod10, mod11, mod12, mod13, mod14, mod15, mod16, mod17, mod18;

    mod01 = mod02 = mod03 = mod04 = mod05 = mod06 = mod07 = mod08 = mod09 = mod10 = mod11 = mod12 = mod13 = mod14 = mod15 = mod16 = mod17 = mod18 = false;

    if (last_9.equalsIgnoreCase("9") && hfc_99.equalsIgnoreCase("99_iHIS_99")) {
        mod01 = mod02 = mod03 = mod04 = mod05 = mod06 = mod07 = mod08 = mod09 = mod10 = mod11 = mod12 = mod13 = mod14 = mod15 = mod16 = mod17 = mod18 = true;

    } else {

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

            } else if (arrayModule.get(i).equalsIgnoreCase("18")) {

                mod18 = true;

            }
        }//end for loop

    }

%>





<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- header -->
        <script src="libraries/jquery.min.js" type="text/javascript"></script>
        <%@include file = "../assets/header.html" %>
        <!-- header -->
    </head>

    <body>
        <div class="loading"></div>
        <div class="background-all" style="
             position: fixed;
             bottom: 20px;
             right: 20px;
             z-index: 1;
             opacity: 0.08;
             ">
            <i class="fa fa-user-md" style="font-size: 500px;"></i>
        </div>
        <!-- menu top -->
        <%@include file = "libraries/topMenus-dashboard.html" %>
        <!-- menu top -->

        <div class="container-fluid m-scene">
            <div class="row">       

                <!-- main -->		
                <div class="col-md-12 main-dashboard">
                    <div class="row">
                        <%    
                            if (mod01) {
                        %>
                        <div class="col-xs-6 col-sm-6 col-md-3">
                            <a href="../SystemAdmin/Lookup" class="thumbnail">
                                <div class="kotak text-center">
                                    <i class="fa fa-desktop" aria-hidden="true" style="color: #FDC671;font-size: 4em;"></i>
                                    <h3>System Administration</h3>
                                </div>
                            </a>
                        </div>

                        <div class="col-xs-6 col-sm-6 col-md-3">
                            <a href="../Registration/" class="thumbnail">
                                <div class="kotak text-center">
                                    <i class="fa fa-users" aria-hidden="true" style="color: #c0a16b;font-size: 4em;"></i>
                                    <h3>Medical Kiosk</h3>
                                </div>
                            </a>
                        </div>
                        <%
                            }

                            if (mod03) {
                        %>
                        <div class="col-xs-6 col-sm-6 col-md-3">
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

                        <div class="col-xs-6 col-sm-6 col-md-3">
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

                        <div class="col-xs-6 col-sm-6 col-md-3">
                            <a href="../PIS/HIS040001.jsp" class="thumbnail">
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

                        <div class="col-xs-6 col-sm-6 col-md-3">
                            <a href="../LIS/Order_list" class="thumbnail">
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

                        <div class="col-xs-6 col-sm-6 col-md-3">
                            <a href="../RIS/HIS060001.jsp" class="thumbnail">
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

                        <div class="col-xs-6 col-sm-6 col-md-3">
                            <a href="../ADT/HIS070001.jsp" class="thumbnail">
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

                        <div class="col-xs-6 col-sm-6 col-md-3">
                            <a href="../Billing/HIS080001.jsp" class="thumbnail">
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

                        <div class="col-xs-6 col-sm-6 col-md-3">
                            <a href="http://biocore-stag.utem.edu.my/CSS_Appointment/" class="thumbnail" target="_blank">
                                <div class="kotak text-center">
                                    <i class="fa fa-calendar" aria-hidden="true" style="color: #33B3AA;font-size: 4em;"></i>
                                    <h3>Patient Appointment</h3>
                                </div>
                            </a>
                        </div>
                        <%
                            }                        

                            if (mod11) {
                        %>

                        <div class="col-xs-6 col-sm-6 col-md-3">
                            <a href="../Report/MainMenu.jsp" class="thumbnail">
                                <div class="kotak text-center">
                                    <i class="fa fa-file-text" aria-hidden="true" style="color: #17A086;font-size: 4em;"></i>
                                    <h3>Reports</h3>
                                </div>
                            </a>
                        </div>

                        <%
                            }

                            if (mod03) {
                        %>

                        <div class="col-xs-6 col-sm-6 col-md-3">
                            <a href="../CallingSystem" class="thumbnail">
                                <div class="kotak text-center">
                                    <i class="fa fa-phone" aria-hidden="true" style="color: #FFB74D;font-size: 4em;"></i>
                                    <h3>Calling System</h3>
                                </div>
                            </a>
                        </div>

                        <%
                            }
                        %>
                        <div class="col-xs-6 col-sm-6 col-md-3">
                            <a href="../POM/" class="thumbnail">
                                <div class="kotak text-center">
                                    <i class="fa fa-book" aria-hidden="true" style="color: orange;font-size: 4em;"></i>
                                    <h3>Procedure Order Management</h3>
                                </div>
                            </a>
                        </div>

                        <div class="col-xs-6 col-sm-6 col-md-3">
                            <a href="../OperationTheater/index.jsp" class="thumbnail">
                                <div class="kotak text-center">
                                    <i class="fa fa-user-md" aria-hidden="true" style="color: orange;font-size: 4em;"></i>
                                    <h3>Operation Theater</h3>
                                </div>
                            </a>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-3">
                            <a href="../QMS/" class="thumbnail">
                                <div class="kotak text-center">
                                    <i class="fa fa-users" aria-hidden="true" style="color:#de58e8;font-size: 4em;"></i>
                                    <h3>Queue Management</h3>
                                </div>
                            </a>
                        </div>

                    </div>

                </div>

            </div>
            <!-- main -->		

        </div>



        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file="libraries/script.html"%>
        <%@include file="../assets/script.html"%>
        <script type="text/javascript" >


            $(function () {
                // Handler for .ready() called.

                $.ajax({
                    type: 'POST',
                    url: "getUserName.jsp",
                    success: function (data, textStatus, jqXHR) {
                        $('#welcome').text(data.trim());
                        console.log(data);
                    }});

            });
        </script>




    </body></html>