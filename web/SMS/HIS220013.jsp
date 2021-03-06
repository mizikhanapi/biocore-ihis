<%-- 
    Document   : HIS220013
    Created on : 09-Nov-2018, 10:57:02
    Author     : Shay
--%>

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
    String username = session.getAttribute("USER_NAME").toString();
    String dis_name_query = "SELECT discipline_cd, discipline_name FROM adm_discipline WHERE discipline_hfc_cd='" + hfc + "'";
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
        <title>Stock Distributes/Transfer Report</title>
        <%@include file = "libraries/stockHeadLibrary.jsp" %>
        <%@include file = "../assets/header.html" %>
<!--        <script src="../assets/js/jquery.min.js"></script>
        <script src="../assets/js/jquery-ui.js" type="text/javascript"></script>
        <script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="../assets/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.datatables.net/buttons/1.3.1/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css"/>-->

        <!--        <script src="https://code.highcharts.com/highcharts.js"></script>
                <script src="https://code.highcharts.com/modules/exporting.js"></script>-->

        <script src="../assets/js/highcharts-exporting.js" type="text/javascript"></script>
        <script src="../assets/js/highcharts.js" type="text/javascript"></script>

    </head>
    <body>
        <!-- side bar -->
        <%@include file = "libraries/stockSideMenus.jsp" %>
        <!-- side bar -->
        <div class="main" style="background: #f2ff4f8;"> 
            <!-- menu top -->
            <%@include file = "libraries/stockTopMenus.jsp" %>
            <!-- menu top -->
            <div class="container-fluid">
                <div class="row">

                    <div class="thumbnail">
                        <form>
                            <h4 style="margin: 0px; padding: 0;">Stock Distribute Report</h4>
                            <hr class="pemisah"/>
                            <div class="form-group col-md-12" id="ReportFilturediv">
                                <lebal class="col-md-4 control-label">Discipline:</lebal>
                                <div class="col-md-4">
                                    <select id="patientType" class="form-control">
                                        <option value="all">All</option>
                                        <%
                                            for (int x = 0; x < mysqldis_name.size(); x++) {
                                                out.print("<option value='" + mysqldis_name.get(x).get(0) + "'>" + mysqldis_name.get(x).get(1) + "</option>");
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group col-md-12">
                                <label class="col-md-1 control-label" for="textinput">Date:</label>
                                <label class="col-md-1 control-label" style="text-align: right; padding-top: 10px;" for="textinput">From</label>
                                <div class="col-md-3">
                                    <input type="text" class="form-control input-md" id="dateFrom" name="dateFrom" placeholder="Select Start Date" maxlength="" readonly=""/>
                                </div>
                                <label class="col-md-1 control-label" style="text-align: right; padding-top: 10px;" for="textinput">To</label>
                                <div class="col-md-3">
                                    <input type="text" class="form-control input-md" id="dateTo" name="dateTo" placeholder="Select End Date" maxlength="" readonly=""/>
                                </div>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-primary" type="button" id="searchPatientTypeList" name="searchPatientTypeList"><i class="fa fa-search fa-lg" ></i>&nbsp; Search</button>

                                <button id="clearSearch" name="clearSearch" type="clear" class="btn btn-default"><i class="fa fa-ban fa-lg"></i>&nbsp; Clear</button>
                            </div>
                        </form>
                    </div>


                    <div class="thumbnail">
                        <div id="UTeMPatientTypeListReportTable">

                            <table  id="UTemPTLReport"  class="table table-striped table-bordered" cellspacing="0" width="100%">
                                <thead >
                                <th style="text-align: left;">Order No.</th>
                                <th style="text-align: left;">Order Date</th>
                                <th style="text-align: left;">Location</th>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>

                        <div class="row" id="data">
                            <!-- content goes here -->
                            <form class="form-horizontal" id="addForm">

                                <!-- Text input-->
                                <div class="form-group" id="reportTotalPatientTypeDiv" style="display: none; margin: 20px 20px 0 0;">
                                    <label class="col-md-5 control-label" for="textinput">Total Distribution</label>
                                    <div class="col-md-4">
                                        <input id="reportPatientTypeTotalPatient" name="reportPatientTypeTotalPatient" type="number" placeholder="Total Patients" class="form-control input-md" maxlength="50" value="" readonly>
                                    </div>
                                </div>

                            </form>
                        </div>


                    </div>
                </div>
            </div>

        </div>
        <div>
            <%@include file="reportDistributeModal.jsp" %>
        </div>
        <%@include file = "libraries/stockFootLibrary.jsp" %>
<!--        <script src="../assets/js/jquery-1.12.4.js" type="text/javascript"></script>
        <script src="../assets/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../assets/js/dataTables.buttons.min.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.flash.min.js" type="text/javascript"></script>
        <script src="../assets/js/jszip.min.js" type="text/javascript"></script>
        <script src="../assets/js/pdfmake.min.js" type="text/javascript"></script>
        <script src="../assets/js/vfs_fonts.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.html5.min.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.print.min.js" type="text/javascript"></script>
        <script src="https://cdn.datatables.net/buttons/1.0.3/js/buttons.colVis.js"></script>-->



        <script>
//            $("#dateFrom").datepicker({dateFormat: 'dd/mm/yy'});
//            $("#dateTo").datepicker({dateFormat: 'dd/mm/yy'});


// highlighted navigation//
             //report main head
            $('#aReportMain').removeClass('collapsed'); 
            $('#aReportMain').attr('aria-expanded', true);
            //report submenu
            $('#Report').addClass('in');
            $('#Report').attr('aria-expanded', true);
            //specific menu
            $('#aStockDistReport').addClass('active');


            var sumPatientIntable = 0;
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

            
            $('#dateFrom').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/mm/yy',
                yearRange: '1990:+0',
                maxDate: '+0d'
            });


            //--- initialise datepicker for to after changes on from ------------
            $('#dateFrom').on('change', function () {

                $("#dateTo").datepicker("destroy");
                $('#dateTo').val('');

                var fromDate = $("#dateFrom").datepicker("getDate");

                $('#dateTo').datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'dd/mm/yy',
                    yearRange: '1990:+0',
                    minDate: fromDate,
                    maxDate: '+0d'
                });

            });
            var startDateori;
            var endDateori;
            $("#searchPatientTypeList").click(function () {
                var patientType;
                var startDate, endDate;
                patientType = $("#patientType").val();
                startDate = $("#dateFrom").val();
                endDate = $("#dateTo").val();
                var namaDis = $("#patientType option:selected").text();

                 startDateori = $("#dateFrom").val();
                 endDateori = $("#dateTo").val();


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
                    console.log(data);
                    $.ajax({
                        type: "POST",
                        url: "controllerProcessReport/distributeReportMasterTable.jsp",
                        data: data,
                        timeout: 10000,
                        success: function (reply) {
                            console.log(reply);
                            if (reply.trim() !== "No Data")
                            {
                                
                                $('#UTeMPatientTypeListReportTable').html(reply);
                                var rowCount = parseInt($('#UTeMPatientTypeListReportTable #UTemPTLReport tr').length) - 1 ;

                                $('#reportTotalPatientTypeDiv').css("display", "block");
                                $("#reportPatientTypeTotalPatient").val(rowCount);
                                $("#searchPatientTypeList").prop("disabled", true);
                                
                            } else if (reply.trim() === "No Data") {
                                alert("There is no record in this time range !!");
                            }
                        },
                        error: function (request, status, error) {
                            console.log("ERROR: " + request.responseText);
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
            
            $('#UTeMPatientTypeListReportTable').on('click','#UTemPTLReport tbody #btnPrint',function(){
               var row = $(this).closest('tr');
               var orderno = row.find('#orderno').text();
               var namaDis = "";
               var data = {
                   orderno : orderno
               };
               console.log(data);
                $.ajax({
                        type: "POST",
                        url: "controllerProcessReport/distributeReportDetailTable.jsp",
                        data: data,
                        timeout: 10000,
                        success: function (reply) {
                            console.log(reply.trim());
                            if (reply.trim() !== "No Data")
                            {
                                
                                var dataRow = reply.trim().split("^");
                                var totalPatient = 0;
                                var orderby,orderno,orderingsub,orderingdis,orderdate;
                                var totalreleased = 0;
                                var trHTML = '';
                                var i;
                                for (i = 0; i < dataRow.length; i++)
                                {
                                    var datas = dataRow[i].split("|");
                                    console.log(datas);
                                    trHTML += '<tr style="text-align: left;" class="clickable_tr">\n\
                                                        <td>' + datas[0] + '</td>\n\
                                                        <td>' + datas[1] + '</td>\n\
                                                        <td>' + datas[2] + '</td>\n\
                                                        <td>' + datas[3] + '</td>\n\
                                                        <td>' + datas[5] + '</td>\n\
                                                        <td>' + datas[4] + '</td>\n\
                                                        <td>' + datas[8] +'</td>\n\
                                                        <td>' + datas[15] + '</td>\n\
                                                        <td>' + datas[16] + '</td>\n\
                                                        <td>' + datas[17] + '</td>\n\
                                                        <td>' + datas[18] +'</td>\n\
                                                        </tr>';
                                    totalPatient += 1;
                                    namaDis = datas[15];
                                    orderby = datas[19];
                                    orderno = datas[0];
                                    orderingsub = datas[18];
                                    orderingdis = datas[17];
                                    orderdate = datas[1];
                                    totalreleased +=parseInt(datas[5]);
                                }
                                $("#distributedetailreporttable").DataTable().destroy();
                                $('#disdetail #tbldetailmodal #distributedetailreporttable tbody').empty();
                                $('#disdetail #tbldetailmodal #distributedetailreporttable tbody').append(trHTML);
                                //$('#disdetail #tbldetailmodal').html(reply);
                                var rowCount = parseInt($('#disdetail #tbldetailmodal #distributedetailreporttable tr').length) - 1 ;
                                $('#distributedetailreporttable').DataTable({
                                    pageLength: 15,
                                    dom: 'Bfrtip',
                                    buttons: [
                                        {
                                            extend: 'print',
                                            text: 'Print Stock Distribution List',
                                            title: '',
                                            message: '<br><br>',
                                            className: 'btn btn-default',
                                            customize: function (win) {
                                                $(win.document.body)
                                                        .css('font-size', '10pt')
                                                        .prepend(
                                                                '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Stock Distribution List<br/>From :'+startDateori+' To : '+endDateori+'</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong>STK-005</strong></dd>\n\
                                        </div> \n\
                                        <div style="margin: 30px 0 0 0; font-size: 15px;"> \n\<p>Order No: <strong>'+orderno+'</strong><br>Order Date:<strong> '+orderdate+'</strong><br>Order By: <strong>' + orderby + ' | '+orderingdis+' | '+orderingsub+'</strong></p>\n\
                                        </div> '
                                                                );
                                                $(win.document.body).find('table')
                                                        .addClass('compact')
                                                        .css('font-size', 'inherit');
                                                $(win.document.body)
                                                        .css('font-size', '10pt')
                                                        .css('font-weight', 'bolder')
                                                        .append('<div style="text-align: left;padding-top:10px;"><br>Total Order = ' + totalPatient + '<br>Total Released = ' + totalreleased + ' </div>');
                                                $(win.document.body)
                                                        .css('font-size', '10pt')
                                                        .append('<div style="display: table; width: 100%;"><div style="display: table-cell; text-align: left; padding-top:30px;">Received By:<br><br>-------------------<br>(Name: '+orderby+')</div><div style="display:table-cell; text-align: right;">Released By:<br><%=username%><br>'+namaDis+'</div>');

                                            },
                                            exportOptions: {
                                                columns: ':visible'
                                            }
                                        },
                                        {
                                            extend: 'colvis',
                                            text: 'Filter Table Columns',
                                            className: 'btn btn-default'
                                        }
                                    ],columnDefs: [
                                        {
                                            className: 'dt-body-left',
                                            targets: '_all'

                                        }]
                                });
                                //$('#reportTotalPatientTypeDiv').css("display", "block");
                                //$("#reportPatientTypeTotalPatient").val(rowCount);
                                //$("#searchPatientTypeList").prop("disabled", true);
                                
                            } else if (reply.trim() === "No Data") {
                                alert("There is no record in this time range");
                            }
                        },
                        error: function (err) {
                            console.log("ERROR: " + err);
                        }
                    });
            });
            
        </script>
    </body>
</html>
