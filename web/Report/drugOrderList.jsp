<%-- 
    Document   : drugOrderList
    Created on : Feb 20, 2017, 7:27:50 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    String dis_name_query = "SELECT discipline_cd, discipline_name FROM adm_discipline WHERE discipline_hfc_cd='" + hfc + "'";
    ArrayList<ArrayList<String>> mysqldis_name = conn.getData(dis_name_query);
    for (int x = 0; x < mysqldis_name.size(); x++) {
        dis_names += mysqldis_name.get(x).get(0) + "|" + mysqldis_name.get(x).get(1);
        if (x < mysqldis_name.size() - 1) {
            dis_names += "^";
        }
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../assets/js/jquery.min.js" type="text/javascript"></script>
        <script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>

        <%@include file = "../assets/header.html" %>
        <link href="../assets/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/mystyles.css" rel="stylesheet" type="text/css"/>
        <script src="../assets/js/Chart.js"></script>
        <title>Total Drug Cost</title>
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

                    <div class="col-md-12">
                        <div class="thumbnail">
                            <h3 style="margin: 0px;">Total Drug Cost</h3>
                            <hr class="pemisah"/>
                            <div class="form-horizontal">
                                <div class="form-group col-md-12" id="ReportFilturediv">
                                <lebal class="col-md-4 control-label">Discipline:</lebal>
                                <div class="col-md-4">
                                    <select id="patientType" class="form-control">
                                        <option value="all">All</option>
                                        <%
                                            for (int x = 0; x < mysqldis_name.size(); x++) {
                                                out.print("<option value='"+mysqldis_name.get(x).get(0)+"'>"+mysqldis_name.get(x).get(1)+"</option>");
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
                            </div>
                            <hr/>
                            <div class="text-right">
                                <button type="reset" id="PrintReset" class="btn btn-link" data-dismiss="modal" role="button" >Clear</button>
                                <button type="submit" class="btn btn-success" role="button" id="printDrugOrder">Generate Report</button>
                            </div>


                        </div>
                        <div class="thumbnail">


                            <div id="totalDrugs">

                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>


        <script src="../assets/js/jquery-ui.js" type="text/javascript"></script>
        <script src="../assets/js/bootbox.min.js" type="text/javascript"></script>
        <script src="../assets/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../assets/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="../assets/js/dataTables.buttons.min.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.flash.min.js" type="text/javascript"></script>
        <script src="../assets/js/jszip.min.js" type="text/javascript"></script>
        <script src="../assets/js/pdfmake.min.js" type="text/javascript"></script>
        <script src="../assets/js/vfs_fonts.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.html5.min.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.print.min.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.colVis.min.js" type="text/javascript"></script>

        <script>

            $(document).ready(function () {

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

                $('#printDrugOrder').on('click', function () {

                    $('<div class="loading">Loading</div>').appendTo('body');

                    var startDate = $('#dateFrom').val();
                    var endDate = $('#dateTo').val();
                    var filterBy = $('#patientType').val();
                    
                    var temp = startDate.split("/");
                        startDate = temp[2] + "-" + temp[1] + "-" + temp[0];

                        temp = endDate.split("/");
                        endDate = temp[2] + "-" + temp[1] + "-" + temp[0];
                        
                    $.ajax({
                        type: "post",
                        url: "drugOrderListReport.jsp",
                        data: {startDate: startDate, endDate: endDate, filterBy: filterBy},
                        timeout: 3000,
                        success: function (returnHtml) {

                            $('#totalDrugs').html(returnHtml);

                        }, error: function () {

                            //console.log("ERROR: " + errorThrown);
                        }
                    });

                });

                $('#PrintReset').on('click', function () {

                    $('#dateFrom').val('');
                    $('#dateTo').val('');
                    $('#totalDrugs').html('');

                });
            });
        </script>
    </body>
</html>


