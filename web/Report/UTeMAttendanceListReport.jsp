<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>

<%    Config.getBase_url(request);
    Config.getFile_url(session);
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = (String) session.getAttribute("DISCIPLINE_CODE");
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
    String hfc_name = session.getAttribute("HFC_NAME").toString();
    String dis_names = "";
    String dis_name_query = "SELECT discipline_cd, discipline_name FROM adm_discipline WHERE discipline_hfc_cd='" + hfc + "'"
            + " and (discipline_name like '%Inpatient%' or discipline_name like '%Outpatient%')  ";
    ArrayList<ArrayList<String>> mysqldis_name = conn.getData(dis_name_query);
    for (int x = 0; x < mysqldis_name.size(); x++) {
        dis_names += mysqldis_name.get(x).get(0) + "|" + mysqldis_name.get(x).get(1);
        if (x < mysqldis_name.size() - 1) {
            dis_names += "^";
        }
    }

%>

<%    String hfc_cd = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc + "'";
    ArrayList<ArrayList<String>> mysqlhfc_cd = conn.getData(hfc_cd);
    LocalDate localDate = LocalDate.now();
    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Attendance List Report</title>


        <script src="../assets/js/jquery.min.js"></script>
        <script src="../assets/js/jquery-ui.js" type="text/javascript"></script>
        <script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>

        <%@include file="../assets/header.html"%>
        <link href="../assets/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css"/>

<!--        <script src="https://code.highcharts.com/highcharts.js"></script>
        <script src="https://code.highcharts.com/modules/exporting.js"></script>-->
        
        <script src="../assets/js/highcharts-exporting.js" type="text/javascript"></script>
        <script src="../assets/js/highcharts.js" type="text/javascript"></script>
        
    </head>
    <body>
        <!-- side bar -->
        <%@ include file ="libraries/reportSideMenus.jsp" %>
        <!-- side bar -->
        <div class="main" style="background: #f2ff4f8;"> 
            <!-- menu top -->
            <%@ include file ="libraries/reportTopMenus.jsp" %>
            <!-- menu top -->
            <div class="container-fluid">
                <div class="row">


                    <div class="thumbnail">
                        <form>
                            <h3 style="margin: 0px;">Patient Attendance</h3>
                            <hr class="pemisah"/>
                            <div class="col-md-3">
                                <label class="control-label">Discipline</label>
                                <div class="form-inline"> 
                                    <div class="radio radio-primary">
                                        <input type="radio" name="radioDiscipline" id="RadioOutpatient" value="outpatient" checked>
                                        <label for="RadioOutpatient">
                                            Outpatient
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="radioDiscipline" id="RadioInpatient" value="inpatient">
                                        <label for="RadioInpatient">
                                            Inpatient
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <label class="control-label">Occupation</label>
                                <div class="form-inline"> 
                                    <div class="radio radio-primary">
                                        <input type="radio" name="radioOccupation" id="RadioStaff" value="staff" checked>
                                        <label for="RadioStaff">
                                            Staff
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="radioOccupation" id="RadioStudent" value="student">
                                        <label for="RadioStudent">
                                            Student
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <label class="control-label">Sort By</label>
                                <div class="form-inline">   
                                    <div class="radio radio-primary">
                                        <input type="radio" name="radioSortBY" id="radioSortBYGender" value="gender" checked>
                                        <label for="radioSortBYGender">
                                            Gender
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="radioSortBY" id="radioSortBYAge" value="ageRange">
                                        <label for="radioSortBYAge">
                                            Age Range
                                        </label>
                                    </div>
                                    <div class="radio radio-primary">
                                        <input type="radio" name="radioSortBY" id="radioSortBYCenterCode" value="centerCode">
                                        <label for="radioSortBYCenterCode">
                                            Center
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="text-center" style="margin: auto">
                                    <button class="btn btn-primary btn-lg" type="button" id="patientAttandanceViewReportBtn" name="patientAttandanceViewReport"><i class="fa fa-search fa-lg" ></i>&nbsp; View</button>
                                </div>
                            </div>
                        </form>
                        <div id="ALGraph">

                        </div>
                    </div>


                    <div class="thumbnail">
                        <form>
                            <h4 style="margin: 0px; padding: 0;">Patients Attendance List</h4>
                            <hr class="pemisah"/>
                            <div class="form-group col-md-12" id="ReportFilturediv">
                                <lebal class="col-md-4 control-label">BY:</lebal>
                                <div class="col-md-4">
                                    <select id="patientType" class="form-control">
                                        <option>Inpatient</option>
                                        <option>Outpatient</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group col-md-12">
                                <label class="col-md-1 control-label" for="textinput">Date:</label>
                                <label class="col-md-1 control-label" style="text-align: right; padding-top: 10px;" for="textinput">From</label>
                                <div class="col-md-3">
                                    <input type="text" class="form-control input-md" id="dateFrom" name="dateFrom" placeholder="Select Start Date" maxlength=""/>
                                </div>
                                <label class="col-md-1 control-label" style="text-align: right; padding-top: 10px;" for="textinput">To</label>
                                <div class="col-md-3">
                                    <input type="text" class="form-control input-md" id="dateTo" name="dateTo" placeholder="Select End Date" maxlength=""/>
                                </div>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-primary" type="button" id="searchPatientAttendance" name="searchPatientAttendance"><i class="fa fa-search fa-lg" ></i>&nbsp; Search</button>

                                <button id="clearSearch" name="clearSearch" type="clear" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
                            </div>
                        </form>
                    </div>


                    <div class="thumbnail">
                        <div id="UTeMAttendanceListReportTable">

                            <table  id="UTemPAReport"  class="table table-striped table-bordered" cellspacing="0" width="100%">
                                <thead >
                                <th style="text-align: center;">Patient Name</th>
                                <th style="text-align: center;">Patient IC No.</th>
                                <th style="text-align: center;">Patient Gander</th>
                                <th style="text-align: center;">Consulting Doctor</th>
                                <th style="text-align: center;">Episode Date</th>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>

                        <div class="row" id="data">
                            <!-- content goes here -->
                            <form class="form-horizontal" id="addForm">

                                <!-- Text input-->
                                <div class="form-group" id="reportTotalPatientDiv" style="display: none; margin: 20px 20px 0 0;">
                                    <label class="col-md-5 control-label" for="textinput">Total Patients</label>
                                    <div class="col-md-4">
                                        <input id="reportAttendanceTotalPatient" name="reportAttendanceTotalPatient" type="number" placeholder="Total Patients" class="form-control input-md" maxlength="50" value="" readonly>
                                    </div>
                                </div>

                            </form>
                        </div>


                    </div>
                </div>
            </div>

        </div>
        <script src="../assets/js/jquery-1.12.4.js" type="text/javascript"></script>
        <script src="../assets/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../assets/js/dataTables.buttons.min.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.flash.min.js" type="text/javascript"></script>
        <script src="../assets/js/jszip.min.js" type="text/javascript"></script>
        <script src="../assets/js/pdfmake.min.js" type="text/javascript"></script>
        <script src="../assets/js/vfs_fonts.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.html5.min.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.print.min.js" type="text/javascript"></script>
        <script src="https://cdn.datatables.net/buttons/1.0.3/js/buttons.colVis.js"></script>



        <script>
