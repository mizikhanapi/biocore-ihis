<%-- 
    Document   : manageReport
    Created on : Feb 27, 2017, 11:36:51 AM
    Author     : Shammugam
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>
<%@include file="../Entrance/validateSession.jsp" %>
<%
    Config.getFile_url(session);
    Config.getBase_url(request);

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


        <script src="old/assets/js/jquery.min.js"></script>
        <link rel="stylesheet" href="old/assets/css/loading.css">
        <link href="old/assets/datepicker/jquery-ui.css" rel="stylesheet">    
        <script src="old/assets/js/form-validator.min.js"></script>
        <script src="old/assets/js/bootstrap.min.js"></script> 
        <script src="old/assets/js/bootbox.min.js"></script>
        <script src="old/assets/datepicker/jquery-ui.js"></script>
        <script src="old/assets/js/searchDisipline.js" type="text/javascript"></script>
        <script src="../PMS/libraries/lib/js/search/searchDisipline.js" type="text/javascript"></script>
        <script src="old/assets/js/WardMain.js" type="text/javascript"></script>
        <script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>
        <!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>-->
        <!--        <script type="text/javascript" src="../javascript.js"></script>-->
        <script src="old/assets/js/OccuPatient.js" type="text/javascript"></script>
        <script src="old/assets/js/onKeyPress.js" type="text/javascript"></script>
        <script src="old/assets/js/IPMain.js" type="text/javascript"></script>
        <script src="old/assets/js/onKeyPress.js" type="text/javascript"></script>

        <!-- header -->
        <%@include file = "../assets/header.html" %>

        <!-- header -->
    </head>

    <body>

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
                        <div class="col-md-12" style="height: 100%;">
                            <div class="thumbnail">

                                <!-- Tab Menu -->
                                <div class="tabbable-panel">
                                    <div class="tabbable-line">
                                        <ul class="nav nav-tabs ">
                                            <li class="active">
                                                <a href="#tab_default_1" data-toggle="tab">
                                                   DAILY REPORT </a>
                                            </li>
                                            <li>
                                                <a href="#tab_default_2" data-toggle="tab">
                                                    MONTHLY REPORT  </a>
                                            </li>
                                            <li>
                                                <a href="#tab_default_3" data-toggle="tab">
                                                    YEARLY REPORT  </a>
                                            </li>
                                        </ul>
                                        <!-- tab content -->
                                      
                                        
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_default_1">

                                                <div id="contentRDaily">

                                                    <div id="contentReportDailyTable">
                                                    </div>
                                                    <%@include file="manageReportDailyModal_DISCHARGE.jsp" %>

                                                </div>

                                            </div>
                                            <div class="tab-pane" id="tab_default_2">

                                                <div id="contentRMonthly">

                                                    <div id="contentReportMonthlyTable">
                                                    </div>
                                                    <%@include file="manageReportMonthlyModal_DISCHARGE.jsp" %>

                                                </div>

                                            </div>
                                            <div class="tab-pane" id="tab_default_3">

                                                <div id="contentRYearly">

                                                    <div id="contentReportYearlyTable">
                                                    </div>
                                                    <%@include file="manageReportYearlyModal_DISCHARGE.jsp" %>

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
<h6 id="reportEnd"> End Lah </h6>
        <!-- Placed at the end of the document so the pages load faster -->
           <script src="../assets/js/jquery-ui.js" type="text/javascript"></script>
