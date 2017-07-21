<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>

<%    //Config.getBase_url(request);
    //Config.getFile_url(session);
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = (String) session.getAttribute("DISCIPLINE_CODE");

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
                            <h3 style="margin: 0px;">Attendance List</h3>
                            <hr class="pemisah"/>
                            <div class="form-group col-md-12" id="ReportFilturediv">
                                <lebal class="col-md-4 control-label">Patient Type:</lebal>
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
                                <button class="btn btn-primary" type="button" id="searchPatientAttendance" name="searchPatientAttendance"><i class="fa fa-search fa-lg"></i>&nbsp; Search</button>

                                <button id="clearSearch" name="clearSearch" type="clear" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
                            </div>
                        </form>
                    </div>

                    <div class="thumbnail">
                        <div id="UTeMAttendanceListReportTable">

                            <table  id="UTemMCReport"  class="table table-striped table-bordered" cellspacing="0" width="100%">
                                <thead >
                                <th style="text-align: center;">Patient IC No.</th>
                                <th style="text-align: center;">Patient Name</th>
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
            $("#dateFrom").datepicker({dateFormat: 'dd/mm/yy'});
            $("#dateTo").datepicker({dateFormat: 'dd/mm/yy'});

            $("#searchPatientAttendance").click(function () {
                var patientType, startDate, endDate;

                patientType = $("#patientType").val();
                startDate = $("#dateFrom").val();
                endDate = $("#dateTo").val();
                var temp = startDate.split("/");
                startDate = temp[2] + "-" + temp[1] + "-" + temp[0];

                var temp = endDate.split("/");
                endDate = temp[2] + "-" + temp[1] + "-" + temp[0];
                if ((new Date(startDate).getTime() > new Date(endDate).getTime()))
                {
                    alert("Incorrect date range, Start-Date Should be before End-Date.");
                } else {

                    var data = {
                        "patientType": patientType,
                        "startDate": startDate,
                        "endDate": endDate
                    };
                    console.log(data);
                    $.ajax({
                        type: "POST",
                        url: "UTeMAttendanceListReportControler.jsp",
                        data: data,
                        timeout: 10000,
                        success: function (reply) {
                            if (reply.trim() !== "No Data")
                            {
                                var dataRow = reply.trim().split("^");

                                console.log(reply);

                                var trHTML = '';
                                var i;
                                for (i = 0; i < dataRow.length; i++)
                                {
                                    var datas = dataRow[i].split("|");
                                    if (patientType === "Outpatient") {
                                        trHTML += '<tr><td>' + datas[0] + '</td><td>' + datas[1] + '</td>\n\
                                    <td>' + datas[3] + '</td><td>' + datas[5] + '</td><td>' + datas[6] + '</td></tr>';
                                    } else if (patientType === "Inpatient") {

                                        trHTML += '<tr><td>' + datas[0] + '</td><td>' + datas[1] + '</td>\n\
                                    <td>' + datas[3] + '</td><td>' + datas[4] + '</td><td>' + datas[5] + '</td></tr>';

                                    }


                                }
                                $('#UTemMCReport').append(trHTML);
                                $('#UTemMCReport').DataTable({
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
                                            title: 'Patient Attendance List',
                                            className: 'btn btn-primary',
                                            exportOptions: {
                                                columns: ':visible'
                                            }
                                        }, {
                                            extend: 'csvHtml5',
                                            text: 'Export To Excel CSV',
                                            title: 'Patient Attendance List',
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
        </script>
    </body>
</html>