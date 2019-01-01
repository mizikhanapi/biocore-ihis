<%-- 
    Document   : manageSendToBillDetail
    Created on : Jan 18, 2018, 8:17:17 PM
    Author     : Shammugam
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

    String current_user = (String) session.getAttribute("USER_ID");
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String last_nine = current_user.substring(current_user.length() - 1);
%>
<hr class="pemisah">

<table  id="LISBillTo"  class="table table-filter table-striped table-bordered table-hover" style="background: #fff; border: 1px solid #ccc; width: 100%">
    <thead>
    <th style="text-align: left;"></th>
    <th style="text-align: left; width: 8%;">Order No.</th>
    <th style="text-align: left; width: 10%;">PMI No.</th>
    <th style="text-align: left; width: 10%;">IC No.</th>
    <th style="text-align: left; width: 40%;">Name</th>
    <th style="text-align: left; width: 12%;">Order Date</th>
    <th style="text-align: left;">Health Facility Code</th>
    <th style="text-align: left;">Doctor's Name</th>
    <th style="text-align: left;">Bill status</th>
</thead>
<tbody>


    <%
        String whereClause = "";
        if (!hfc_cd.equals("99_iHIS_99") || !last_nine.equals("9")) {
            whereClause = " AND lis_order_master.hfc_to = '" + hfc_cd + "' ";
        }
        String sql = "";

        if (!ic.equalsIgnoreCase("")) {

            //                          0                   1                       2                           3
            sql = "SELECT lis_order_master.pmi_no, lis_order_master.order_no, lis_order_master.hfc_cd, lis_order_master.episode_date, "
                    //                  4                               5                           6                           7
                    + " lis_order_master.encounter_date, lis_order_master.order_date, lis_order_master.order_by, lis_order_master.hfc_from, "
                    //              8                       9                               10                              11
                    + " lis_order_master.hfc_to, lis_order_master.order_status, lis_order_master.diagnosis_cd, lis_order_master.created_by,"
                    //              12                              13                              14                          15
                    + " lis_order_master.created_date, pms_patient_biodata.PATIENT_NAME, pms_patient_biodata.NEW_IC_NO, pms_patient_biodata.BIRTH_DATE,"
                    //                  16                          17                                  18
                    + " pms_patient_biodata.SEX_CODE, pms_patient_biodata.BLOOD_TYPE, lis_order_master.billing_status,DATE_FORMAT(lis_order_master.order_date, '%d/%m/%Y %T') "
                    // FROM
                    + " FROM lis_order_master "
                    // JOIN PMS PATIENT
                    + " LEFT JOIN pms_patient_biodata ON (lis_order_master.pmi_no = pms_patient_biodata.PMI_NO) "
                    // WHERE CONDITION
                    + " WHERE lis_order_master.order_status = '3' AND lis_order_master.billing_status='0' AND pms_patient_biodata.NEW_IC_NO = '" + ic + "' " + whereClause;

        } else if (!order_no.equalsIgnoreCase("")) {

            //                          0                   1                       2                           3
            sql = "SELECT lis_order_master.pmi_no, lis_order_master.order_no, lis_order_master.hfc_cd, lis_order_master.episode_date, "
                    //                  4                               5                           6                           7
                    + " lis_order_master.encounter_date, lis_order_master.order_date, lis_order_master.order_by, lis_order_master.hfc_from, "
                    //              8                       9                               10                              11
                    + " lis_order_master.hfc_to, lis_order_master.order_status, lis_order_master.diagnosis_cd, lis_order_master.created_by,"
                    //              12                              13                              14                          15
                    + " lis_order_master.created_date, pms_patient_biodata.PATIENT_NAME, pms_patient_biodata.NEW_IC_NO, pms_patient_biodata.BIRTH_DATE,"
                    //                  16                          17                                  18
                    + " pms_patient_biodata.SEX_CODE, pms_patient_biodata.BLOOD_TYPE, lis_order_master.billing_status,DATE_FORMAT(lis_order_master.order_date, '%d/%m/%Y %T') "
                    // FROM
                    + " FROM lis_order_master "
                    // JOIN PMS PATIENT
                    + " LEFT JOIN pms_patient_biodata ON (lis_order_master.pmi_no = pms_patient_biodata.PMI_NO) "
                    // WHERE CONDITION
                    + " WHERE lis_order_master.order_status = '3' AND lis_order_master.billing_status='0' AND lis_order_master.order_no = '" + order_no + "'" + whereClause;

        } else if (!DateFrom.equalsIgnoreCase("") && !DateTo.equalsIgnoreCase("")) {

            //                          0                   1                       2                           3
            sql = "SELECT lis_order_master.pmi_no, lis_order_master.order_no, lis_order_master.hfc_cd, lis_order_master.episode_date, "
                    //                  4                               5                           6                           7
                    + " lis_order_master.encounter_date, lis_order_master.order_date, lis_order_master.order_by, lis_order_master.hfc_from, "
                    //              8                       9                               10                              11
                    + " lis_order_master.hfc_to, lis_order_master.order_status, lis_order_master.diagnosis_cd, lis_order_master.created_by,"
                    //              12                              13                              14                          15
                    + " lis_order_master.created_date, pms_patient_biodata.PATIENT_NAME, pms_patient_biodata.NEW_IC_NO, pms_patient_biodata.BIRTH_DATE,"
                    //                  16                          17                                  18
                    + " pms_patient_biodata.SEX_CODE, pms_patient_biodata.BLOOD_TYPE, lis_order_master.billing_status,DATE_FORMAT(lis_order_master.order_date, '%d/%m/%Y %T') "
                    // FROM
                    + " FROM lis_order_master "
                    // JOIN PMS PATIENT
                    + " LEFT JOIN pms_patient_biodata ON (lis_order_master.pmi_no = pms_patient_biodata.PMI_NO) "
                    // WHERE CONDITION
                    + "WHERE lis_order_master.order_status = '3' AND lis_order_master.billing_status='0' AND date(lis_order_master.order_date) BETWEEN '" + DateFrom + "' AND '" + DateTo + "'" + whereClause;

        }

        ArrayList<ArrayList<String>> dataPatientOrderList = conn.getData(sql);

        int size = dataPatientOrderList.size();

        for (int i = 0; i < size; i++) {

            String status = "New";
            String disableCheckBox = "";

            if (dataPatientOrderList.get(i).get(18).equalsIgnoreCase("2")) {

                status = "Sent";
                disableCheckBox = "disabled";

            }

    %>
    <tr style="text-align: left;">
        <td>
            <input type="checkbox" id="checky" name="order" <%=disableCheckBox%> value="<%= dataPatientOrderList.get(i).get(1)%>|<%= dataPatientOrderList.get(i).get(0)%>|<%= dataPatientOrderList.get(i).get(5)%>|<%=dataPatientOrderList.get(i).get(3)%>|<%=dataPatientOrderList.get(i).get(4)%>">
        </td><!-- Check -->
        <td><%= dataPatientOrderList.get(i).get(1)%></td> <!-- Order No -->
        <td><%= dataPatientOrderList.get(i).get(0)%></td> <!-- PMI No -->
        <td><%= dataPatientOrderList.get(i).get(14)%></td> <!-- IC No -->
        <td><%= dataPatientOrderList.get(i).get(13)%></td> <!-- Name -->
        <td><%= dataPatientOrderList.get(i).get(19)%></td> <!-- Order Date -->
        <td><%= dataPatientOrderList.get(i).get(2)%></td> <!-- Health Facility Code -->
        <td><%= dataPatientOrderList.get(i).get(6)%></td> <!-- Doctor's Name -->
        <td><%= status%></td> <!-- bill status -->
    </tr>
    <%
        }
    %>
