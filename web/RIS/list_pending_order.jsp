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
                                <h3 style="margin: 0px;">List of Procedure Code</h3>
                                <hr class="pemisah"/>
                                <div style="width:50%; margin: auto;">
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-md-2 control-label" for="textinput">Select by body system: </label>
                                            <div class="col-md-3">
                                                <%  Conn conn = new Conn();
                                                    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
                                                    String hfc_logo = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc_cd + "'";
                                                    ArrayList<ArrayList<String>> logo = conn.getData(hfc_logo);

                                                    LocalDate localDate = LocalDate.now();
                                                    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);
//                                                    String test_ca = "SELECT rbs.body_system_name,rm.modality_name,rpm.body_system_cd,rpm.modality_cd,rpm.ris_procedure_name,rpm.selling_price,rpm.buying_price,rpm.quantity,rpm.status FROM ris_body_system rbs,ris_modality rm, ris_procedure_master rpm WHERE rbs.body_system_cd = rpm.body_system_cd AND rm.modality_cd = rpm.modality_cd";
//                                                    ArrayList<ArrayList<String>> test_cd = conn.getData(test_ca);
                                                %>

                                                <select class="form-control" name="test" id="body_System">
                                                    <option value="0">Pending</option>
                                                    <option value="2">Verified</option>
                                                    <option value="3">?</option>
                                                    <option value="all">All</option>
                                                </select>
                                            </div>

                                            <div class="col-md-2">
                                                <button id="RMOM_btnRefresh" class="btn btn-default" style=" padding-right: 10px;padding-left: 10px;color: black;"><i class=" fa fa-refresh" style=" padding-right: 10px;padding-left: 10px;color: black;"></i>Refresh</button>

                                            </div>
                                                
                                            <div class="col-md-12" style=" text-align: center;">
                                                <button id="today" class="btn btn-default" style=" padding-right: 10px;padding-left: 10px;color: black;">&nbsp;&nbsp;&nbsp;Today&nbsp;&nbsp;&nbsp;</button>
                                                <button id="monthly" class="btn btn-default" style=" padding-right: 10px;padding-left: 10px;color: black;">&nbsp;&nbsp;&nbsp;Monthly&nbsp;&nbsp;&nbsp;</button>
                                                <button id="yearly" class="btn btn-default" style=" padding-right: 10px;padding-left: 10px;color: black;">&nbsp;&nbsp;&nbsp;Yearly&nbsp;&nbsp;&nbsp;</button>
                                            </div>    
                                        </div>
                                    </div>
                                </div>
                                <script>
                                    $(function () {

                                        //-------------------------refresh the order table ---------------------------------------
                                        $('#RMOM_btnRefresh').on('click', function () {
                                            //$('#risOrderListContent').html('<div class="loading">Loading</div>');

                                            var process = $('#body_System').val();
                                            //alert(process);
                                            var data = {
                                                process: process
                                            };

                                            $.ajax({
                                                type: 'POST',
                                                url: "viewPro.jsp",
                                                data: data,
                                                success: function (data) {
                                                    $("#viewProcedure").val(data.trim());
                                                    $('#viewProcedure').html(data);
                                                    $('#viewProcedure').trigger('contentchanged');
                                                }

                                            });

                                        });
                                    });

                                </script>



                                <div class="table-guling" id='viewProcedure'>
                                    <%
                                        String sql = "SELECT ris_order_master.pmi_no,ris_order_master.order_no,ris_order_master.hfc_cd,ris_order_master.episode_date,ris_order_master.encounter_date,ris_order_master.order_date,"
                                                //  6                                           7                       8                           9                   10                                  11                  12                      
                                                + "ris_order_master.order_by,ris_order_master.hfc_from,ris_order_master.hfc_to,ris_order_master.order_status,ris_order_master.diagnosis_cd,ris_order_master.created_by,ris_order_master.created_date,"
                                                //  13                                          14                              15                                  16                          17
                                                + "pms_patient_biodata.PATIENT_NAME,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE, "
                                                //  18                  19              20
                                                + "sx.description, blot.description, hfc.hfc_name "
                                                + "FROM ris_order_master "
                                                + "LEFT JOIN pms_patient_biodata ON (ris_order_master.pmi_no = pms_patient_biodata.PMI_NO) "
                                                + "LEFT JOIN adm_lookup_detail sx on pms_patient_biodata.SEX_CODE = sx.detail_reference_code AND sx.master_reference_code = '0041' AND sx.hfc_cd = ris_order_master.hfc_cd "
                                                + "LEFT JOIN adm_lookup_detail blot on pms_patient_biodata.BLOOD_TYPE = blot.detail_reference_code AND blot.master_reference_code = '0074' AND blot.hfc_cd = ris_order_master.hfc_cd "
                                                + "Left JOIN adm_health_facility hfc on hfc.hfc_cd = ris_order_master.hfc_cd "
                                                + "WHERE ris_order_master.order_no in (select distinct(order_no) from ris_order_detail ) AND ris_order_master.order_status = '0' AND ris_order_master.hfc_cd = '" + hfc_cd + "'";
                                        ArrayList<ArrayList<String>> dataPatientApp = conn.getData(sql);
                                    %>
                                    <table id="procedure"  class="table table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th >Order No</th>
                                                <th >PMI No</th>
                                                <th >HFC Name</th>
                                                <th >Episode Date</th>	 
                                                <th >Encounter Date</th>
                                                <th >Created By</th>
                                                <th >Patient Name</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <%if (dataPatientApp.size() > 0) {
                                                    for (int i = 0; i < dataPatientApp.size(); i++) {%>
                                            <tr>
                                                <td><%=dataPatientApp.get(i).get(1)%></td>
                                                <td><%=dataPatientApp.get(i).get(0)%></td>
                                                <td><%=dataPatientApp.get(i).get(20)%></td>
                                                <td><%=dataPatientApp.get(i).get(3)%></td>
                                                <td><%=dataPatientApp.get(i).get(4)%></td>
                                                <td><%=dataPatientApp.get(i).get(11)%></td>
                                                <td><%=dataPatientApp.get(i).get(13)%></td>
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
                                        <img src="<%=logo.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej">List of Code Procedure</div>\n\
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

                                        $('#today').click(function () {
                                           
                                            var process = $('#body_System').val();
                                            var get_time = "today";
                                             alert(get_time+" "+process);
                                            var data = {
                                                get_time: get_time,
                                                process: process
                                            };

                                           $.ajax({
                                                type: 'POST',
                                                url: "viewByTime.jsp",
                                                data: data,
                                                success: function (data) {
                                                    $("#viewProcedure").val(data.trim());
                                                    $('#viewProcedure').html(data);
                                                    $('#viewProcedure').trigger('contentchanged');
                                                }

                                            });
                                        });
                                        
                                        $('#monthly').click(function () {
                                            //
                                            var process = $('#body_System').val();
                                            var get_time = "month";
                                            alert(get_time+" "+process);
                                            var data = {
                                                get_time: get_time,
                                                process: process
                                            };

                                           $.ajax({
                                                type: 'POST',
                                                url: "viewByTime.jsp",
                                                data: data,
                                                success: function (data) {
                                                    $("#viewProcedure").val(data.trim());
                                                    $('#viewProcedure').html(data);
                                                    $('#viewProcedure').trigger('contentchanged');
                                                }

                                            });
                                        });
                                        
                                        $('#yearly').click(function () {
                                            //alert("get_time");
                                            var process = $('#body_System').val();
                                            var get_time = "year";
                                           alert(get_time+" "+process);
                                            var data = {
                                                get_time: get_time,
                                                process: process
                                            };

                                           $.ajax({
                                                type: 'POST',
                                                url: "viewByTime.jsp",
                                                data: data,
                                                success: function (data) {
                                                    $("#viewProcedure").val(data.trim());
                                                    $('#viewProcedure').html(data);
                                                    $('#viewProcedure').trigger('contentchanged');
                                                }

                                            });
                                        });
                                    });

        </script>

    </body>

</html>