<script src="ReportLibraries/js/bootstrap.min.js" type="text/javascript"></script>
<script src="ReportLibraries/js/bootbox.min.js" type="text/javascript"></script>
<script src="ReportLibraries/js/jquery.dataTables.min.js"></script>
<script src="ReportLibraries/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
<script src="ReportLibraries/js/dataTables.buttons.min.js" type="text/javascript"></script>
<script src="ReportLibraries/js/buttons.flash.min.js" type="text/javascript"></script>
<script src="ReportLibraries/js/jszip.min.js" type="text/javascript"></script>
<script src="ReportLibraries/js/pdfmake.min.js" type="text/javascript"></script>
<script src="ReportLibraries/js/vfs_fonts.js" type="text/javascript"></script>
<script src="ReportLibraries/js/buttons.html5.min.js" type="text/javascript"></script>
<script src="ReportLibraries/js/buttons.print.min.js" type="text/javascript"></script>
<script src="ReportLibraries/js/buttons.colVis.min.js" type="text/javascript"></script>
<script src="ReportLibraries/js/papaparse.min.js"></script>
<script src="ReportLibraries/js/jquery.multi-select.js" type="text/javascript"></script>


        <!-- Placed at the end of the document so the pages load faster -->
  <%            Conn conn = new Conn();
            String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
            String hfc_cd = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc + "'";
            ArrayList<ArrayList<String>> mysqlhfc_cd = conn.getData(hfc_cd);
            LocalDate localDate = LocalDate.now();
            String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);
        %>

         <script>

            $('<div class="loading">Loading</div>').appendTo('body');

            $(document).ready(function () {
                $("#contentReportDailyTable").load("manageReportDailyTable_DISCHARGE.jsp");
                $("#contentReportMonthlyTable").load("manageReportMonthlyTable_DISCHARGE.jsp");
                $("#contentReportYearlyTable").load("manageReportYearlyTable_DISCHARGE.jsp");
            });


            // Move to Order Details Fetch Details Start
            $('#contentRDaily').off('click', '#reportDailyTable #moveToDailySalesDetailsTButton').on('click', '#reportDailyTable #moveToDailySalesDetailsTButton', function (e) {

                // $('<div class="loading">Loading</div>').appendTo('body');

                e.preventDefault();

                $('#manageReportDailySalesDetailsTable').DataTable().destroy();


                var row = $(this).closest("tr");
                var rowData = row.find("#dataDailySalesListhidden").val();
                var arrayData = rowData.split("|");
                console.log(arrayData);

                var rdate = arrayData[0];
                var date = arrayData[3];

                var data = {
                    date: date
                };

                $.ajax({
                    url: "manageReportDailyDetailTable_DISCHARGE.jsp",
                    type: "post",
                    data: data,
                    timeout: 3000,
                    success: function (returnReportDetailsTableHTML) {
                        console.log(returnReportDetailsTableHTML);

                        var arrayData = returnReportDetailsTableHTML.split("<ShannugamRamasamySeperator></ShannugamRamasamySeperator>");

                        var table = arrayData[0];
                        var reportQuantity = arrayData[1];
                        var reportGrandTotal = arrayData[2];

                        $('#manageReportDailySalesDetailsTable').html(table);



                        $('#manageReportDailySalesDetailsTable').DataTable({
                            pageLength: 15,
                            initComplete: function (settings, json) {
                                $('.loading').hide();
                            },
                            dom: 'Bfrtip',
                            buttons: [
                                {
                                    extend: 'excelHtml5',
                                    text: 'Export To Excel',
                                    title: 'Inpatient Daily Discharge List For ' + rdate,
                                    className: 'btn btn-primary',
                                    exportOptions: {
                                        columns: ':visible'
                                    }
                                }, {
                                    extend: 'csvHtml5',
                                    text: 'Export To Excel CSV',
                                    title: 'Inpatient Daily Discharge List For ' + rdate,
                                    className: 'btn btn-primary',
                                    exportOptions: {
                                        columns: ':visible'
                                    }
                                }, {
                                    extend: 'print',
                                    text: 'Print Daily Discharge List',
                                    title: $('h1').text(),
                                    message: '<br><br>',
                                    className: 'btn btn-primary',
                                    customize: function (win) {
                                        $(win.document.body)
                                                .css('font-size', '10pt')
                                                .prepend(
                                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Daily Inpatient Discharge List For ' + rdate + '</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong>ADT-0002</strong></dd>\n\
                                        </div> '
                                                        );
                                        $(win.document.body).find('table')
                                                .addClass('compact')
                                                .css('font-size', 'inherit');
                                        $(win.document.body)
                                                .css('font-size', '10pt')
                                                .css('font-weight', 'bolder')
                                                .append('<div style="text-align: right;padding-top:10px;"><br>  Grand Total Inpatient Discharge = ' + reportQuantity + ' </div>')
                                                //.append('<div style="text-align: right;"><br> Grand Total (RM) = ' + reportGrandTotal + ' </div>');
                                        $(win.document.body)
                                                .css('font-size', '10pt')
                                                .append('<div style="text-align: center;padding-top:30px;"><br> ***** &nbsp;&nbsp;  End Of Report  &nbsp;&nbsp;  ***** </div>');

                                    },
                                    exportOptions: {
                                        columns: ':visible'
                                    }
                                }, {
                                    extend: 'colvis',
                                    text: 'Filter Table Column',
                                    className: 'btn btn-success'
                                }
                            ]
                        });

                        $('#DailySalesDetaileModal').modal('show');

                    }
                });



            });
            // Move to Order Details Fetch Details End


            // Move to Order Details Fetch Monthly Details Start
            $('#contentRMonthly').off('click', '#reportMonthlyTable #moveToMonthlySalesDetailsTButton').on('click', '#reportMonthlyTable #moveToMonthlySalesDetailsTButton', function (e) {

                // $('<div class="loading">Loading</div>').appendTo('body');

                e.preventDefault();

                $('#manageReportMonthlySalesDetailsTable').DataTable().destroy();


                var row = $(this).closest("tr");
                var rowData = row.find("#dataMonthlySalesListhidden").val();
                var arrayData = rowData.split("|");
                console.log(arrayData);

                var rdate = arrayData[0];
                var date = arrayData[3];

                var data = {
                    date: date
                };

                $.ajax({
                    url: "manageReportMonthlyDetailsTable_DISCHARGE.jsp",
                    type: "post",
                    data: data,
                    timeout: 3000,
                    success: function (returnReportDetailsTableHTML) {
                        console.log(returnReportDetailsTableHTML);

                        var arrayData = returnReportDetailsTableHTML.split("<ShannugamRamasamySeperator></ShannugamRamasamySeperator>");

                        var table = arrayData[0];
                        var reportQuantity = arrayData[1];
                        var reportGrandTotal = arrayData[2];

                        $('#manageReportMonthlySalesDetailsTable').html(table);



                        $('#manageReportMonthlySalesDetailsTable').DataTable({
                            pageLength: 15,
                            initComplete: function (settings, json) {
                                $('.loading').hide();
                            },
                            dom: 'Bfrtip',
                            buttons: [
                                {
                                    extend: 'excelHtml5',
                                    text: 'Export To Excel',
                                    title: 'Inpatient Monthly Discharge List For ' + rdate,
                                    className: 'btn btn-primary',
                                    exportOptions: {
                                        columns: ':visible'
                                    }
                                }, {
                                    extend: 'csvHtml5',
                                    text: 'Export To Excel CSV',
                                    title: 'Inpatient Monthly Discharge List For ' + rdate,
                                    className: 'btn btn-primary',
                                    exportOptions: {
                                        columns: ':visible'
                                    }
                                }, {
                                    extend: 'print',
                                    text: 'Print Monthly Discharge List',
                                    title: $('h1').text(),
                                    message: '<br><br>',
                                    className: 'btn btn-primary',
                                    customize: function (win) {
                                        $(win.document.body)
                                                .css('font-size', '10pt')
                                                .prepend(
                                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Monthly Inpatient Discharge List For ' + rdate + '</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong>ADT-0004</strong></dd>\n\
                                        </div> '
                                                        );
                                        $(win.document.body).find('table')
                                                .addClass('compact')
                                                .css('font-size', 'inherit');
                                        $(win.document.body)
                                                .css('font-size', '10pt')
                                                .css('font-weight', 'bolder')
                                                .append('<div style="text-align: right;padding-top:10px;"><br> Grand Total Inpatient Discharge : ' + reportQuantity + ' </div>')
                                                //.append('<div style="text-align: right;"><br> Grand Total (RM) : ' + reportGrandTotal + ' </div>');
                                        $(win.document.body)
                                                .css('font-size', '10pt')
                                                .append('<div style="text-align: center;padding-top:30px;"><br> ***** &nbsp;&nbsp;  End Of Report  &nbsp;&nbsp;  ***** </div>');

                                    },
                                    exportOptions: {
                                        columns: ':visible'
                                    }
                                }, {
                                    extend: 'colvis',
                                    text: 'Filter Table Column',
                                    className: 'btn btn-success'
                                }
                            ]
                        });

                        $('#MonthlySalesDetaileModal').modal('show');

                    }
                });



            });
            // Move to Order Details Fetch Monthly Details End




            // Move to Order Details Fetch Yearly Details Start
            $('#contentRYearly').off('click', '#reportYearlyTable #moveToYearlySalesDetailsTButton').on('click', '#reportYearlyTable #moveToYearlySalesDetailsTButton', function (e) {

                // $('<div class="loading">Loading</div>').appendTo('body');

                e.preventDefault();

                $('#manageReportYearlySalesDetailsTable').DataTable().destroy();


                var row = $(this).closest("tr");
                var rowData = row.find("#dataYearlySalesListhidden").val();
                var arrayData = rowData.split("|");
                console.log(arrayData);

                var rdate = arrayData[0];
                var date = arrayData[3];

                var data = {
                    date: date
                };

                $.ajax({
                    url: "manageReportYearlyDetailsTable_DISCHARGE.jsp",
                    type: "post",
                    data: data,
                    timeout: 3000,
                    success: function (returnReportDetailsTableHTML) {
                        console.log(returnReportDetailsTableHTML);


                        var arrayData = returnReportDetailsTableHTML.split("<ShannugamRamasamySeperator></ShannugamRamasamySeperator>");

                        var table = arrayData[0];
                        var reportQuantity = arrayData[1];
                        var reportGrandTotal = arrayData[2];


                        $('#manageReportYearlySalesDetailsTable').html(table);

                        $('#manageReportYearlySalesDetailsTable').DataTable({
                            pageLength: 15,
                            initComplete: function (settings, json) {
                                $('.loading').hide();
                            },
                            dom: 'Bfrtip',
                            buttons: [
                                {
                                    extend: 'excelHtml5',
                                    text: 'Export To Excel',
                                    title: 'Yearly Inpatient Discharge List For ' + rdate,
                                    className: 'btn btn-primary',
                                    exportOptions: {
                                        columns: ':visible'
                                    }
                                }, {
                                    extend: 'csvHtml5',
                                    text: 'Export To Excel CSV',
                                    title: 'Yearly Inpatient Discharge List For ' + rdate,
                                    className: 'btn btn-primary',
                                    exportOptions: {
                                        columns: ':visible'
                                    }
                                }, {
                                    extend: 'print',
                                    text: 'Print Yearly Discharge List',
                                    title: $('h1').text(),
                                    message: '<br><br>',
                                    className: 'btn btn-primary',
                                    customize: function (win) {
                                        $(win.document.body)
                                                .css('font-size', '10pt')
                                                .prepend(
                                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Inpatient Admission List For ' + rdate + '</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong>ADT-0006</strong></dd>\n\
                                        </div> '
                                                        );
                                        $(win.document.body).find('table')
                                                .addClass('compact')
                                                .css('font-size', 'inherit');
                                        $(win.document.body)
                                                .css('font-size', '10pt')
                                                .css('font-weight', 'bolder')
                                                .append('<div style="text-align: right;padding-top:10px;"><br> Grand Total Inpatient Discharge : ' + reportQuantity + ' </div>')
                                               // .append('<div style="text-align: right;"><br> Grand Total (RM) : ' + reportGrandTotal + ' </div>');
                                        $(win.document.body)
                                                .css('font-size', '10pt')
                                                .append('<div style="text-align: center;padding-top:30px;"><br> ***** &nbsp;&nbsp;  End Of Report  &nbsp;&nbsp;  ***** </div>');

                                    },
                                    exportOptions: {
                                        columns: ':visible'
                                    }
                                }, {
                                    extend: 'colvis',
                                    text: 'Filter Table Column',
                                    className: 'btn btn-success'
                                }
                            ]
                        });

                        $('#YearlySalesDetaileModal').modal('show');

                    }
                });



            });
            // Move to Order Details Fetch Details End



        </script>
        
    </body>

</html>