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

<%
    Config.getFile_url(session);
    Config.getBase_url(request);

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- header -->
        <%@include file = "libraries/pharmacyHeadLibrary.jsp" %>
        <%@include file = "../assets/header.html" %>
        <!-- header -->
    </head>

    <body>

        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->	
                <%@include file = "libraries/pharmacySideMenus.jsp" %>
                <!-- menu side -->
                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file = "libraries/pharmacyTopMenus.jsp" %>
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
                                                    MONTHLY REPORT </a>
                                            </li>
                                            <li>
                                                <a href="#tab_default_3" data-toggle="tab">
                                                    YEARLY REPORT </a>
                                            </li>
                                        </ul>
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="tab_default_1">

                                                <div id="contentRDaily">

                                                    <div id="contentReportDailyTable">
                                                    </div>
                                                    <%@include file="manageReportDailyModal.jsp" %>

                                                </div>

                                            </div>
                                            <div class="tab-pane" id="tab_default_2">

                                                <div id="contentRMonthly">

                                                    <div id="contentReportMonthlyTable">
                                                    </div>
                                                    <%@include file="manageReportMonthlyModal.jsp" %>

                                                </div>

                                            </div>
                                            <div class="tab-pane" id="tab_default_3">

                                                <div id="contentRYearly">

                                                    <div id="contentReportYearlyTable">
                                                    </div>
                                                    <%@include file="manageReportYearlyModal.jsp" %>

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

        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file = "libraries/pharmacyFootLibrary.jsp" %>
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
                $("#contentReportDailyTable").load("manageReportDailyTable.jsp");
                $("#contentReportMonthlyTable").load("manageReportMonthlyTable.jsp");
                $("#contentReportYearlyTable").load("manageReportYearlyTable.jsp");
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
                var date = arrayData[4];

                var data = {
                    date: date
                };

                $.ajax({
                    url: "manageReportDailyDetailTable.jsp",
                    type: "post",
                    data: data,
                    timeout: 3000,
                    success: function (returnReportDetailsTableHTML) {
                        console.log(returnReportDetailsTableHTML);
                        $('#manageReportDailySalesDetailsTable').html(returnReportDetailsTableHTML);

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
                                    title: 'Pharmacy Daily Dispensed Drug List For ' + rdate,
                                    className: 'btn btn-primary',
                                    exportOptions: {
                                        columns: ':visible'
                                    }
                                }, {
                                    extend: 'csvHtml5',
                                    text: 'Export To Excel CSV',
                                    title: 'Pharmacy Daily Dispensed Drug List For ' + rdate,
                                    className: 'btn btn-primary',
                                    exportOptions: {
                                        columns: ':visible'
                                    }
                                }, {
                                    extend: 'print',
                                    text: 'Print Daily Sales List',
                                    title: $('h1').text(),
                                    message: '<br><br>',
                                    className: 'btn btn-primary',
                                    customize: function (win) {
                                        $(win.document.body)
                                                .css('font-size', '10pt')
                                                .prepend(
                                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej">Pharmacy Daily Dispensed Drug List For ' + rdate + '</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong><%=newdate%></strong></dd>\n\
                                        </div> '
                                                        );
                                        $(win.document.body).find('table')
                                                .addClass('compact')
                                                .css('font-size', 'inherit');
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
                var date = arrayData[4];

                var data = {
                    date: date
                };

                $.ajax({
                    url: "manageReportMonthlyDetailsTable.jsp",
                    type: "post",
                    data: data,
                    timeout: 3000,
                    success: function (returnReportDetailsTableHTML) {
                        console.log(returnReportDetailsTableHTML);
                        $('#manageReportMonthlySalesDetailsTable').html(returnReportDetailsTableHTML);

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
                                    title: 'Pharmacy Yearly Dispensed Drug List For ' + rdate,
                                    className: 'btn btn-primary',
                                    exportOptions: {
                                        columns: ':visible'
                                    }
                                }, {
                                    extend: 'csvHtml5',
                                    text: 'Export To Excel CSV',
                                    title: 'Pharmacy Yearly Dispensed Drug List For ' + rdate,
                                    className: 'btn btn-primary',
                                    exportOptions: {
                                        columns: ':visible'
                                    }
                                }, {
                                    extend: 'print',
                                    text: 'Print Yearly Sales List',
                                    title: $('h1').text(),
                                    message: '<br><br>',
                                    className: 'btn btn-primary',
                                    customize: function (win) {
                                        $(win.document.body)
                                                .css('font-size', '10pt')
                                                .prepend(
                                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej">Pharmacy Yearly Dispensed Drug List For ' + rdate + '</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong><%=newdate%></strong></dd>\n\
                                        </div> '
                                                        );
                                        $(win.document.body).find('table')
                                                .addClass('compact')
                                                .css('font-size', 'inherit');
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
                var date = arrayData[4];

                var data = {
                    date: date
                };

                $.ajax({
                    url: "manageReportYearlyDetailsTable.jsp",
                    type: "post",
                    data: data,
                    timeout: 3000,
                    success: function (returnReportDetailsTableHTML) {
                        console.log(returnReportDetailsTableHTML);
                        $('#manageReportYearlySalesDetailsTable').html(returnReportDetailsTableHTML);

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
                                    title: 'Pharmacy Yearly Dispensed Drug List For ' + rdate,
                                    className: 'btn btn-primary',
                                    exportOptions: {
                                        columns: ':visible'
                                    }
                                }, {
                                    extend: 'csvHtml5',
                                    text: 'Export To Excel CSV',
                                    title: 'Pharmacy Yearly Dispensed Drug List For ' + rdate,
                                    className: 'btn btn-primary',
                                    exportOptions: {
                                        columns: ':visible'
                                    }
                                }, {
                                    extend: 'print',
                                    text: 'Print Yearly Sales List',
                                    title: $('h1').text(),
                                    message: '<br><br>',
                                    className: 'btn btn-primary',
                                    customize: function (win) {
                                        $(win.document.body)
                                                .css('font-size', '10pt')
                                                .prepend(
                                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej">Pharmacy Yearly Dispensed Drug List For ' + rdate + '</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong><%=newdate%></strong></dd>\n\
                                        </div> '
                                                        );
                                        $(win.document.body).find('table')
                                                .addClass('compact')
                                                .css('font-size', 'inherit');
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