//            $("#dateFrom").datepicker({dateFormat: 'dd/mm/yy'});
//            $("#dateTo").datepicker({dateFormat: 'dd/mm/yy'});

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

            $("#patientAttandanceViewReportBtn").click(function () {
                viewPAGraph();
            });

            function viewPAGraph() {

                getDateNow();
                var startDate, endDate, hfc, dis = "", sortBy = "", discipline = "", occupation, url;
                startDate = curYear + '-01-01';
                endDate = yyyyMMdd;
                hfc = "<%=hfc%>";
                sortBy = $("input[name='radioSortBY']:checked").val();
                occupation = $("input[name='radioOccupation']:checked").val();
                discipline = $("input[name='radioDiscipline']:checked").val();

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

                if (sortBy === "gender") {
                    url = "UTeMAttendanceListGraphByGender.jsp";
                } else if (sortBy === "ageRange") {
                    url = "UTeMAttendanceListGraphByAgeRange.jsp";
                } else if (sortBy === "centerCode") {
                    url = "UTeMAttendanceListGraphByCenterCode.jsp";
                } else {
                    alert("Uncorrect Type of Sort");
                }

                var data = {
                    startDate: startDate,
                    endDate: endDate,
                    hfc: hfc,
                    dis: dis,
                    patientType: occupation
                };
                $.ajax({
                    type: "POST",
                    url: url,
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

            $("#dateFrom").datepicker({
                dateFormat: 'dd/mm/yy',
                yearRange: '1999:c+1',
                changeMonth: true,
                changeYear: true,
                minDate: new Date(1999, 10 - 1, 25),
                maxDate: '+30Y',
                onSelect: function (selected) {

                    $("#dateTo").datepicker("option", "minDate", selected);

                }
            });

            $("#dateTo").datepicker({
                dateFormat: 'dd/mm/yy',
                yearRange: '1999:c+1',
                changeMonth: true,
                changeYear: true,
                minDate: new Date(1999, 10 - 1, 25),
                maxDate: '+30Y',
                onSelect: function (selected) {

                    $("#dateFrom").datepicker("option", "maxDate", selected);

                }
            });



            $("#searchPatientAttendance").click(function () {
                var patientType, startDate, endDate;

                patientType = $("#patientType").val();
                startDate = $("#dateFrom").val();
                endDate = $("#dateTo").val();


                if (startDate === "") {
                    alert("Select Start Date.");
                } else if (endDate === "") {
                    alert("Select End Date.");
                } else if (convfertDate(startDate) > convfertDate(endDate)) {
                    alert("Incorrect date range, Start-Date Should be before End-Date.");
                } else {

                    var temp = startDate.split("/");
                    startDate = temp[2] + "-" + temp[1] + "-" + temp[0];

                    temp = endDate.split("/");
                    endDate = temp[2] + "-" + temp[1] + "-" + temp[0];


                    var data = {
                        "patientType": patientType,
                        "startDate": startDate,
                        "endDate": endDate,
                        "hfc": "<%=hfc%>"
                    };
                    $.ajax({
                        type: "POST",
                        url: "UTeMAttendanceListReportControler.jsp",
                        data: data,
                        timeout: 10000,
                        success: function (reply) {
                            if (reply.trim() !== "No Data")
                            {
                                var dataRow = reply.trim().split("^");

                                var trHTML = '';
                                var i;
                                for (i = 0; i < dataRow.length; i++)
                                {
                                    var datas = dataRow[i].split("|");
                                    if (patientType === "Outpatient") {
                                        trHTML += '<tr><td>' + datas[1] + '</td><td>' + datas[0] + '</td>\n\
                                    <td>' + datas[3] + '</td><td>' + datas[5] + '</td><td>' + datas[6] + '</td></tr>';
                                    } else if (patientType === "Inpatient") {

                                        trHTML += '<tr><td>' + datas[1] + '</td><td>' + datas[0] + '</td>\n\
                                    <td>' + datas[3] + '</td><td>' + datas[4] + '</td><td>' + datas[5] + '</td></tr>';

                                    }


                                }
                                $('#UTemPAReport').append(trHTML);
                                $('#UTemPAReport').DataTable({
                                    pageLength: 15,
                                    initComplete: function (settings, json) {
                                        $('.loading').hide();
                                    },
                                    "order": [[4, "asc"]],
                                    dom: 'Bfrtip',
                                    buttons: [
                                        {
                                            extend: 'excelHtml5',
                                            text: 'Export To Excel',
                                            title: 'Patient Attendance List, From ' + startDate + ' To ' + endDate,
                                            className: 'btn btn-primary',
                                            exportOptions: {
                                                columns: ':visible'
                                            }
                                        }, {
                                            extend: 'csvHtml5',
                                            text: 'Export To Excel CSV',
                                            title: 'Patient Attendance List, From ' + startDate + ' To ' + endDate,
                                            className: 'btn btn-primary',
                                            exportOptions: {
                                                columns: ':visible'
                                            }
                                        }, {
                                            extend: 'print',
                                            text: 'Print Attendance List',
                                            title: '',
                                            message: '<br><br>',
                                            className: 'btn btn-primary',
                                            customize: function (win) {
                                                $(win.document.body)
                                                        .css('font-size', '10pt')
                                                        .prepend(
                                                                '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Patient Attendance List</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong>PMS-001</strong></dd>\n\
                                        </div> \n\
                                        <div style="margin: 30px 0 0 0; font-size: 15px;"> \n\
                                        <p>Facility: <strong><%=hfc_name%></strong></p>\n\
                                        <p>Discipline: <strong>' + patientType + '</strong></p>\n\
                                        <p>Date: From <strong>' + startDate + ' </strong>  To <strong>' + endDate + '</strong> </p>\n\
                                        </div> '
                                                                );
                                                $(win.document.body).find('table')
                                                        .addClass('compact')
                                                        .css('font-size', 'inherit');
                                                $(win.document.body)
                                                        .css('font-size', '10pt')
                                                        .css('font-weight', 'bolder')
                                                        .append('<div style="text-align: right;padding-top:10px;"><br> Patient Total = ' + dataRow.length + ' </div>');
                                                $(win.document.body)
                                                        .css('font-size', '10pt')
                                                        .append('<div style="text-align: center;padding-top:30px;"><br> ***** &nbsp;&nbsp;  End Of Report  &nbsp;&nbsp;  ***** </div>');

                                            },
                                            exportOptions: {
                                                columns: ':visible'
                                            }
                                        },
                                        {
                                            extend: 'colvis',
                                            text: 'Filter Table Columns',
                                            className: 'btn btn-success'
                                        }
                                    ]
                                });
                                $('#reportTotalPatientDiv').css("display", "block");
                                $("#reportAttendanceTotalPatient").val(dataRow.length);
                                $("#searchPatientAttendance").prop("disabled", true);
                            } else if (reply.trim() === "No Data") {
                                alert("There is no patient in this time range !!");
                            }
                        },
                        error: function (err) {
                            console.log("ERROR: " + err);
                        }
                    });
                }

            });

            function convfertDate(cDate) {

                var temp = cDate.split("/");
                cDate = temp[2] + "-" + temp[1] + "-" + temp[0];
                console.log(new Date(cDate));
                return new Date(cDate);


            }


        </script>
    </body>
</html>