<%-- 
    Document   : MainMenu
    Created on : Feb 19, 2017, 12:01:30 AM
    Author     : User
--%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>

<%

    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String modules = session.getAttribute("MODULE_CODE").toString();
    String dis = (String) session.getAttribute("DISCIPLINE_CODE");
    String dis_names = "";
    String dis_name_query1 = "SELECT discipline_cd, discipline_name FROM adm_discipline WHERE discipline_hfc_cd='" + hfc + "'"
            + " and (discipline_name like '%Inpatient%' or discipline_name like '%Outpatient%')  ";
    ArrayList<ArrayList<String>> mysqldis_name = conn.getData(dis_name_query1);
    for (int x = 0; x < mysqldis_name.size(); x++) {
        dis_names += mysqldis_name.get(x).get(0) + "|" + mysqldis_name.get(x).get(1);
        if (x < mysqldis_name.size() - 1) {
            dis_names += "^";
        }
    }

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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="../assets/js/Chart.bundle.js" type="text/javascript"></script>

        <script src="../assets/js/highcharts-exporting.js" type="text/javascript"></script>
        <script src="../assets/js/highcharts.js" type="text/javascript"></script>


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
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="thumbnail">
                                        <div class="text-center">
                                            <div class="bed-booking-title">Total InPatient</div>

                                            <span class="bed-booking-total">500</span>
                                            <div>
                                                <span class="bed-booking-a"><i class="fa fa-square"></i> Males:&nbsp;<%=0%></span> 
                                                <span class="bed-booking-p"><i class="fa fa-square"></i> Females:&nbsp;<%=0%></span>
                                                <span class="bed-booking-o"><i class="fa fa-square"></i> Others:&nbsp;<%=0%></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="thumbnail">
                                        <div class="text-center">
                                            <div class="bed-booking-title">Total OutPatient</div>

                                            <span class="bed-booking-total"><%=0%></span>
                                            <div>
                                                <span class="bed-booking-a"><i class="fa fa-square"></i> Males:&nbsp;<%=0%></span> 
                                                <span class="bed-booking-p"><i class="fa fa-square"></i> Females:&nbsp;<%=0%></span>
                                                <span class="bed-booking-o"><i class="fa fa-square"></i> Others:&nbsp;<%=0%></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="thumbnail">
                                        <div class="text-center">
                                            <div class="bed-booking-title">Total Drug Cost</div>

                                            <span class="bed-booking-total">RM50M</span>
                                            <div>
                                                <span class="bed-booking-a"><i class="fa fa-square"></i>&nbsp;0</span> 
                                                <span class="bed-booking-p"><i class="fa fa-square"></i>&nbsp;0</span>
                                                <span class="bed-booking-o"><i class="fa fa-square"></i>&nbsp;0</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="thumbnail">
                                        <div class="text-center">
                                            <div class="bed-booking-title">Total ICD 10</div>

                                            <span class="bed-booking-total">0</span>
                                            <div>
                                                <span class="bed-booking-a"><i class="fa fa-square"></i>&nbsp;0</span> 
                                                <span class="bed-booking-p"><i class="fa fa-square"></i>&nbsp;0</span>
                                                <span class="bed-booking-o"><i class="fa fa-square"></i>&nbsp;0</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-8">

                            <div class="thumbnail">
                                <div id="ALGraph"></div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="thumbnail">
                                 <%@ include file ="top10DrugsPrescribedGraph.jsp" %>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-8">
                            <div class="thumbnail">
                                <%@ include file ="chart/chart1.jsp" %>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel panel-default panel-report">
                                        <div class="panel-heading">
                                            Module Reports
                                        </div>
                                        <!-- Default panel contents -->
                                        <div class="panel-heading">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#OUTPATIENT">OUTPATIENT REGISTRATION</a>
                                            <span class="pull-right panel-collapse-clickable" data-toggle="collapse" data-parent="#accordion" href="#OUTPATIENT">
                                                <i class="glyphicon glyphicon-chevron-down"></i>
                                            </span>
                                        </div>
                                        <!-- List group -->
                                        <div id="OUTPATIENT" class="panel-collapse panel-collapse collapse">
                                            <ul class="list-group">
                                                <li class="list-group-item"><a href="UTeMAttendanceListReport.jsp">Patient Attendance List</a></li>
                                                <li class="list-group-item"><a href="UTeMMedicalCertificateReport.jsp">Medical Certificate List</a></li>
                                            </ul>
                                        </div>
                                        <!-- Default panel contents -->

                                        <!-- Default panel contents -->
                                        <div class="panel-heading">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#CONSULTATION">PATIENT CONSULTATION</a>
                                            <span class="pull-right panel-collapse-clickable" data-toggle="collapse" data-parent="#accordion" href="#CONSULTATION">
                                                <i class="glyphicon glyphicon-chevron-down"></i>
                                            </span>
                                        </div>
                                        <!-- List group -->
                                        <div id="CONSULTATION" class="panel-collapse panel-collapse collapse">
                                            <ul class="list-group">
                                                <li class="list-group-item"><a href="mcMain2.jsp">Reprint MC</a></li>
                                                <li class="list-group-item"><a href="medicalReportMain.jsp">Reprint Medical Report</a></li>
                                                <li class="list-group-item"><a href="timeSlipMain.jsp">Reprint Time Slip</a></li>
                                            </ul>
                                        </div>
                                        <!-- Default panel contents -->

                                        <!-- Default panel contents -->
                                        <div class="panel-heading">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#PHARMACY">PHARMACY INFO SYSTEM</a>
                                            <span class="pull-right panel-collapse-clickable" data-toggle="collapse" data-parent="#accordion" href="#PHARMACY">
                                                <i class="glyphicon glyphicon-chevron-down"></i>
                                            </span>
                                        </div>
                                        <!-- List group -->
                                        <div id="PHARMACY" class="panel-collapse panel-collapse collapse">
                                            <ul class="list-group">
                                                <li class="list-group-item"><a href="psMain.jsp">Prescription Slip</a></li>
                                                <li class="list-group-item"><a href="dsMain.jsp">Dispensing Sheet</a></li>
                                            </ul>
                                        </div>
                                        <!-- Default panel contents -->

                                        <!-- Default panel contents -->
                                        <!--                                        <div class="panel-heading">
                                                                                    <a data-toggle="collapse" data-parent="#accordion" href="#LABORATORY">LABORATORY INFO SYSTEM</a>
                                                                                    <span class="pull-right panel-collapse-clickable" data-toggle="collapse" data-parent="#accordion" href="#LABORATORY">
                                                                                        <i class="glyphicon glyphicon-chevron-down"></i>
                                                                                    </span>
                                                                                </div>
                                                                                 List group 
                                                                                <div id="LABORATORY" class="panel-collapse panel-collapse collapse">
                                                                                    <ul class="list-group">
                                                                                        <li class="list-group-item"><a href="">Insert Report Menu</a></li>
                                                                                    </ul>
                                                                                </div>-->
                                        <!-- Default panel contents -->

                                        <!-- Default panel contents -->
                                        <!--                                        <div class="panel-heading">
                                                                                    <a data-toggle="collapse" data-parent="#accordion" href="#INPATIENT">INPATIENT MANAGEMENT</a>
                                                                                    <span class="pull-right panel-collapse-clickable" data-toggle="collapse" data-parent="#accordion" href="#INPATIENT">
                                                                                        <i class="glyphicon glyphicon-chevron-down"></i>
                                                                                    </span>
                                                                                </div>
                                                                                 List group 
                                                                                <div id="INPATIENT" class="panel-collapse panel-collapse collapse">
                                                                                    <ul class="list-group">
                                                                                        <li class="list-group-item"><a href="">Insert Report Menu</a></li>
                                                                                    </ul>
                                                                                </div>-->
                                        <!-- Default panel contents -->

                                        <!-- Default panel contents -->
                                        <!--                                        <div class="panel-heading">
                                                                                    <a data-toggle="collapse" data-parent="#accordion" href="#BILLING">BILLING SYSTEM</a>
                                                                                    <span class="pull-right panel-collapse-clickable" data-toggle="collapse" data-parent="#accordion" href="#BILLING">
                                                                                        <i class="glyphicon glyphicon-chevron-down"></i>
                                                                                    </span>
                                                                                </div>
                                                                                 List group 
                                                                                <div id="BILLING" class="panel-collapse panel-collapse collapse">
                                                                                    <ul class="list-group">
                                                                                        <li class="list-group-item"><a href="">Insert Report Menu</a></li>
                                                                                    </ul>
                                                                                </div>-->
                                        <!-- Default panel contents -->

                                        <!-- Default panel contents -->
                                        <!--                                        <div class="panel-heading">
                                                                                    <a data-toggle="collapse" data-parent="#accordion" href="#APPOINTMENT">PATIENT APPOINTMENT</a>
                                                                                    <span class="pull-right panel-collapse-clickable" data-toggle="collapse" data-parent="#accordion" href="#APPOINTMENT">
                                                                                        <i class="glyphicon glyphicon-chevron-down"></i>
                                                                                    </span>
                                                                                </div>
                                                                                 List group 
                                                                                <div id="APPOINTMENT" class="panel-collapse panel-collapse collapse">
                                                                                    <ul class="list-group">
                                                                                        <li class="list-group-item"><a href="">Insert Report Menu</a></li>
                                                                                    </ul>
                                                                                </div>-->
                                        <!-- Default panel contents -->

                                        <!-- Default panel contents -->
                                        <div class="panel-heading">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#ADMINISTRATOR">SYSTEM ADMINISTRATOR</a>
                                            <span class="pull-right panel-collapse-clickable" data-toggle="collapse" data-parent="#accordion" href="#ADMINISTRATOR">
                                                <i class="glyphicon glyphicon-chevron-down"></i>
                                            </span>
                                        </div>
                                        <!-- List group -->
                                        <div id="ADMINISTRATOR" class="panel-collapse panel-collapse collapse">
                                            <ul class="list-group">
                                                <li class="list-group-item"><a href="dataAnalysisMain.jsp">Data Analysis</a></li>
                                                <li class="list-group-item"><a href="ICD10Main.jsp">ICD10 </a></li>
                                                <li class="list-group-item"><a href="laporanKosPerubatan.jsp">Report Health Cost </a></li>
                                                <li class="list-group-item"><a href="drugOrderList.jsp">Total Drug Cost </a></li>

                                            </ul>
                                        </div>
                                        <!-- Default panel contents -->

                                        <!-- Default panel contents -->
                                        <!--                                        <div class="panel-heading">
                                                                                    <a data-toggle="collapse" data-parent="#accordion" href="#KIOSK">KIOSK</a>
                                                                                    <span class="pull-right panel-collapse-clickable" data-toggle="collapse" data-parent="#accordion" href="#KIOSK">
                                                                                        <i class="glyphicon glyphicon-chevron-down"></i>
                                                                                    </span>
                                                                                </div>
                                                                                 List group 
                                                                                <div id="KIOSK" class="panel-collapse panel-collapse collapse">
                                                                                    <ul class="list-group">
                                                                                        <li class="list-group-item"><a href="">Insert Report Menu</a></li>
                                                                                    </ul>
                                                                                </div>-->
                                        <!-- Default panel contents -->

                                        <!-- Default panel contents -->
                                        <!--                                        <div class="panel-heading">
                                                                                    <a data-toggle="collapse" data-parent="#accordion" href="#RADIOLOGY">RADIOLOGY INFO SYSTEM</a>
                                                                                    <span class="pull-right panel-collapse-clickable" data-toggle="collapse" data-parent="#accordion" href="#RADIOLOGY">
                                                                                        <i class="glyphicon glyphicon-chevron-down"></i>
                                                                                    </span>
                                                                                </div>
                                                                                 List group 
                                                                                <div id="RADIOLOGY" class="panel-collapse panel-collapse collapse">
                                                                                    <ul class="list-group">
                                                                                        <li class="list-group-item"><a href="">Insert Report Menu</a></li>
                                                                                    </ul>
                                                                                </div>-->
                                        <!-- Default panel contents -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script>

            //    $("#test").load("libraries/reportSideMenus.jsp");
            //    $("#head").load("libraries/reportHeader.jsp");
            //    $("#top").load("libraries/reportTopMenus.jsp");

            var disciplineData = [];
            if ("<%=dis_names%>" !== "")
            {
                var temp = "<%=dis_names%>".split("^");

                var z;
                for (z = 0; z < temp.length; z++)
                {
                    var splitTemp = temp[z].split("|");
                    newObj = {
                        name: splitTemp[1],
                        code: splitTemp[0]
                    };

//                    console.log(newObj);
                    disciplineData.push(newObj);
                }
            }

            var yyyyMMddHHmmss;
            var HHmmss;
            var yyyyMMdd;
            var ddMMyyyy;
            var timeStamp;
            var pmi_no;
            var user_id;
            var user_name;
            var curYear;
            //function to get date 
            function getDateNow() {
                //yyyy-MM-dd HH:mm:ss
                var nowDate = new Date();
                timeStamp = nowDate;
                var ZeroMinutes, ZeroSeconds, ZeroDay, ZeroMonth;
                //months
                var month = (nowDate.getMonth() + 1);
                if (month < 10) {
                    ZeroMonth = "0" + month;
                } else {
                    ZeroMonth = month;
                }
                //days
                var day = (nowDate.getDate());
                if (day < 10) {
                    ZeroDay = "0" + day;
                } else {
                    ZeroDay = day;
                }
                //years
                var year = (nowDate.getFullYear());
                curYear = year;
                //hours
                var hours = nowDate.getHours();
                //minutes
                var minutes = nowDate.getMinutes();
                if (minutes < 10) {
                    ZeroMinutes = "0" + minutes;
                } else {
                    ZeroMinutes = minutes;
                }
                //seconds
                var seconds = nowDate.getSeconds();
                if (seconds < 10) {
                    ZeroSeconds = "0" + seconds;
                } else {
                    ZeroSeconds = seconds;
                }
                //complete day
                yyyyMMddHHmmss = year + "-" + ZeroMonth + "-" + ZeroDay + " " + hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
                HHmmss = hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
                yyyyMMdd = year + "-" + ZeroMonth + "-" + ZeroDay;
                ddMMyyyy = ZeroDay + "-" + ZeroMonth + "-" + year;
//                ddMMyyyyHHmmss = ZeroDay + "/" + ZeroMonth + "/" + year + " " + hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
//                HHmmss = hours + ":" + ZeroMinutes + ":" + ZeroSeconds;
//                ddMMyyyy = ZeroDay + "/" + ZeroMonth + "/" + year;
            }

            viewPAGraph();
            function viewPAGraph() {

                getDateNow();
                var startDate, endDate, hfc, dis = "", sortBy = "", discipline = "", occupation, url;
                startDate = curYear + '-01-01';
                endDate = yyyyMMdd;
                hfc = "<%=hfc%>";
                discipline = 'Outpatient';

                var result = [];
                if (disciplineData.length > 0 && discipline !== "")
                {
                    result = disciplineData.filter(function (obj) {

//                        console.log((obj.name.toLowerCase().search(discipline.toLowerCase())) > -1);
                        return (obj.name.toLowerCase().search(discipline.toLowerCase())) > -1;
                    });
//                    console.log(result);
                }
                dis = result[0].code;

                var data = {
                    startDate: startDate,
                    endDate: endDate,
                    hfc: hfc,
                    dis: dis
                };
                 console.log(data);
                $.ajax({
                    type: "POST",
                    url: 'MainMenuInpatientGraph.jsp',
                    data: data,
                    timeout: 10000,
                    success: function (reply) {
                        $("#ALGraph").html(reply.trim());
                    },
                    error: function (err) {
                        console.log("ERROR: " + err);
                    }

                });

            }


        </script>


    </body>
</html>