<%-- 
    Document   : HIS060001
    Created on : Mar 28, 2017, 12:18:51 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>

<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iHIS | RIS</title>
        <!-- header -->
        <%@include file = "libraries/radiologyHeadLibrary.jsp" %>
        <%@include file = "../assets/header.html" %>
        <!-- header -->
    </head>

    <body>
        <div class="loading"></div>
        <div class="container-fluid">
            <div class="row">       
                <!-- menu side -->	
                <%@include file = "libraries/radiologySideMenus.jsp" %>
                <!-- menu side -->	
                <!-- main -->		
                <div class="main" style="background: #f2f4f8;">
                    <!-- menu top -->
                    <%@include file = "libraries/radiologyTopMenus.jsp" %>
                    <!-- menu top -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="thumbnail">
                                <h3 style="margin: 0px;">List of Sale</h3>
                                <hr class="pemisah"/>
                                <div style="width:50%; margin: auto;">
                                    <div class="form-horizontal">
                                        <div class="form-group">

                                            <div class="col-md-12" style=" align-items: center;">
                                                <button id="today" class="btn btn-default" style=" padding-right: 10px;padding-left: 10px;color: black;">Today</button>
                                                <button id="monthly" class="btn btn-default" style=" padding-right: 10px;padding-left: 10px;color: black;">Monthly</button>
                                                <button id="yearly" class="btn btn-default" style=" padding-right: 10px;padding-left: 10px;color: black;">Yearly</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <script>
                                    $(function () {

                                        $('#today').click(function () {
                                            //alert("get_time");
                                            var process = $('#RMOM_oderTime').val();
                                            var get_bill = "today";
                                            var data = {
                                                get_bill: get_bill,
                                                process: process
                                            };

                                            $.ajax({
                                                type: 'POST',
                                                url: "order_bill.jsp",
                                                data: data,
                                                success: function (data) {
                                                    $("#viewOS").val(data.trim());
                                                    $('#viewOS').html(data);
                                                    $('#viewOS').trigger('contentchanged');
                                                }

                                            });
                                        });

                                        $('#monthly').click(function () {
                                            //alert("get_time");
                                            var process = $('#RMOM_oderTime').val();
                                            var get_bill = "month";
                                            var data = {
                                                get_bill: get_bill,
                                                process: process
                                            };

                                            $.ajax({
                                                type: 'POST',
                                                url: "order_bill.jsp",
                                                data: data,
                                                success: function (data) {
                                                    $("#viewOS").val(data.trim());
                                                    $('#viewOS').html(data);
                                                    $('#viewOS').trigger('contentchanged');
                                                }

                                            });
                                        });

                                        $('#yearly').click(function () {
                                            //alert("get_time");
                                            var process = $('#RMOM_oderTime').val();
                                            var get_bill = "year";
                                            var data = {
                                                get_bill: get_bill,
                                                process: process
                                            };

                                            $.ajax({
                                                type: 'POST',
                                                url: "order_bill.jsp",
                                                data: data,
                                                success: function (data) {
                                                    $("#viewOS").val(data.trim());
                                                    $('#viewOS').html(data);
                                                    $('#viewOS').trigger('contentchanged');
                                                }

                                            });
                                        });
                                    });

                                </script>



                                <div class="table-guling" id='viewProcedure'>
                                    <%                                        Conn conn = new Conn();
                                        String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();

                                        LocalDate localDate = LocalDate.now();
                                        String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);

                                        String logo = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc + "'";
                                        ArrayList<ArrayList<String>> logo_hfc = conn.getData(logo);

                                        String sql = "SELECT rom.order_no,rpm.body_system_cd, bs.body_system_name,rpm.modality_cd, md.modality_name, rpm.ris_procedure_name,rpm.selling_price,rpm.buying_price,rpm.quantity,rpm.status "
                                                + "FROM ris_procedure_master rpm"
                                                + "join ris_body_system bs on bs.hfc_cd=rpm.hfc_cd and bs.body_system_cd=rpm.body_system_cd"
                                                + "join ris_modality md on md.hfc_cd=rpm.hfc_cd and md.modality_cd=rpm.modality_cd"
                                                + "join ris_order_detail rod on rod.procedure_cd=rpm.ris_procedure_cd"
                                                + "join ris_order_master rom on rom.order_no = rod.order_no"
                                                + "WHERE rpm.hfc_cd = '04010101' AND MONTH(DATE_FORMAT(rom.order_date, '%Y-%m-%d')) = MONTH(CURRENT_DATE()) GROUP BY rom.ORDER_NO DESC";
                                        ArrayList<ArrayList<String>> dataPatientApp = conn.getData(sql);
                                    %>
                                    <table id="procedure"  class="table table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th >Order No</th>
                                                <th >Body System Code</th>
                                                <th >Body System Name</th>
                                                <th >Modality Code</th>
                                                <th >Modality Name</th>	 
                                                <th >Procedure Name</th>
                                                <th >Selling Price</th>
                                                <th >Buying Price</th>
                                                <th> Quantity</th>
                                                <th> Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <%if (dataPatientApp.size() > 0) {
                                                    for (int i = 0; i < dataPatientApp.size(); i++) {%>
                                            <tr>
                                                <td><%=dataPatientApp.get(i).get(0)%></td>
                                                <td><%=dataPatientApp.get(i).get(1)%></td>
                                                <td><%=dataPatientApp.get(i).get(2)%></td>
                                                <td><%=dataPatientApp.get(i).get(3)%></td>
                                                <td><%=dataPatientApp.get(i).get(4)%></td>
                                                <td><%=dataPatientApp.get(i).get(5)%></td>
                                                <td><%=dataPatientApp.get(i).get(6)%></td>
                                                <td><%=dataPatientApp.get(i).get(7)%></td>
                                                <td><%=dataPatientApp.get(i).get(8)%></td>
                                                <td><%=dataPatientApp.get(i).get(9)%></td>
                                            </tr>
                                            <%
                                                    }
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- main -->		

        </div>


        <!-- Placed at the end of the document so the pages load faster -->
        <%@include file = "libraries/radiologyFootLibrary.jsp" %>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="libraries/js/jquery.check-file.js" type="text/javascript"></script>
        <script src="../assets/js/jquery-ui.js" type="text/javascript"></script>
        <script src="../assets/js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../assets/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="../assets/js/dataTables.buttons.min.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.flash.min.js" type="text/javascript"></script>
        <script src="../assets/js/jszip.min.js" type="text/javascript"></script>
        <script src="../assets/js/pdfmake.min.js" type="text/javascript"></script>
        <script src="../assets/js/vfs_fonts.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.html5.min.js" type="text/javascript"></script>
        <script src="../assets/js/buttons.print.min.js" type="text/javascript"></script>

        <script>

                                    $(document).ready(function () {
                                        //$("#WardOccupancy").load("WardOccupancy.jsp");
                                        //$("#viewTC").load("viewTC.jsp");
//                                        $('#procedure').DataTable({
//                                            language: {
//                                                emptyTable: "No data"
//                                            }, initComplete: function (settings, json) {
//                                                $('.loading').hide();
//                                            }
//                                        });

                                        $('#procedure').DataTable({
                                            dom: 'Bfrtip',
                                            buttons: [
                                                'csv', 'excel', 'pdf',
                                                {
                                                    extend: 'print',
                                                    title: $('h1').text(),
                                                    customize: function (win) {
                                                        $(win.document.body)
                                                                .css('font-size', '10pt')
                                                                .prepend(
                                                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=logo_hfc.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej">List of Code Procedure</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong><%=newdate%></strong></dd>\n\
                                        </div> '
                                                                        );
                                                        $(win.document.body).find('table')
                                                                .addClass('compact')
                                                                .css('font-size', 'inherit');
                                                        $(win.document.body)
                                                                .css('font-size', '10pt')
                                                                .append('<div style="text-align: center;padding-top:30px;"><br> ***** &nbsp;&nbsp;  End Of Report  &nbsp;&nbsp;  ***** </div>');
                                                    }
                                                }

                                            ]
                                        });

                                    });

        </script>

    </body>

</html>