<%-- 
    Document   : MainMenu
    Created on : Feb 19, 2017, 12:01:30 AM
    Author     : User

    --------------------------------------------------------------------------
    Modified by: Ardhi Surya on 12/9/2017
    Creating dashboard statistic for top ten drugs, top ten diseases (ICD-10)
    Number of inpatient and outpatient
    ---------------------------------------------------------------------------
--%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>

<%

    Conn conn = new Conn();
    String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
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


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--header -->
        <script src="../assets/js/jquery.min.js"></script>

        <%@include file = "../assets/header.html" %>
        <link href="../assets/css/mystyles.css" rel="stylesheet">
        <link href="../assets/css/jquery-ui.css" rel="stylesheet">
        <script src="../assets/js/Chart.bundle.js" type="text/javascript"></script>
        <!--<script src="https://code.highcharts.com/highcharts.src.js"></script>-->

        <script src="../assets/js/highcharts.js" type="text/javascript"></script>
        <script src="../assets/js/highcharts-exporting.js" type="text/javascript"></script>


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

                            <div class="thumbnail">
                                <div id="ALGraph"></div>
                            </div>
                        </div>

                    </div>


                    <div class="row">
                        <div class="col-md-12">

                            <div class="thumbnail" style="margin-bottom: 5px;">
                                <div class="text-center h3" style="margin: 0;">
                                    Statistic of <span id="REP_statTitle"></span> 
                                    <span class="pull-right" >
                                        <a id="REP_btnRefresh" title="Refresh the statistic.">
                                            <i class="fa fa-refresh"></i>  
                                        </a>
                                        <a id="REP_btnSetModal" title="Set statistic period.">
                                            <i class="fa fa-cog"></i>  
                                        </a>                                       
                                    </span>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="row">
                        <div class="col-md-12 text-center">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="thumbnail" id="MM_stat_inpatient">
                                        <div class="text-center">
                                            <div class="bed-booking-title">Total InPatient</div>

                                            <span class="bed-booking-total">500</span>
                                            <div>
                                                <span class="bed-booking-a" style="color: deepskyblue"><i class="fa fa-square"></i> Males:&nbsp;<%=0%></span> 
                                                <span class="bed-booking-p" style="color: hotpink"><i class="fa fa-square"></i> Females:&nbsp;<%=0%></span>
                                                <span class="bed-booking-o" style="color: green"><i class="fa fa-square"></i> Others:&nbsp;<%=0%></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="thumbnail" id="MM_stat_outpatient">
                                        <div class="text-center">
                                            <div class="bed-booking-title">Total OutPatient</div>

                                            <span class="bed-booking-total"><%=0%></span>
                                            <div>
                                                <span class="bed-booking-a" style="color: deepskyblue"><i class="fa fa-square"></i> Males:&nbsp;<%=0%></span> 
                                                <span class="bed-booking-p" style="color: hotpink"><i class="fa fa-square"></i> Females:&nbsp;<%=0%></span>
                                                <span class="bed-booking-o" style="color: green"><i class="fa fa-square"></i> Others:&nbsp;<%=0%></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-4">
                                <div class="thumbnail" id="MM_stat_icd10" >
                                    <img src="img/ajax-loader.gif">
                                </div>

                            </div>

                            <div class="col-md-4">
                                <div class="thumbnail" id="MM_stat_complaint" >
                                    <img src="img/ajax-loader.gif">
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="thumbnail" id="MM_stat_drug" >
                                    <img src="img/ajax-loader.gif">
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="row">

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

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Add Modal Start -->
        <div class="modal fade" id="REP_setModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i></button>
                        <h3 class="modal-title"> Set Statistic Time Frame</h3>
                    </div>
                    <div class="modal-body">

                        <!-- content goes here -->
                        <form class="form-horizontal" id="REP_setForm" autocomplete="off">

                            <!-- Text input-->
                            <div class="form-group">
                                <label class="col-md-4 control-label" for="textinput">View statistic by </label>
                                <div class="col-md-8">
                                    <select class="form-control" id="REP_viewBy">
                                        <option value="d">Day</option>
                                        <option value="m">Month</option>
                                        <option value="y">Year</option>
                                        <option value="x">Select date</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Text input-->
                            <div class="form-group rep_div_hs" id="REP_dateDiv">
                                <label class="col-md-4 control-label" for="textinput">Date </label>
                                <div class="col-md-8">
                                    <input readonly id="REP_date" class="form-control" placeholder="Pick a date.">
                                </div>
                            </div>

                            <div class="rep_div_hs" id="REP_dateRangeDiv" style="display: none;">
                                <!-- Text input-->
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="textinput">From </label>
                                    <div class="col-md-8">
                                        <input readonly id="REP_dateFrom" class="form-control" placeholder="Pick a start date">
                                    </div>
                                </div>

                                <!-- Text input-->
                                <div class="form-group ">
                                    <label class="col-md-4 control-label" for="textinput">To</label>
                                    <div class="col-md-8">
                                        <input readonly id="REP_dateTo" class="form-control" placeholder="Pick an end date. Please pick start date first.">
                                    </div>
                                </div>
                            </div>

                        </form>
                        <!-- content goes here -->
                    </div>
                    <div class="modal-footer">
                        <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                            <div class="btn-group" role="group">
                                <button type="submit" class="btn btn-success btn-block btn-lg" role="button" id="REP_btnSet">Set</button>
                            </div>
                            <div class="btn-group" role="group">
                                <button type="reset" id="REP_btnReset" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button" >Cancel</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Add Modal End -->  

        <script src="../assets/js/bootstrap.min.js"></script>
        <script src="../assets/js/jquery-ui.js"></script>
        <script src="../assets/js/create_destroy_loading.js"></script>
        <script>
            $(function () {

                //MM_getOutpatientStatistic();
                //MM_getDiagnosisStatistic();
                //MM_getChiefComolaintStatistic();
                //MM_getDrugStatistic();
                $('#REP_date').datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'yy-mm-dd',
                    yearRange: '1990:+0',
                    maxDate: '+0d'
                });

                $('#REP_date').datepicker('setDate', '+0');
                $('#REP_viewBy').val("d");
                $('#REP_btnSet').click();
                //MM_getInpatientStatistic();
            });

            $('#REP_date').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'yy-mm-dd',
                yearRange: '1990:+0',
                maxDate: '+0d'
            });

            //--- initialise datepicker for from ----
            $('#REP_dateFrom').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'yy-mm-dd',
                yearRange: '1990:+0',
                maxDate: '+0d'
            });

            //--- initialise datepicker for to after changes on from ------------
            $('#REP_dateFrom').on('change', function () {

                $("#REP_dateTo").datepicker("destroy");
                $('#REP_dateTo').val('');
                var fromDate = $("#REP_dateTo").datepicker("getDate");

                $('#REP_dateTo').datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'yy-mm-dd',
                    yearRange: '1990:+0',
                    minDate: fromDate,
                    maxDate: '+0d'
                });

            });

            $('#REP_viewBy').on('change', function () {
                var x = $(this).val();
                $('.rep_div_hs').hide();

                if (x === "x") {
                    $('#REP_dateRangeDiv').show();
                } else {
                    $('#REP_dateDiv').show();
                }
            });

            function MM_getInpatientStatistic() {

                var data = {
                    how: $('#REP_viewBy').val(),
                    leDate: $('#REP_date').val(),
                    dateFrom: $('#REP_dateFrom').val(),
                    dateTo: $('#REP_dateTo').val()
                };

                createScreenLoading();
                $.ajax({
                    timeout: 60000,
                    data: data,
                    type: 'POST',
                    url: "MainMenu_control/getInpatientStatistic.jsp",
                    success: function (data, textStatus, jqXHR) {
                        $('#MM_stat_inpatient').html(data);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $('#MM_stat_inpatient').html("Oopps! " + errorThrown);
                    },
                    complete: function (jqXHR, textStatus) {
                        MM_getOutpatientStatistic();
                    }

                });
            }

            function MM_getOutpatientStatistic() {

                var data = {
                    how: $('#REP_viewBy').val(),
                    leDate: $('#REP_date').val(),
                    dateFrom: $('#REP_dateFrom').val(),
                    dateTo: $('#REP_dateTo').val()
                };
                
                $.ajax({
                    timeout: 60000,
                    type: 'POST',
                    data: data,
                    url: "MainMenu_control/getOutpatientStatistic.jsp",
                    success: function (data, textStatus, jqXHR) {
                        $('#MM_stat_outpatient').html(data);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $('#MM_stat_outpatient').html("Oopps! " + errorThrown);
                    },
                    complete: function (jqXHR, textStatus) {
                        MM_getDiagnosisStatistic();
                    }

                });

            }

            function MM_getDiagnosisStatistic() {
                
                 var data = {
                        how: $('#REP_viewBy').val(),
                        leDate: $('#REP_date').val(),
                        dateFrom: $('#REP_dateFrom').val(),
                        dateTo: $('#REP_dateTo').val()
                    };
                
                $.ajax({
                    timeout: 120000,
                    data: data,
                    type: 'POST',
                    url: "MainMenu_control/getDiagnosisStatistic.jsp",
                    success: function (data, textStatus, jqXHR) {
                        $('#MM_stat_icd10').html(data);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $('#MM_stat_icd10').html("Oopps! " + errorThrown);
                    },
                    complete: function (jqXHR, textStatus) {
                        MM_getChiefComolaintStatistic();
                    }

                });
            }

            function MM_getChiefComolaintStatistic() {
                
                var data = {
                        how: $('#REP_viewBy').val(),
                        leDate: $('#REP_date').val(),
                        dateFrom: $('#REP_dateFrom').val(),
                        dateTo: $('#REP_dateTo').val()
                    };
                    
                $.ajax({
                    timeout: 60000,
                    data:data,
                    type: 'POST',
                    url: "MainMenu_control/getCheifComplaintStatistic.jsp",
                    success: function (data, textStatus, jqXHR) {
                        $('#MM_stat_complaint').html(data);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $('#MM_stat_complaint').html("Oopps! " + errorThrown);
                    },
                    complete: function (jqXHR, textStatus) {
                        MM_getDrugStatistic();
                    }

                });

            }

            function MM_getDrugStatistic() {
                
                 var data = {
                        how: $('#REP_viewBy').val(),
                        leDate: $('#REP_date').val(),
                        dateFrom: $('#REP_dateFrom').val(),
                        dateTo: $('#REP_dateTo').val()
                    };
                    
                $.ajax({
                    timeout: 60000,
                    data: data,
                    type: 'POST',
                    url: "MainMenu_control/getDrugStatistic.jsp",
                    success: function (data, textStatus, jqXHR) {
                        $('#MM_stat_drug').html(data);
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $('#MM_stat_drug').html("Oopps! " + errorThrown);
                    },
                    complete: function (jqXHR, textStatus) {
                        viewPAGraph();
                    }

                });
            }

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

                    console.log(newObj);
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
                    console.log(result);
                }
                //dis = result[0].code;

                var data = {
                    startDate: startDate,
                    endDate: endDate,
                    hfc: hfc
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
                    },
                    complete: function (jqXHR, textStatus) {
                        destroyScreenLoading();
                    }

                });

            }

            $('#REP_btnSetModal').on('click', function () {
                $('#REP_setModal').modal('show');
            });

            $('#REP_btnSet').on('click', function () {
                var how = $('#REP_viewBy').val();
                var leDate = $('#REP_date').val();
                var dateFrom = $('#REP_dateFrom').val();
                var dateTo = $('#REP_dateTo').val();

                if (how === "x" && (dateFrom === "" || dateTo === "")) {
                    bootbox.alert("Please pick date from and date to!");
                } else if (leDate === "") {
                    bootbox.alert("Please pick the date!");
                } else {
                    $('#REP_setModal').modal('hide');
                    MM_getInpatientStatistic();
                    var monthNames = $('#REP_date').datepicker("option", "monthNames");
                    var tarikh = $('#REP_date').datepicker('getDate');
                    var title = "";

                    if (how === "d") {
                        title = "Date " + $('#REP_date').val();
                    } else if (how === "m") {
                        title = "Month " + monthNames[tarikh.getMonth()] + " " + tarikh.getFullYear();
                    } else if (how === "y") {
                        title = "Year " + tarikh.getFullYear();
                    } else {
                        title = $('#REP_dateFrom').val() + " until " + $('#REP_dateTo').val();
                    }

                    $('#REP_statTitle').text(title);
                }
            });

            $('#REP_btnRefresh').on('click', function () {
                $('#REP_btnSet').click();
            });


        </script>


    </body>
</html>