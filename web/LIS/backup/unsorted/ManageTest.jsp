<%-- 
    Document   : MainPage
    Created on : Nov 4, 2016, 4:07:05 PM
    Author     : Ahmed
--%>
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
                    <div class="row" >
                        <div class="col-md-12" >
                            <div class="thumbnail">
                                <h3 style="margin: 0px;">Manage Test</h3>
                                <hr class="pemisah"/>
                                <div style="width:50%; margin: auto;">
                                    <div class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="textinput">Show list of test status: </label>
                                            <div class="col-md-3">
                                                <select class="form-control" name="test" id="RMOM_oderTime">
                                                    <option value="2">Pending</option>
                                                    <option value="3">Verified</option>
                                                    <option value="4">Send</option>
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
                                                url: "viewMT.jsp",
                                                data: data,
                                                success: function (data) {
                                                    $("#viewMT").val(data.trim());
                                                    $('#viewMT').html(data);
                                                    $('#viewMT').trigger('contentchanged');
                                                }

                                            });

                                        });
                                    });

                                </script>
                                <div class="table-guling" id='viewMT'>
                                    <table id="MTC"  class="table table-striped table-bordered" cellspacing="0" width="100%">
                                        <%  Conn conn = new Conn();
                                            String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
                                            String sqlPatientApp = "SELECT DISTINCT ls.specimen_no,ls.pmi_no,pms.NEW_IC_NO,pms.PATIENT_NAME,lom.order_no,lom.order_status,lom.order_date,ls.item_cd,lom.billing_status FROM lis_specimen ls,lis_order_detail lod,lis_order_master lom,pms_patient_biodata pms WHERE ls.order_no=lod.order_no AND receive_specimen_status = 'Approve' AND lod.order_no= lom.order_no AND lom.pmi_no = pms.PMI_NO AND lom.order_status='2' AND lom.hfc_cd='" + hfc_cd + "' GROUP BY(ls.specimen_no) ORDER by lom.order_status ASC";
                                            ArrayList<ArrayList<String>> dataPatientApp = conn.getData(sqlPatientApp);

                                        %>
                                        <thead>
                                            <tr>
                                                <th class="col-sm-1">Specimen No</th>
                                                <th class="col-sm-1">Order No</th>
                                                <th class="col-sm-1">PMI No</th>
                                                <th class="col-sm-1">IC No</th>
                                                <th class="col-sm-1">Name</th>
                                                <th class="col-sm-1">Status</th>
                                                <th class="col-sm-1">Order Date Time</th>
                                                <th class="col-sm-1">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <%if (dataPatientApp.size() > 0) {
                                                    for (int i = 0; i < dataPatientApp.size(); i++) {%>
                                            <tr>
                                                <td><%=dataPatientApp.get(i).get(0)%><input type="text" id="specimen_no" value="<%=dataPatientApp.get(i).get(0)%>" style="display: none;"></td>
                                                <td><%=dataPatientApp.get(i).get(4)%></td>
                                                <td><%=dataPatientApp.get(i).get(1)%><input type="text" id="pmi" value="<%=dataPatientApp.get(i).get(1)%>" style="display: none;"></td>
                                                <td><%=dataPatientApp.get(i).get(2)%></td>
                                                <td><%=dataPatientApp.get(i).get(3)%></td>
                                                <td>
                                                    <%
                                                        if (dataPatientApp.get(i).get(5).equals("2")) {
                                                    %>
                                                    Pending
                                                    <%
                                                    } else if (dataPatientApp.get(i).get(8).equals("2")) {
                                                    %>
                                                    Send
                                                    <%
                                                    } else {
                                                    %>
                                                    Verified
                                                    <%
                                                        }
                                                    %>
                                                </td>
                                                <td><%=dataPatientApp.get(i).get(6)%></td>
                                                <td>
                                                    <a href='VerifySpecimen.jsp?pmi=<%=dataPatientApp.get(i).get(1)%> &specimen_no=<%=dataPatientApp.get(i).get(0)%>'><button class='btn btn-primary btn-block'>Assign Result</button></a>
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

        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/datepicker/jquery-ui.js"></script>
        <script src="assets/js/form-validator.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script> 
        <script src="assets/js/w3data.js"></script>
        <script src="assets/js/bootbox.min.js"></script>  
        <script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>
        <script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>
        <script src="bootstrap-3.3.6-dist/js/dataTables.bootstrap.min.js" type="text/javascript"></script>

        <script>
                                    w3IncludeHTML();

                                    $(document).ready(function () {
                                        //$("#WardOccupancy").load("WardOccupancy.jsp");
                                        $("#viewMT").load("viewMT.jsp");

                                        $("#headerindex").load("libraries/header.html");
                                        $("#topmenuindex").load("libraries/topMenus.html");
                                        $("#sidemenus").load("libraries/sideMenus.jsp");
                                        $('#MTC').DataTable();
                                    });

        </script>
        <script>
            function a()
            {
            <%
                try {
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
    </body>
</html>




