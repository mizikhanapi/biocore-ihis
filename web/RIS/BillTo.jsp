<%-- 
    Document   : BillTo
    Created on : Apr 25, 2017, 11:51:10 AM
    Author     : Raziff
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
    String ic = request.getParameter("ic");
    String order_no = request.getParameter("order_no");
    String DateFrom = request.getParameter("DateFrom");
    String DateTo = request.getParameter("DateTo");
    //out.print(DateFrom+" "+DateTo+" "+order_no+" "+ic);
    //String textSearch = "950405025185";
    //String idcat = request.getParameter("idcat");
    String current_user = (String) session.getAttribute("USER_ID");
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String last_nine = current_user.substring(current_user.length() - 1);
%>
<hr class="pemisah">
<table  id="BillTo"  class="table table-filter table-striped table-bordered table-hover" style="background: #fff; border: 1px solid #ccc; width: 100%">
    <thead>
    <th style="text-align: center; width: 8%;">Order No.</th>
    <th style="text-align: center; width: 10%;">PMI No.</th>
    <th style="text-align: center; width: 10%;">IC No.</th>
    <th style="text-align: center; width: 40%;">Name</th>
    <th style="text-align: center; width: 12%;">Order Date</th>
    <th style="text-align: center;">Health Facility Code</th>
    <th style="text-align: center;">Doctor's Name</th>
    <th style="text-align: center;">Action</th>
    <th style="text-align: center;">Send the bill</th>
