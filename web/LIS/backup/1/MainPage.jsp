<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@ page session="true" %>
<%@include file="../Entrance/validateSession.jsp" %>
<%@include file="validateModuleAccess.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>Main Page</title>
        <script src="assets/js/jquery.min.js"></script>
        <%@include file="../assets/header.html"%>

        <link href="bootstrap-3.3.6-dist/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" href="assets/css/loading.css">
        <link href="assets/datepicker/jquery-ui.css" rel="stylesheet"> 
    </head>

    <body>
        <div class="loading"></div>
        <div class="container-fluid">
            <div class="row"> 
                <!-- menu side -->		
                <%@include file = "libraries/sideMenus.jsp" %>
                <!-- menu side --> 

                <!-- main -->
                <div class="main" style="background: #f2f4f8;" >
                    <!-- menu top -->
                    <%@include file = "libraries/topMenus.html" %>
                    <!-- menu top -->

                    <div class="row" >
                        <div class="col-md-12" >
                            <div class="thumbnail">    
                                <div class="tabbable-line" id="navDiv">
                                    <ul class="nav nav-tabs" id="ulTabs">
                                        <li class="active"> 
                                            <a href="#tab_default_1" data-toggle="tab" >ORDER LIST</a>
                                        </li>
                                        <li> 
                                            <a href="#tab_default_2" data-toggle="tab">ORDER DETAIL</a> 
                                        </li>
                                    </ul>
                                </div>
                                <!-- Tab Menu -->

                                <div class="tabbable-panel">
                                    <div class="tabbable-line">
                                        <!-- tab content -->
                                        <div class="tab-content">
                                            <!--
                                                search and registation tab
                                            -->
                                            <div class="tab-pane active" id="tab_default_1">
                                                <h4>Order List</h4>
                                                <div style="width:50%; margin: auto;">
                                                    <div class="form-horizontal">
                                                        <div class="form-group">
                                                            <label class="col-md-3 control-label" for="textinput">Show list of order: </label>
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
                                                                url: "OrderMaster1.jsp",
                                                                data: data,
                                                                success: function (data) {
                                                                    $("#OrderMaster").val(data.trim());
                                                                    $('#OrderMaster').html(data);
                                                                    $('#OrderMaster').trigger('contentchanged');
                                                                }

                                                            });

                                                        });
                                                    });

                                                </script>
                                                <div id="OrderMaster" class="table-guling">
                                                    <%  Conn conn = new Conn();
                                                        String current_user = (String) session.getAttribute("USER_ID");
                                                        String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
                                                    %>
                                                    <table  id="risManageOrderListTable"  class="table table-filter table-striped table-bordered table-hover" style="background: #fff; border: 1px solid #ccc; width: 100%">
                                                        <thead>
                                                        <th style="width: 8%;">Order No.</th>
                                                        <th style="width: 10%;">PMI No.</th>
                                                        <th style="width: 40%;">Name</th>
                                                        <th style="width: 12%;">Order Date</th>
                                                        <th style="width: 12%;">Doctor's Name</th>
                                                        </thead>
                                                        <tbody>


                                                            <%
                                                                String sql = "SELECT lis_order_master.ORDER_NO,lis_order_master.PMI_NO,ahf.hfc_name,lis_order_master.episode_date,lis_order_master.encounter_date,lis_order_master.order_date,a.`USER_NAME`,lis_order_master.order_from_discipline,lis_order_master.order_to_discipline,lis_order_master.HFC_FROM,lis_order_master.HFC_TO,lis_order_master.created_by,lis_order_master.order_status,pms_patient_biodata.`PATIENT_NAME`,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE,lis_order_master.order_status,s.description,b.description  FROM lis_order_master JOIN pms_patient_biodata ON (lis_order_master.PMI_NO = pms_patient_biodata.PMI_NO) LEFT JOIN adm_lookup_detail s on pms_patient_biodata.SEX_CODE = s.detail_reference_code AND s.master_reference_code = '0041' AND s.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_lookup_detail b on pms_patient_biodata.BLOOD_TYPE = b.detail_reference_code AND b.master_reference_code = '0074' AND b.hfc_cd = lis_order_master.hfc_cd LEFT JOIN adm_users a on lis_order_master.order_by = a.`USER_ID` LEFT JOIN adm_health_facility ahf on lis_order_master.hfc_cd = ahf.hfc_cd WHERE lis_order_master.order_status <= '2' AND lis_order_master.hfc_cd = '" + hfc_cd + "' AND DATE_FORMAT(lis_order_master.order_date, '%Y-%m-%d') = CURDATE() GROUP BY lis_order_master.ORDER_NO DESC";

                                                                ArrayList<ArrayList<String>> dataRISOrderList = conn.getData(sql);

                                                                int size = dataRISOrderList.size();
                                                                for (int i = 0; i < size; i++) {
                                                            %>

                                                            <tr id="moveToRISOrderDetailsTButton" style="cursor: pointer;">
                                                        <input id="dataRISOrderListhidden" type="hidden" value="<%=String.join("|", dataRISOrderList.get(i))%>">
                                                        <td><%= dataRISOrderList.get(i).get(0)%></td> <!-- Order No -->
                                                        <td><%= dataRISOrderList.get(i).get(1)%></td> <!-- PMI No -->
                                                        <td style="font-weight: 500;"><%= dataRISOrderList.get(i).get(13)%></td> <!-- Name -->
                                                        <td><%= dataRISOrderList.get(i).get(5)%></td> <!-- Order Date -->
                                                        <td><%= dataRISOrderList.get(i).get(6)%></td> <!-- Doctor's Name -->
                                                        </tr>
                                                        <%
                                                            }
                                                        %>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <!--
                                                PMI master index  tab
                                            -->
                                            <div class="tab-pane" id="tab_default_2">
                                                <div id="OrderDetail"></div>
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


        <script src="assets/datepicker/jquery-ui.js"></script>
        <script src="assets/js/form-validator.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script> 
        <script src="assets/js/w3data.js"></script>
        <script src="assets/js/bootbox.min.js"></script> 

        <script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>
        <script src="bootstrap-3.3.6-dist/js/jquery.dataTables.min.js"></script>
        <script src="bootstrap-3.3.6-dist/js/dataTables.bootstrap.min.js" type="text/javascript"></script>

        <script>

                                                    $(document).ready(function () {
                                                        $("#OrderMaster").load("OrderMaster1.jsp");
                                                        $("#OrderDetail").load("OrderDetail1.jsp");

                                                        $('#risManageOrderListTable').dataTable({
                                                            "order": [[0, 'desc']],
                                                            language: {
                                                                "emptyTable": "No order available to display for today"

                                                            }
                                                        });
                                                    });
        </script>
    </body>
</html>