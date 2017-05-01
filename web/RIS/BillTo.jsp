
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
    <th style="text-align: center;">Send the bill</th>
</thead>
<tbody>


    <%
        String whereClause = "";
        if (!hfc_cd.equals("99_iHIS_99") || !last_nine.equals("9")) {
            whereClause = " AND ris_order_master.hfc_cd = '" + hfc_cd + "' ";
        }
        String sql = "";

        if (ic != "") {
            sql = "SELECT ris_order_master.pmi_no,ris_order_master.order_no,ris_order_master.hfc_cd,ris_order_master.episode_date,ris_order_master.encounter_date,ris_order_master.order_date,ris_order_master.order_by,ris_order_master.hfc_from,ris_order_master.hfc_to,ris_order_master.order_status,ris_order_master.diagnosis_cd,ris_order_master.created_by,ris_order_master.created_date,pms_patient_biodata.PATIENT_NAME,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE FROM ris_order_master JOIN pms_patient_biodata ON (ris_order_master.pmi_no = pms_patient_biodata.PMI_NO) WHERE ris_order_master.order_status='2' AND ris_order_master.billing_status='0' AND pms_patient_biodata.NEW_IC_NO = '" + ic + "' " + whereClause;
        } else if (order_no != "") {
            sql = "SELECT ris_order_master.pmi_no,ris_order_master.order_no,ris_order_master.hfc_cd,ris_order_master.episode_date,ris_order_master.encounter_date,ris_order_master.order_date,ris_order_master.order_by,ris_order_master.hfc_from,ris_order_master.hfc_to,ris_order_master.order_status,ris_order_master.diagnosis_cd,ris_order_master.created_by,ris_order_master.created_date,pms_patient_biodata.PATIENT_NAME,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE FROM ris_order_master JOIN pms_patient_biodata ON (ris_order_master.pmi_no = pms_patient_biodata.PMI_NO) WHERE ris_order_master.order_status='2' AND ris_order_master.order_no = '" + order_no + "'" + whereClause;
        } else if (DateFrom != "" && DateTo != "") {
            sql = "SELECT ris_order_master.pmi_no,ris_order_master.order_no,ris_order_master.hfc_cd,ris_order_master.episode_date,ris_order_master.encounter_date,ris_order_master.order_date,ris_order_master.order_by,ris_order_master.hfc_from,ris_order_master.hfc_to,ris_order_master.order_status,ris_order_master.diagnosis_cd,ris_order_master.created_by,ris_order_master.created_date,pms_patient_biodata.PATIENT_NAME,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE FROM ris_order_master JOIN pms_patient_biodata ON (ris_order_master.pmi_no = pms_patient_biodata.PMI_NO) WHERE ris_order_master.order_status='2' AND ris_order_master.billing_status='0' AND ris_order_master.created_date BETWEEN '" + DateFrom + "' AND '" + DateTo + "'" + whereClause;
        }

        ArrayList<ArrayList<String>> dataPatientOrderList = conn.getData(sql);

        int size = dataPatientOrderList.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr id="moveToRISOrderDetailsTButton" style="text-align: center;">

        <td><%= dataPatientOrderList.get(i).get(1)%></td> <!-- Order No -->
        <td><%= dataPatientOrderList.get(i).get(0)%></td> <!-- PMI No -->
        <td><%= dataPatientOrderList.get(i).get(14)%></td> <!-- IC No -->
        <td><%= dataPatientOrderList.get(i).get(13)%></td> <!-- Name -->
        <td><%= dataPatientOrderList.get(i).get(5)%></td> <!-- Order Date -->
        <td><%= dataPatientOrderList.get(i).get(2)%></td> <!-- Health Facility Code -->
        <td><%= dataPatientOrderList.get(i).get(6)%></td> <!-- Doctor's Name -->

        <td>
            <input type="checkbox" id="checky" name="order" value="<%= dataPatientOrderList.get(i).get(1)%>|<%= dataPatientOrderList.get(i).get(0)%>|<%= dataPatientOrderList.get(i).get(5)%>|<%=dataPatientOrderList.get(i).get(14)%>|<%=dataPatientOrderList.get(i).get(13)%>">
        </td><!-- Doctor's Name -->
    </tr>
    <%
        }
    %>
</tbody>
</table>


<button class="btn btn-primary " type="button" id="btnSendToBill" name="btnSendToBill" > <i class="fa fa-print fa-lg"></i>&nbsp; Send &nbsp;</button>
<hr class="pemisah">


<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {
        $('#BillTo').DataTable({
            language: {
                emptyTable: "No Order Available To Display"
            }, initComplete: function (settings, json) {
                destroyScreenLoading();
            }
        });
    });


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
            bootbox.alert('Please tick at least one order to be posted to billing');

        } else {
            var data = {
                longData: strLongData
            };
            createScreenLoading();

            $.ajax({
                type: 'POST',
                url: "order_control/send_to_bill.jsp",
                data: data,
                success: function (data, textStatus, jqXHR) {
                    if (data.trim() === 'success') {
                        bootbox.alert('Sent to billing.');

                        loadBillTable();


                    } else if (data.trim() === 'fail') {
                        bootbox.alert('Failed to send to billing.');

                    }else{
                        console.log(data.trim());
                    }

                    destroyScreenLoading();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    bootbox.alert('Opps! ' + errorThrown);
                    destroyScreenLoading();
                }
            });//end ajax
        }



        console.log(strLongData);

        loadBillTable();
    });


</script>

