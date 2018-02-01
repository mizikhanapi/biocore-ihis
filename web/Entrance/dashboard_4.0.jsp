<%@page import="dBConn.Conn"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ADM_helper.MySession" %>

<%@include file="validateSession.jsp" %>
<%    try {
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

            if (dataDis.size() > 0) {
                session.setAttribute("DISCIPLINE_NAME", dataDis.get(0).get(0));
                session.setAttribute("SUB_DISCIPLINE_NAME", dataDis.get(0).get(1));
            } else {
                session.setAttribute("DISCIPLINE_NAME", "Unknown discipline code(" + dis_cd + "). Contact your admin.");
                session.setAttribute("SUB_DISCIPLINE_NAME", "Unknown subdiscipline code(" + sub_cd + "). Contact your admin.");
            }

        }

        String hfc_99 = (String) session.getAttribute("HFC_99");
        String user_99 = (String) session.getAttribute("USER_ID");
        String last_9 = user_99.substring(user_99.length() - 1);
        String my_1_gamba = session.getAttribute("PICTURE").toString();

        //====================================================================================
        //String modules = session.getAttribute("MODULE_CODE").toString();
        MySession mys = new MySession(user_99, hfc_99);
        mys.initModulePageAccess();

        String modules = mys.getLongStringModule();

        ArrayList<String> arrayModule = new ArrayList<String>(Arrays.asList(modules.split("\\|")));

        boolean mod01, mod02, mod03, mod04, mod05, mod06, mod07, mod08, mod09, mod10, mod11, mod12, mod13, mod14, mod15, mod16, mod17, mod18, mod19, mod20, mod21, mod22;

        mod01 = mod02 = mod03 = mod04 = mod05 = mod06 = mod07 = mod08 = mod09 = mod10 = mod11 = mod12 = mod13 = mod14 = mod15 = mod16 = mod17 = mod18 = mod19 = mod20 = mod21 = mod22 = false;

        if (mys.isSuperUser()) {
            mod01 = mod02 = mod03 = mod04 = mod05 = mod06 = mod07 = mod08 = mod09 = mod10 = mod11 = mod12 = mod13 = mod14 = mod15 = mod16 = mod17 = mod18 = mod19 = mod20 = mod21 = mod22 = true;

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

                } else if (arrayModule.get(i).equalsIgnoreCase("19")) {

                    mod19 = true;

                } else if (arrayModule.get(i).equalsIgnoreCase("20")) {

                    mod20 = true;

                } else if (arrayModule.get(i).equalsIgnoreCase("21")) {

                    mod21 = true;

                } else if (arrayModule.get(i).equalsIgnoreCase("22")) {

                    mod22 = true;

                }
            }//end for loop

        }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- header -->
        <script src="libraries/jquery.min.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <link href="../assets/css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/_all-skins.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/tabsDashboard.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/care.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/iconsmind.css" rel="stylesheet" type="text/css"/>
        <%@include file = "../assets/header_baru.html" %>
        <!-- header -->



    </head>

    <body class="hold-transition skin-care layout-top-nav">
        <div class="wrapper">
            <%@include file = "libraries/topMenus-dashboard.html" %><!-- menu top -->
            <div class="content-wrapper">
                <!-- profile start -->
                <div class="twPc-div">&nbsp;</div>
                <nav class="navbar navbar-default" style="height: 75px;">
                    <div class="container">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#mainNav">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <div class="navbar-brands profile-userpic">
                                <img src="<%= my_1_gamba%>">
                            </div>
                            <span class="site-name" id="welcomeMain"></span>
                            <span class="site-description">System Admin</span>
                        </div>

                        <div class="collapse navbar-collapse" id="mainNav" >