</thead>
<tbody>


    <%
        //String whereClause = "";
        //if (!hfc_cd.equals("99_iHIS_99") || !last_nine.equals("9")) {
        // whereClause = "ris_order_master.hfc_cd = '"+hfc_cd+"' ";
        //}
        String sql = "";

        if (ic != "") {
            sql = "SELECT ris_order_master.pmi_no,ris_order_master.order_no,ris_order_master.hfc_cd,ris_order_master.episode_date,ris_order_master.encounter_date,ris_order_master.order_date,ris_order_master.order_by,ris_order_master.hfc_from,ris_order_master.hfc_to,ris_order_master.order_status,ris_order_master.diagnosis_cd,ris_order_master.created_by,ris_order_master.created_date,pms_patient_biodata.PATIENT_NAME,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE FROM ris_order_master JOIN pms_patient_biodata ON (ris_order_master.pmi_no = pms_patient_biodata.PMI_NO) WHERE ris_order_master.order_status='2' AND ris_order_master.billing_status='0' AND pms_patient_biodata.NEW_IC_NO = '" + ic + "' AND ris_order_master.hfc_cd = '" + hfc_cd + "'";
        } else if (order_no != "") {
            sql = "SELECT ris_order_master.pmi_no,ris_order_master.order_no,ris_order_master.hfc_cd,ris_order_master.episode_date,ris_order_master.encounter_date,ris_order_master.order_date,ris_order_master.order_by,ris_order_master.hfc_from,ris_order_master.hfc_to,ris_order_master.order_status,ris_order_master.diagnosis_cd,ris_order_master.created_by,ris_order_master.created_date,pms_patient_biodata.PATIENT_NAME,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE FROM ris_order_master JOIN pms_patient_biodata ON (ris_order_master.pmi_no = pms_patient_biodata.PMI_NO) WHERE ris_order_master.order_status='2' AND ris_order_master.hfc_cd = '" + hfc_cd + "' AND ris_order_master.order_no = '" + order_no + "'";
        } else if (DateFrom != "" && DateTo != "") {
            sql = "SELECT ris_order_master.pmi_no,ris_order_master.order_no,ris_order_master.hfc_cd,ris_order_master.episode_date,ris_order_master.encounter_date,ris_order_master.order_date,ris_order_master.order_by,ris_order_master.hfc_from,ris_order_master.hfc_to,ris_order_master.order_status,ris_order_master.diagnosis_cd,ris_order_master.created_by,ris_order_master.created_date,pms_patient_biodata.PATIENT_NAME,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE FROM ris_order_master JOIN pms_patient_biodata ON (ris_order_master.pmi_no = pms_patient_biodata.PMI_NO) WHERE ris_order_master.order_status='2' AND ris_order_master.billing_status='0' AND ris_order_master.hfc_cd = '" + hfc_cd + "' AND ris_order_master.created_date BETWEEN '" + DateFrom + "' AND '" + DateTo + "'";
        }

        ArrayList<ArrayList<String>> dataPatientOrderList = conn.getData(sql);

        int size = dataPatientOrderList.size();
        for (int i = 0; i < size; i++) {
    %>

<tr id="moveToRISOrderDetailsTButton" style="text-align: center;">
<input id="dataPatientOrderListhidden" type="hidden" value="<%=String.join("|", dataPatientOrderList.get(i))%>">
<td><%= dataPatientOrderList.get(i).get(1)%></td> <!-- Order No -->
<td><%= dataPatientOrderList.get(i).get(0)%></td> <!-- PMI No -->
<td><%= dataPatientOrderList.get(i).get(14)%></td> <!-- IC No -->
<td><%= dataPatientOrderList.get(i).get(13)%></td> <!-- Name -->
<td><%= dataPatientOrderList.get(i).get(5)%></td> <!-- Order Date -->
<td><%= dataPatientOrderList.get(i).get(2)%></td> <!-- Health Facility Code -->
<td><%= dataPatientOrderList.get(i).get(6)%></td> <!-- Doctor's Name -->
<td><button class="btn btn-success " type="button" id="btnOrderDispense_<%=i%>" name="btnOrderDispense" > <i class="fa fa-shopping-cart fa-lg"></i></button>
    <script>

        //    $('input:checkbox').click(function () {
        //        if ($(this).is(':checked')) {
        //            $('#btnOrderDispense').prop("disabled", false);
        //            //$('#reject').prop("disabled", false);
        //            //$('#AssignResult').prop("disabled", false);
        //            //$('#VerifyResult').prop("disabled", false);
        //        } else {
        //            if ($('.chk').filter(':checked').length < 1) {
        //                $('#btnOrderDispense').attr('disabled', true);
        //                //$('#reject').prop("disabled", true);
        //                //$('#AssignResult').prop("disabled", true);
        //                //$('#VerifyResult').prop("disabled", true);
        //            }
        //        }
        //    });
        $("#btnOrderDispense_<%=i%>").click(function () {

            var row = $(this).closest("tr");
            var rowData = row.find("#dataPatientOrderListhidden").val();
            var arrayData = rowData.split("|");
            console.log(arrayData);

            //Assign Array into seprated val
            var patientpmino = arrayData[0];
            var patientName = arrayData[15];
            var patientnic = arrayData[16];
            var patientGender = arrayData[21];
            var patientBdate = arrayData[17];
            var patientBtype = arrayData[22];
            var patientOrderNo = arrayData[1];
            var patientOrderDate = arrayData[5];
            var patientOrderLocationCode = arrayData[2];


            var pmiNo = patientpmino;
            var orderNo = patientOrderNo;
            var orderDate = patientOrderDate;
            alert(pmiNo + " " + orderNo + " " + orderDate);
            var data = {
                pmiNo: pmiNo,
                orderNo: orderNo,
                orderDate: orderDate
            };
            $.ajax({
                url: "patientOrderListDetailDispenseEHRCentralGetMSH.jsp",
                type: "post",
                timeout: 3000,
                data: data,
                success: function (returnDataMSHFull) {

                    $.ajax({
                        url: "patientOrderListDetailDispenseEHRCentralGetPDIFinal.jsp",
                        type: "post",
                        timeout: 3000,
                        data: data,
                        success: function (returnDataPDIFull) {


                            $.ajax({
                                url: "patientOrderListDetailDispenseEHRCentralGetORC.jsp",
                                type: "post",
                                data: data,
                                timeout: 3000,
                                success: function (returnDataORCFull) {

                                    //Set value to the Second Tab 
                                    $("#patientpmino").val(patientpmino);
                                    $("#patientName").val(patientName);
                                    $("#patientnic").val(patientnic);
                                    $("#patientGender").val(patientGender);
                                    $("#patientBdate").val(patientBdate);
                                    $("#patientBtype").val(patientBtype);
                                    $("#patientOrderNo").val(patientOrderNo);
                                    $("#patientOrderDate").val(patientOrderDate);
                                    $("#patientOrderLocationCode").val(patientOrderLocationCode);
                                    $("#dataMSHPDIORC").val(returnDataMSHFull.trim() + returnDataPDIFull.trim() + returnDataORCFull.trim());

                                    console.log(returnDataMSHFull.trim());
                                    console.log(returnDataPDIFull.trim());
                                    console.log(returnDataORCFull.trim());
                                    console.log($("#dataMSHPDIORC").val());

                                    //loadAllergyDiagnosisOrder(patientOrderNo, patientpmino);

                                    $.ajax({
                                        url: "patientOrderListDetailItem.jsp",
                                        type: "post",
                                        data: data,
                                        timeout: 3000,
                                        success: function (returnDataItem) {
                                            $("#datatest").val(returnDataItem.trim());
                                            //$('#dataItem').html(returnDataItem);
                                            //$('#dataItem').trigger('contentchanged');
                                            console.log(returnDataItem.trim());
                                            console.log($("#datatest").val());



                                        }
                                    });

                                }
                            });

                        }
                    });

                }
            });

        });



    </script>
</td>
<td>
    <input type="checkbox" id="checky" name="order" value="<%= dataPatientOrderList.get(i).get(1)%>|<%= dataPatientOrderList.get(i).get(0)%>|<%= dataPatientOrderList.get(i).get(5)%>|<%=dataPatientOrderList.get(i).get(14)%>|<%=dataPatientOrderList.get(i).get(13)%>">
</td><!-- Doctor's Name -->
</tr>
<%
    }
%>
</tbody>
</table>