</tbody>
</table>
<hr />
<div class="text-right">
    <button class="btn btn-primary " type="button" id="btnSendToBill" name="btnSendToBill" > <i class="fa fa-print fa-lg"></i>&nbsp; Send &nbsp;</button>    
</div>

<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {


        $('#LISBillTo').DataTable({
            language: {
                emptyTable: "No Completed Order Available To Display"
            }, initComplete: function (settings, json) {
                $('.loading').hide();
            }
        });


    });


    // Send To Billing Button Function Start
    $("#btnSendToBill").click(function () {

        var rates = document.getElementsByName('order');

        var selectedBox = [];

        for (var i = 0; i < rates.length; i++) {

            if (rates[i].checked) {

                selectedBox.push(rates[i].value);

            }

        }//end for


        var strLongData = selectedBox.join('^');


        if (strLongData === '') {

            bootbox.alert('Please tick at least one test item.');

        } else {


            var data = {
                longData: strLongData
            };


            $.ajax({
                type: 'POST',
                url: "controllerProcessSendToBilling/manageSendToBillSend.jsp",
                data: data,
                success: function (data, textStatus, jqXHR) {

                    if (data.trim() === 'success') {

                        bootbox.alert('Sent to billing.');
                        loadBillTable();

                    } else if (data.trim() === 'fail') {

                        bootbox.alert('Failed to send to billing.');

                    } else {

                        console.log(data.trim());

                    }


                },
                error: function (jqXHR, textStatus, errorThrown) {

                    bootbox.alert('Error: ' + errorThrown);

                }
            });


        }

        loadBillTable();

    });
    // Send To Billing Button Function End



</script>