<!--                            <ul class="nav main-menu navbar-nav">
                                <li><a href="#" style="text-align: center;"><span class="p-label" id="pIC">123</span>Total Patient </a></li>
                                <li><a href="#" style="text-align: center;"><span class="p-label" id="pIC">43</span>Patient Consult</a></li>
                                <li><a href="#" style="text-align: center;"><span class="p-label" id="pIC">23</span>Total Discharge</a></li>
                            </ul>

                            <ul class="nav  navbar-nav navbar-right">
                                <li><button class="btn btn-default" style="margin-top: 18px;"><i class="fa fa-bars"></i> Quick Menus</button></li>
                            </ul>-->
                        </div>
                    </div>
                </nav>
                <!-- profile end -->
                <div class="container m-scene">
                    <div class="tabbable-panel">
                        <div class="tabbable-line">
                            <ul class="nav nav-pills ">
                                <li class="active">
                                    <a href="#tab_default_1" data-toggle="tab">
                                        Modules </a>
                                </li>
                                <!--                                <li>
                                                                    <a href="#tab_default_2" data-toggle="tab">
                                                                        Queue List </a>
                                                                </li>
                                                                <li>
                                                                    <a href="#tab_default_3" data-toggle="tab">
                                                                        Report </a>
                                                                </li>-->
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab_default_1">
                                    <!-- main -->		
                                    <div class="col-md-12 main-dashboard">
                                        <div class="row">
                                            <%                            if (mod01) {
                                            %>
                                            <div class="col-xs-6 col-sm-6 col-md-3">
                                                <a href="../SystemAdmin/Lookup" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="iconsmind-Gears" aria-hidden="true" style="color: #FDC671;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        System Administration
                                                    </div>
                                                </a>
                                            </div>

                                            <%
                                                }

                                                if (mod03) {
                                            %>

                                            <div class="col-xs-6 col-sm-6 col-md-3">
                                                <a href="../Registration/" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="iconsmind-Monitor-Vertical" aria-hidden="true" style="color: #c0a16b;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        Medical Kiosk
                                                    </div>
                                                </a>
                                            </div>

                                            <div class="col-xs-6 col-sm-6 col-md-3">
                                                <a href="../PMS/index.jsp" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="iconsmind-Add-User" aria-hidden="true" style="color: #17A086;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        Outpatient Management
                                                    </div>
                                                </a>
                                            </div>
                                            <%
                                                }

                                                if (mod02) {
                                            %>

                                            <div class="col-xs-6 col-sm-6 col-md-3">
                                                <a href="../CIS/" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="iconsmind-Stethoscope" aria-hidden="true" style="color: #E84C3D;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        Patient Consultation
                                                    </div>
                                                </a>
                                            </div>
                                            <%
                                                }

                                                if (mod04) {
                                            %>

                                            <div class="col-xs-6 col-sm-6 col-md-3">
                                                <a href="../PIS/Dispense_Drug_Order" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="iconsmind-Medicine-2" aria-hidden="true" style="color: #9A67A0;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        Pharmacy Info System
                                                    </div>
                                                </a>
                                            </div>
                                            <%
                                                }

                                                if (mod05) {
                                            %>

                                            <div class="col-xs-6 col-sm-6 col-md-3">
                                                <a href="../LIS/Order_list" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="iconsmind-Flask" aria-hidden="true" style="color: #F26353;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        Laboratory Info System
                                                    </div>
                                                </a>
                                            </div>
                                            <%
                                                }

                                                if (mod06) {
                                            %>

                                            <div class="col-xs-6 col-sm-6 col-md-3">
                                                <a href="../RIS/HIS060001.jsp" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="iconsmind-Radioactive" aria-hidden="true" style="color: #2A80B9;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        Radiology Info System
                                                    </div>
                                                </a>
                                            </div>
                                            <%
                                                }

                                                if (mod07) {
                                            %>

                                            <div class="col-xs-6 col-sm-6 col-md-3">
                                                <a href="../ADT/HIS070001.jsp" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="iconsmind-Hospital" aria-hidden="true" style="color: #DE3975;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        Inpatient Management
                                                    </div>
                                                </a>
                                            </div>
                                            <%
                                                }

                                                if (mod08) {
                                            %>

                                            <div class="col-xs-6 col-sm-6 col-md-3">
                                                <a href="../Billing/HIS080001.jsp" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="iconsmind-Billing" aria-hidden="true" style="color: #34A8DA;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        Billing System
                                                    </div>
                                                </a>
                                            </div>
                                            <%
                                                }

                                                if (mod03) {
                                            %>

                                            <div class="col-xs-6 col-sm-6 col-md-3">
                                                <a href="../Appointment/" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="iconsmind-Calendar-4" aria-hidden="true" style="color: #33B3AA;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        Patient Appointment
                                                    </div>
                                                </a>
                                            </div>
                                            <%
                                                }

                                                if (mod11) {
                                            %>

                                            <div class="col-xs-6 col-sm-6 col-md-3">
                                                <a href="../Report/MainMenu.jsp" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="iconsmind-Monitor-Analytics" aria-hidden="true" style="color: #00dd1c;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        Reports
                                                    </div>
                                                </a>
                                            </div>

                                            <%
                                                }

                                                if (mod21) {
                                            %>

                                            <div class="col-xs-6 col-sm-6 col-md-3">
                                                <a href="../CallingSystem" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="iconsmind-Support" aria-hidden="true" style="color: #FFB74D;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">

                                                        Calling System
                                                    </div>
                                                </a>
                                            </div>

                                            <%
                                                }

                                                if (mod18) {
                                            %>
                                            <div class="col-xs-6 col-sm-6 col-md-3">
                                                <a href="../POM/" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="iconsmind-Approved-Window" aria-hidden="true" style="color: orange;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        Procedure Management
                                                    </div>
                                                </a>
                                            </div>
                                            <%
                                                }//end if mod18

                                                if (mod19) {
                                            %>
                                            <div class="col-xs-6 col-sm-6 col-md-3">
                                                <a href="../OperationTheater/index.jsp" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="iconsmind-Medical-Sign" aria-hidden="true" style="color:#0000A0;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        Operation Theater
                                                    </div>
                                                </a>
                                            </div>
                                            <%
                                                }//end if mod19

                                                if (mod20) {
                                            %>                        
                                            <div class="col-xs-6 col-sm-6 col-md-3">
                                                <a href="../QMS/" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="iconsmind-Mens" aria-hidden="true" style="color:#ab47bc;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        Queue Management
                                                    </div>
                                                </a>
                                            </div>                        
                                            <%
                                                }// end if mod20

                                                if (mod22) {
                                            %>                        
                                            <div class="col-xs-6 col-sm-6 col-md-3">
                                                <a href="../SMS/Distribution_Stock_Order" class="thumbnail">
                                                    <span class="icon_contain">
                                                        <i class="iconsmind-Box-withFolders" aria-hidden="true" style="color:#777620;font-size: 4em;"></i>
                                                    </span>
                                                    <div class="kotak text-center">
                                                        Stock Management
                                                    </div>
                                                </a>
                                            </div>                        
                                            <%
                                                }// end if mod22
                                            %>

                                        </div>
                                    </div>   
                                </div>

                            </div>
                        </div>
                    </div> 
                </div>
            </div>
        </div>










        <div class="loading"></div>



        <div class="container-fluid m-scene">
            <div class="row">





            </div>
            <!-- main -->		

        </div>


        <%@include file="libraries/script.html"%>
        <%@include file="../assets/script.html"%>
        <script type="text/javascript" >


            $(function () {
                // Handler for .ready() called.

                $.ajax({
                    type: 'POST',
                    url: "getUserName.jsp",
                    success: function (data, textStatus, jqXHR) {
                        $('#welcomeMain').text(data.trim());
                        $('#welcome').text(data.trim());
                        console.log(data);
                    }});

//                $.ajax({
//                    type: 'POST',
//                    url: "dashboard_control/getGambo.jsp",
//                    success: function (data, textStatus, jqXHR) {
//                        $('.gambarUser').attr("src",data);
//                                               
//                    }});

                $('.gambarUser').attr("src", "<%=my_1_gamba%>");

            });
        </script>

    </body>

</html>
<%
    }//end try
    catch (Exception e) {
        System.out.println("Entering dashboard");
        e.printStackTrace();
        out.print("<h1>Oopps! Something went wrong. Try again later.</h1>");
    }
%>