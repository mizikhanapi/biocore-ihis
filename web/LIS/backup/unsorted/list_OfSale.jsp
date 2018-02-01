<%-- 
    Document   : MainPage
    Created on : Nov 4, 2016, 4:07:05 PM
    Author     : Ahmed
--%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.DateFormat"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <script src="../assets/js/jquery.min.js" type="text/javascript"></script>
        <script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>

        <%@include file = "../assets/header.html" %>
        <link href="../assets/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/buttons.dataTables.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="loading"></div>

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



                                <div class="table-guling" id='viewOS'>
                                    <%  Conn conn = new Conn();
                                        String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();

                                        LocalDate localDate = LocalDate.now();
                                        String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);

                                        String logo = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc_cd + "'";
                                        ArrayList<ArrayList<String>> logo_hfc = conn.getData(logo);

                                        String query1 = "SELECT lis_order_master.ORDER_NO,lis_order_master.PMI_NO,ahf.hfc_name,lis_order_master.episode_date,lis_order_master.encounter_date,lis_order_master.created_by,lis_order_master.order_status,pms_patient_biodata.`PATIENT_NAME`,lis_order_master.order_status,SUM(lid.buy_price),SUM(lid.ser_price) FROM lis_order_master JOIN pms_patient_biodata ON (lis_order_master.PMI_NO = pms_patient_biodata.PMI_NO) LEFT JOIN adm_lookup_detail s on pms_patient_biodata.SEX_CODE = s.detail_reference_code AND s.master_reference_code = '0041' AND s.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_lookup_detail b on pms_patient_biodata.BLOOD_TYPE = b.detail_reference_code AND b.master_reference_code = '0074' AND b.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_users a on lis_order_master.order_by = a.`USER_ID` LEFT JOIN adm_health_facility ahf on lis_order_master.hfc_cd = ahf.hfc_cd LEFT JOIN lis_order_detail lod on lis_order_master.order_no = lod.order_no LEFT JOIN lis_item_detail lid on lid.item_cd = lod.item_cd WHERE lis_order_master.order_status = '4' AND lis_order_master.hfc_cd = '" + hfc_cd + "' AND DATE_FORMAT(lis_order_master.order_date, '%Y-%m-%d') = CURDATE() GROUP BY lis_order_master.ORDER_NO DESC";
                                        ArrayList<ArrayList<String>> dataPatientApp = conn.getData(query1);
                                    %>
                                    <table id="OS"  class="table table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th >Order No</th>
                                                <th >Pmi No</th>
                                                <th >HFC Name</th>
                                                <th >Episode Date</th>
                                                <th >Encounter Date</th>
                                                <th >Created By</th>
                                                <th> Patient Name</th>
                                                <th> Buy Price</th>
                                                <th> Service Price</th>
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
                                                <td><%=dataPatientApp.get(i).get(7)%></td>
                                                <td><%=dataPatientApp.get(i).get(9)%></td>
                                                <td><%=dataPatientApp.get(i).get(10)%></td>
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


        </div> 


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

                                        $('#OS').DataTable({
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
                                        <img src="<%=logo_hfc.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej">Laporan ICD10</div>\n\
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
                                    })
                                            ;

        </script>
    </body>
</html>
