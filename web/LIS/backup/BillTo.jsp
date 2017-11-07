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
    session.setAttribute("order_no", ic);

    String order_no = request.getParameter("order_no");
    session.setAttribute("order_no", order_no);

    String DateFrom = request.getParameter("DateFrom");
    session.setAttribute("DateFrom", DateFrom);

    String DateTo = request.getParameter("DateTo");
    session.setAttribute("DateTo", DateTo);
    //out.print(DateFrom + " " + DateTo + " " + order_no + " " + ic);
    //String textSearch = "950405025185";
    //String idcat = request.getParameter("idcat");
    String current_user = (String) session.getAttribute("USER_ID");
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String last_nine = current_user.substring(current_user.length() - 1);
%>
<div class="table-guling" id="updateBill">
    <table  id="BillTo"  class="table table-filter table-striped table-bordered table-hover" style="background: #fff; border: 1px solid #ccc; width: 100%">
        <thead>
        <th style="text-align: left;">&nbsp;</th>
        <th style="text-align: left; width: 8%;">Order No.</th>
        <th style="text-align: left; width: 10%;">PMI No.</th>
        <th style="text-align: left; width: 10%;">IC No.</th>
        <th style="text-align: left; width: 40%;">Name</th>
        <th style="text-align: left; width: 12%;">Order Date</th>
        <th style="text-align: left;">Health Facility Code</th>
        <th style="text-align: left;">Doctor's Name</th>
        <th style="text-align: left;">Sent to Bill</th>
        <th style="text-align: left;">Action</th>
        </thead>
        <tbody>


            <%
                //String whereClause = "";
                //if (!hfc_cd.equals("99_iHIS_99") || !last_nine.equals("9")) {
                // whereClause = "lis_order_master.hfc_cd = '"+hfc_cd+"' ";
                //}
                String sql = "";

                if ((!ic.equals(""))) {
                    sql = "SELECT lis_order_master.pmi_no,lis_order_master.order_no,lis_order_master.hfc_cd,lis_order_master.episode_date,lis_order_master.encounter_date,lis_order_master.order_date,lis_order_master.order_by,lis_order_master.hfc_from,lis_order_master.hfc_to,lis_order_master.order_status,lis_order_master.diagnosis_cd,lis_order_master.created_by,lis_order_master.created_date,pms_patient_biodata.PATIENT_NAME,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE,lis_order_master.order_status FROM lis_order_master JOIN pms_patient_biodata ON (lis_order_master.pmi_no = pms_patient_biodata.PMI_NO) WHERE lis_order_master.order_status>='3' AND pms_patient_biodata.NEW_IC_NO = '" + ic + "' ORDER BY lis_order_master.order_status ASC,lis_order_master.order_no ASC";
                }
                if (!order_no.equals("")) {
                    sql = "SELECT lis_order_master.pmi_no,lis_order_master.order_no,lis_order_master.hfc_cd,lis_order_master.episode_date,lis_order_master.encounter_date,lis_order_master.order_date,lis_order_master.order_by,lis_order_master.hfc_from,lis_order_master.hfc_to,lis_order_master.order_status,lis_order_master.diagnosis_cd,lis_order_master.created_by,lis_order_master.created_date,pms_patient_biodata.PATIENT_NAME,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE,lis_order_master.order_status FROM lis_order_master JOIN pms_patient_biodata ON (lis_order_master.pmi_no = pms_patient_biodata.PMI_NO) WHERE lis_order_master.order_status>='3' AND lis_order_master.order_no = '" + order_no + "' ORDER BY lis_order_master.order_status ASC,lis_order_master.order_no ASC";
                }
                if ((!DateFrom.equals("")) && (!DateTo.equals(""))) {
                    sql = "SELECT lis_order_master.pmi_no,lis_order_master.order_no,lis_order_master.hfc_cd,lis_order_master.episode_date,lis_order_master.encounter_date,lis_order_master.order_date,lis_order_master.order_by,lis_order_master.hfc_from,lis_order_master.hfc_to,lis_order_master.order_status,lis_order_master.diagnosis_cd,lis_order_master.created_by,lis_order_master.created_date,pms_patient_biodata.PATIENT_NAME,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE,lis_order_master.order_status FROM lis_order_master JOIN pms_patient_biodata ON (lis_order_master.pmi_no = pms_patient_biodata.PMI_NO) WHERE lis_order_master.order_status>='3' AND lis_order_master.created_date BETWEEN '" + DateFrom + "' AND '" + DateTo + "' ORDER BY lis_order_master.order_status ASC,lis_order_master.order_no ASC";
                }

                ArrayList<ArrayList<String>> dataPatientOrderList = conn.getData(sql);

                int size = dataPatientOrderList.size();
                for (int i = 0; i < size; i++) {
            %>

            <tr id="moveToRISOrderDetailsTButton" style="text-align: left;">
        <input id="dataPatientOrderListhidden" type="hidden" value="<%=String.join("|", dataPatientOrderList.get(i))%>">
        <td>
            <%
                //out.print(dataPatientOrderList.get(i).get(9));
                if (dataPatientOrderList.get(i).get(9).equals("4")) {
            %>
            <input type="checkbox" id="checky" name="order" disabled="disabled" value="<%= dataPatientOrderList.get(i).get(1)%>|<%= dataPatientOrderList.get(i).get(0)%>|<%= dataPatientOrderList.get(i).get(5)%>|<%=dataPatientOrderList.get(i).get(14)%>|<%=dataPatientOrderList.get(i).get(13)%>">
            <%
            } else {
            %>
            <input type="checkbox" id="checky" name="order" value="<%= dataPatientOrderList.get(i).get(1)%>|<%= dataPatientOrderList.get(i).get(0)%>|<%= dataPatientOrderList.get(i).get(5)%>|<%=dataPatientOrderList.get(i).get(14)%>|<%=dataPatientOrderList.get(i).get(13)%>">
            <%
                }
            %>
        </td>
        <td><%= dataPatientOrderList.get(i).get(1)%></td> 
        <td><%= dataPatientOrderList.get(i).get(0)%></td>
        <td><%= dataPatientOrderList.get(i).get(14)%></td> 
        <td style="font-weight: 500;"><%= dataPatientOrderList.get(i).get(13)%></td> 
        <td><%= dataPatientOrderList.get(i).get(5)%></td> 
        <td><%= dataPatientOrderList.get(i).get(2)%></td> 
        <td><%= dataPatientOrderList.get(i).get(6)%></td> 
        <td><%
            //out.print(dataPatientOrderList.get(i).get(9));
            if (dataPatientOrderList.get(i).get(9).equals("4")) {
            %>
            Done
            <%
            } else {
            %>
            Pending
            <%
                }
            %></td>
        <td>
            <%
                //out.print(dataPatientOrderList.get(i).get(9));
                if (dataPatientOrderList.get(i).get(9).equals("4")) {
            %>
            <button class="btn btn-success btn-block " type="button" disabled="disabled" id="btnOrderDispense_<%=i%>" name="btnOrderDispense" > <i class="fa fa-shopping-cart fa-lg"></i>&nbsp;&nbsp;&nbsp;Send Billing</button>
            <%
            } else {
            %>
            <button class="btn btn-success btn-block " type="button" id="btnOrderDispense_<%=i%>" name="btnOrderDispense" > <i class="fa fa-shopping-cart fa-lg"></i>&nbsp;&nbsp;&nbsp;Send Billing</button>
            <%
                }
            %>
            <script>
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
                    var episodeDate = arrayData[3];
                    var encounterDate = arrayData[4];
                    var patientOrderLocationCode = arrayData[2];


                    var pmiNo = patientpmino;
                    var orderNo = patientOrderNo;
                    var orderDate = patientOrderDate;
                    //alert(pmiNo + " " + orderNo + " " + orderDate);
                    var data = {
                        pmiNo: pmiNo,
                        orderNo: orderNo,
                        orderDate: orderDate,
                        episodeDate: episodeDate,
                        encounterDate: encounterDate
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
                                                    $("#datatest1").val(returnDataMSHFull.trim() + "\n" + returnDataPDIFull.trim() + "\n" + returnDataORCFull.trim() + "\n" + returnDataItem.trim());
                                                    //$('#dataItem').html(returnDataItem);
                                                    //$('#dataItem').trigger('contentchanged');
                                                    console.log(returnDataItem.trim());
                                                    console.log($("#datatest").val());
                                                    console.log($("#datatest1").val());
                                                    var ehr_central = $("#datatest1").val();
                                                    //alert(ehr_central);

                                                    var data1 = {
                                                        pmiNo: patientpmino,
                                                        ehr_central: ehr_central,
                                                        order_no: orderNo
                                                    };
                                                    $.ajax({
                                                        url: "sentToEHRcentral.jsp",
                                                        type: "post",
                                                        data: data1,
                                                        timeout: 3000,
                                                        success: function (returnEHR) {

                                                            alert("Success transfer to Billing");
                                                            var dataBill = {
                                                                ic: "<%=ic%>",
                                                                order_no: "<%=order_no%>",
                                                                DateFrom: "<%=DateFrom%>",
                                                                DateTo: "<%=DateTo%>"
                                                            };

                                                            $.ajax({
                                                                url: "BillTo.jsp",
                                                                type: "post",
                                                                data: dataBill,
                                                                timeout: 3000,
                                                                success: function (orderDetail) {
                                                                    $("#viewBill").val(orderDetail.trim());
                                                                    //$('#dataItem').html(returnDataItem);
                                                                    //$('#dataItem').trigger('contentchanged');
                                                                    //console.log(orderDetail.trim());
                                                                    //console.log($("#viewBill").val());
                                                                    $('#viewBill').html(orderDetail);
                                                                    $('#viewBill').trigger('contentchanged');


                                                                },
                                                                error: function (err) {
                                                                    alert("Error update!");
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
                    });

                });



            </script>
        </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>



<hr />
<button class="btn btn-success pull-right" type="button" id="btnSendToBill" name="btnSendToBill"> <i class="fa fa-shopping-cart fa-lg" ></i>&nbsp;&nbsp;&nbsp;Send Selected to Billing</button>

<textarea rows="4" cols="50" id="dataMSHPDIORC" style=" display: none">
</textarea>

<textarea rows="4" cols="50" id="datatest" style=" display: none">
</textarea>

<textarea rows="4" cols="50" id="datatest1" style=" display: none">
</textarea>

<script>

    $('input:checkbox').click(function () {
        if ($(this).is(':checked')) {
            $('#btnSendToBill').prop("disabled", false);
        } else {
            if ($('.chk').filter(':checked').length < 1) {
                $('#btnSendToBill').prop("disabled", true);
            }
        }
    });

</script>

<script type="text/javascript" charset="utf-8">
    $('#btnSendToBill').prop("disabled", true);
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

                sentToBill(patientpmino, patientorderNo, patientOrderDate);

            }

        }

        function refresh()
        {
            var dataBill1 = {
                ic: "<%=ic%>",
                order_no: "<%=order_no%>",
                DateFrom: "<%=DateFrom%>",
                DateTo: "<%=DateTo%>"
            };

            $.ajax({
                url: "BillTo.jsp",
                type: "post",
                data: dataBill1,
                timeout: 3000,
                success: function (orderDetail) {
                    $("#viewBill").val(orderDetail.trim());
                    //$('#dataItem').html(returnDataItem);
                    //$('#dataItem').trigger('contentchanged');
                    //console.log(orderDetail.trim());
                    //console.log($("#viewBill").val());
                    $('#viewBill').html(orderDetail);
                    $('#viewBill').trigger('contentchanged');


                },
                error: function (err) {
                    alert("Error update!");
                }
            });
        }

        function sentToBill(patientpmino, patientorderNo, patientOrderDate) {
            var data = {
                pmiNo: patientpmino,
                orderNo: patientorderNo,
                orderDate: patientOrderDate
            };

            $.ajax({
                url: "patientOrderListDetailDispenseEHRCentralGetMSH.jsp",
                type: "post",
                timeout: 3000,
                data: data[i],
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
                                            $("#datatest1").val(returnDataMSHFull.trim() + "\n" + returnDataPDIFull.trim() + "\n" + returnDataORCFull.trim() + "\n" + returnDataItem.trim());
                                            //$('#dataItem').html(returnDataItem);
                                            //$('#dataItem').trigger('contentchanged');
                                            console.log(returnDataItem.trim());
                                            console.log($("#datatest").val());
                                            console.log($("#datatest1").val());
                                            var ehr_central = $("#datatest1").val();
                                            //alert(ehr_central);

                                            var data1 = {
                                                pmiNo: patientpmino,
                                                ehr_central: ehr_central,
                                                order_no: patientorderNo
                                            };
                                            $.ajax({
                                                url: "sentToEHRcentral.jsp",
                                                type: "post",
                                                data: data1,
                                                timeout: 3000,
                                                success: function (returnEHR) {

                                                    refresh();


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

        alert("Success transfer to Billing");
    });


</script>