<div>
    <!-- content goes here -->
    <form class="form-horizontal" id="addForm">
        <div class="row">
            <div class="col-md-2">
                <input id="dispenseFarBillNo" name="dispenseFarBillNo" type="hidden" class="form-control input-md" maxlength="50" readonly="" value="1253000000019325042017">
            </div>

            <div class="col-md-4">
                <input id="dispenseTotalQuantity" name="dispenseTotalQuantity" type="hidden" placeholder="Total Order" class="form-control input-md" maxlength="50" readonly="" value="0">
                <input id="dispenseTotalQuantityChecked" name="dispenseTotalQuantityChecked" type="hidden" placeholder="Total Order" class="form-control input-md" maxlength="50" readonly="" value="0">

            </div>
        </div>
    </form>
</div>


<button class="btn btn-primary " type="button" id="btnSendToBill" name="btnSendToBill" > <i class="fa fa-print fa-lg"></i>&nbsp; Send &nbsp;</button>
<hr class="pemisah">
<textarea rows="4" cols="50" id="dataMSHPDIORC" style=" display: none">
</textarea>

<textarea rows="4" cols="50" id="datatest" style=" display: none">
</textarea>

<textarea rows="4" cols="50" id="datatest1" style=" display: none">
</textarea>



<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {
        $('#BillTo').DataTable({
            language: {
                emptyTable: "No Order Available To Display"
            }, initComplete: function (settings, json) {
                $('.loading').hide();
            }
        });
    });


    $("#btnSendToBill").click(function () {
        var rates = document.getElementsByName('order');
        var rate_value;

        for (var i = 0; i < rates.length; i++) {
            if (rates[i].checked) {
                rate_value = rates[i].value;
                var arrayData1 = rate_value.split("|");
                console.log(arrayData1);

                var patientorderNo = arrayData1[0];
                var patientpmino = arrayData1[1];
                var patientOrderDate = arrayData1[2];
                var patientnic = arrayData1[3];
                var patientName = arrayData1[4];

                alert(patientpmino + "  " + patientorderNo + "  " + patientOrderDate + "  " + patientnic + "  " + patientName);
                var data = {
                    pmiNo: patientpmino,
                    orderNo: patientorderNo,
                    orderDate: patientOrderDate
                };
                $.ajax({
                    url: "patientOrderListDetailDispenseEHRCentralGetMSH.jsp",
                    type: "post",
                    timeout: 3000,
                    data: data,
                    success: function (returnDataMSHFull) {

                        $.ajax({
                            url: "patientOrderListDetailDispenseEHRCentralGetPDIFinal.jsp",
                            type: "post",
                            timeout: 3000,
                            data: data,
                            success: function (returnDataPDIFull) {


                                $.ajax({
                                    url: "patientOrderListDetailDispenseEHRCentralGetORC.jsp",
                                    type: "post",
                                    data: data,
                                    timeout: 3000,
                                    success: function (returnDataORCFull) {

                                        //Set value to the Second Tab 
                                        $("#patientpmino").val(patientpmino);
                                        $("#patientName").val(patientName);
                                        $("#patientnic").val(patientnic);
                                        //$("#patientGender").val(patientGender);
                                        //$("#patientBdate").val(patientBdate);
                                        //$("#patientBtype").val(patientBtype);
                                        //$("#patientOrderNo").val(patientorderNo);
                                        //$("#patientOrderDate").val(patientOrderDate);
                                        //$("#patientOrderLocationCode").val(patientOrderLocationCode);
                                        $("#dataMSHPDIORC").val(returnDataMSHFull.trim() + returnDataPDIFull.trim() + returnDataORCFull.trim());

                                        console.log(returnDataMSHFull.trim());
                                        console.log(returnDataPDIFull.trim());
                                        console.log(returnDataORCFull.trim());
                                        console.log($("#dataMSHPDIORC").val());

                                        //loadAllergyDiagnosisOrder(patientOrderNo, patientpmino);

                                        $.ajax({
                                            url: "patientOrderListDetailItem.jsp",
                                            type: "post",
                                            data: data,
                                            timeout: 3000,
                                            success: function (returnDataItem) {
                                                $("#datatest").val(returnDataItem.trim());
                                                $("#datatest1").val(returnDataMSHFull.trim() + returnDataPDIFull.trim() + returnDataORCFull.trim() + returnDataItem.trim());
                                                //$('#dataItem').html(returnDataItem);
                                                //$('#dataItem').trigger('contentchanged');
                                                console.log(returnDataItem.trim());
                                                console.log($("#datatest").val());
                                                console.log($("#datatest1").val());
                                                var ehr_central = $("#datatest1").val();
                                                //alert(ehr_central);

                                                var data1 = {
                                                    pmiNo: patientpmino,
                                                    ehr_central: ehr_central
                                                };
                                                $.ajax({
                                                    url: "sentToEHRcentral.jsp",
                                                    type: "post",
                                                    data: data1,
                                                    timeout: 3000,
                                                    success: function (returnEHR) {

                                                        alert("Success transfer to Billing");


                                                    }
                                                });

                                            }
                                        });

                                    }
                                });

                            }
                        });

                    }
                });

            }
        }
    });


</script>

