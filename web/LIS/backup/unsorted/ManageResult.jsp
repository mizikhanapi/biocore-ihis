<%-- 
    Document   : MainPage
    Created on : Nov 4, 2016, 4:07:05 PM
    Author     : Ahmed
--%>
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">   
        <title>Main Page</title>
        <script src="assets/js/jquery.min.js"></script>
        <%@include file="../assets/header.html"%>
        <link rel="stylesheet" href="assets/css/loading.css">
        <link href="assets/datepicker/jquery-ui.css" rel="stylesheet">
        <link href="bootstrap-3.3.6-dist/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>


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
                                <h3 style="margin: 0px;">Receive Specimen</h3>
                                <hr class="pemisah"/>
                                <div style="width:50%; margin: auto;">
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="textinput">Show list of receive specimen: </label>
                                            <div class="col-md-3">
                                                <select class="form-control" name="test" id="RMOM_oderTime">
                                                    <option value="1">Today's Orders</option>
                                                    <option value="2">Monthly Orders</option>
                                                    <option value="3">Yearly Orders</option>
                                                    <option value="4">All Orders</option>
                                                </select>
                                            </div>
                                            <div class="col-md-2">
                                                <button id="RMOM_btnRefresh" class="btn btn-default" style=" padding-right: 10px;padding-left: 10px;color: black;"><i class=" fa fa-refresh" style=" padding-right: 10px;padding-left: 10px;color: black;"></i>Refresh</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <script>
                                    $(function () {

                                        //-------------------------refresh the order table ---------------------------------------
                                        $('#RMOM_btnRefresh').on('click', function () {
                                            //$('#risOrderListContent').html('<div class="loading">Loading</div>');

                                            var process = $('#RMOM_oderTime').val();
                                            //alert(process);
                                            var data = {
                                                process: process
                                            };

                                            $.ajax({
                                                type: 'POST',
                                                url: "viewMTS.jsp",
                                                data: data,
                                                success: function (data) {
                                                    $("#viewMTS").val(data.trim());
                                                    $('#viewMTS').html(data);
                                                    $('#viewMTS').trigger('contentchanged');
                                                }

                                            });

                                        });
                                    });

                                </script>



                                <div class="table-guling" id='viewMTS'>
                                    <table id="MTC"  class="table table-striped table-bordered" cellspacing="0" width="100%">
                                        <%  Conn conn = new Conn();
                                            String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
                                            String sql = "SELECT DISTINCT lis_order_master.order_date,lis_order_master.order_from_discipline,lis_order_master.order_to_discipline,lis_order_master.HFC_FROM,lis_order_master.HFC_TO,lis_order_master.created_by,lis_order_master.order_status,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE,lis_order_master.order_status,ls.specimen_no,lis_order_master.ORDER_NO,ls.item_cd,lis_order_master.PMI_NO,pms_patient_biodata.`PATIENT_NAME`,s.description,b.description,c.`Description`,d.`Description`,e.`USER_NAME`,f.hfc_name,ls.receive_specimen_status FROM lis_order_master JOIN pms_patient_biodata ON (lis_order_master.PMI_NO = pms_patient_biodata.PMI_NO) JOIN adm_lookup_detail s on pms_patient_biodata.SEX_CODE = s.detail_reference_code AND s.master_reference_code = '0041' AND s.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_lookup_detail b on pms_patient_biodata.BLOOD_TYPE = b.detail_reference_code AND b.master_reference_code = '0074' AND b.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_users a on lis_order_master.order_by = a.`USER_ID` LEFT JOIN adm_lookup_detail c on pms_patient_biodata.NATIONALITY = c.detail_reference_code AND c.master_reference_code = '0011' AND b.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_lookup_detail d on pms_patient_biodata.`RACE_CODE` = d.detail_reference_code AND d.master_reference_code = '0004' LEFT JOIN adm_users e on lis_order_master.order_by = e.`USER_ID` LEFT JOIN adm_health_facility f ON f.hfc_cd = lis_order_master.hfc_cd, lis_specimen ls,lis_order_detail lod WHERE lis_order_master.order_no=lod.order_no AND ls.order_no=lod.order_no AND lis_order_master.pmi_no = pms_patient_biodata.PMI_NO AND lis_order_master.hfc_cd = '" + hfc_cd + "' AND ls.Collection_date = CURDATE() GROUP BY ls.specimen_no";
                                            ArrayList<ArrayList<String>> dataPatientApp = conn.getData(sql);
                                        %>
                                        <thead>
                                            <tr>
                                                <th >Specimen No</th>
                                                <th >Order No</th>
                                                <th >PMI No</th>				 
                                                <th >Patient Name</th>
                                                <th >Order Source</th>
                                                <th >Receive Specimen</th>
                                                <th >Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <%if (dataPatientApp.size() > 0) {
                                                    for (int i = 0; i < dataPatientApp.size(); i++) {%>
                                            <tr>
                                                <td><%=dataPatientApp.get(i).get(12)%></td>
                                                <td><%=dataPatientApp.get(i).get(13)%></td>
                                                <td>
                                                    <button  class='btn btn-link' data-toggle="modal" data-target="#PMI_<%=i%>"><%=dataPatientApp.get(i).get(15)%></button>
                                                    <div class="modal fade" id="PMI_<%=i%>" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <div class="modal-header">
                                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><%= new SimpleDateFormat("HH:mm:ss").format(new java.util.Date())%></button>
                                                                        <h4 class="modal-title" id="myModalLabel">Patient Information</h4>
                                                                    </div>
                                                                    <br><br>

                                                                    <div class="row">
                                                                        <div class="col-md-6">
                                                                            <div class="form-group">
                                                                                <label for="exampleInputEmail1"> PMI No: <%=dataPatientApp.get(i).get(15)%></label>
                                                                            </div>
                                                                            <br>
                                                                            <div class="form-group">
                                                                                <label for="exampleInputEmail1"> IC No: <%=dataPatientApp.get(i).get(7)%></label>
                                                                            </div>
                                                                            <br>
                                                                            <div class="form-group">
                                                                                <label for="exampleInputEmail1"> Gender: 
                                                                                    <%=dataPatientApp.get(i).get(17)%>
                                                                                </label>
                                                                            </div>
                                                                            <br>
                                                                            <div class="form-group">
                                                                                <label for="exampleInputEmail1"> Race: <%=dataPatientApp.get(i).get(20)%></label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <div class="form-group">
                                                                                <label for="exampleInputEmail1"> Name: <%=dataPatientApp.get(i).get(16)%></label>
                                                                            </div>
                                                                            <br>
                                                                            <div class="form-group">
                                                                                <label for="exampleInputEmail1"> Age: <%
                                                                                    String birth = dataPatientApp.get(i).get(8);
                                                                                    boolean retval = birth.contains("-");
                                                                                    if (birth.contains("-")) {
                                                                                        String[] parts = birth.split("-");
                                                                                        int years = Integer.parseInt(parts[0]);
                                                                                        Calendar now = Calendar.getInstance();   // Gets the current date and time
                                                                                        int year = now.get(Calendar.YEAR);
                                                                                        int age = year - years;
                                                                                        out.println(age);

                                                                                    } else {
                                                                                        String[] parts = birth.split("/");
                                                                                        int years = Integer.parseInt(parts[2]);
                                                                                        Calendar now = Calendar.getInstance();   // Gets the current date and time
                                                                                        int year = now.get(Calendar.YEAR);
                                                                                        int age = year - years;
                                                                                        out.println(age);
                                                                                    }%></label>
                                                                            </div>
                                                                            <br>
                                                                            <div class="form-group">
                                                                                <label for="exampleInputEmail1"> Date of Birth: <%=dataPatientApp.get(i).get(8)%></label>
                                                                            </div>
                                                                            <br>
                                                                            <div class="form-group">
                                                                                <label for="exampleInputEmail1"> Nationality: <%=dataPatientApp.get(i).get(19)%></label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td style="font-weight: 500;"><%=dataPatientApp.get(i).get(16)%></td>
                                                <td>
                                                    <button  class='btn btn-link' data-toggle="modal" data-target="#basicModal_<%=i%>">View Detail</button>
                                                    <div class="modal fade" id="basicModal_<%=i%>" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <div class="modal-header">
                                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><%= new SimpleDateFormat("HH:mm:ss").format(new java.util.Date())%></button>
                                                                        <h4 class="modal-title" id="myModalLabel">Order Source</h4>
                                                                    </div>
                                                                    <br><br>
                                                                    <div class="row">
                                                                        <div class="col-md-6">
                                                                            <div class="form-group">
                                                                                <label for="exampleInputEmail1"> Requester Name: <%=dataPatientApp.get(i).get(21)%></label>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <div class="form-group">
                                                                                <label for="exampleInputEmail1"> Requester Location: <%=dataPatientApp.get(i).get(22)%></label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </td>
                                                <td><%=dataPatientApp.get(i).get(23)%></td>
                                                <td>
                                                    <%
                                                        String pmi = dataPatientApp.get(i).get(15);
                                                        String specimen_no = dataPatientApp.get(i).get(12);
                                                    %>
                                                    <a href='Sent_Receive_Specimen?pmi=<%=pmi%> &specimen_no=<%=specimen_no%>' class='btn btn-primary btn-block' >Identify Specimen</a>
                                                </td>

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


        <script src="assets/datepicker/jquery-ui.js"></script>
        <script src="assets/js/form-validator.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script> 
        <script src="assets/js/bootbox.min.js"></script>  
        <script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>
        <script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>
        <script src="bootstrap-3.3.6-dist/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script>
                                    function a()
                                    {
            <%                try {
                    String error = request.getParameter("error");
                    if (error != null) {
            %>
                                        alert('<%=error%>');
                                        location.href = 'Order_list';
            <%
                    }
                } catch (Exception e) {
                }
            %>
                                    }
        </script>
        <script>

            $(document).ready(function () {
                //$("#WardOccupancy").load("WardOccupancy.jsp");
                $("#viewMTS").load("viewMTS.jsp");
                $('#MTC').DataTable({
                    language: {
                        emptyTable: "No receive specimen for today"
                    }, initComplete: function (settings, json) {
                        $('.loading').hide();
                    }
                });
            });

        </script>
    </body>
</html>
