
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
    String dateType = request.getParameter("dateType");
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
            whereClause = " AND ris_order_master.hfc_to = '" + hfc_cd + "' ";
        }
        String sql = "";
        //                       0                          1                       2                           3                           4                                   5                    6                                7                        8                     9                           10                             11                              12                         13                               14                              15                              16                      17                              18                  
        if (!ic.equalsIgnoreCase("")) {
            sql = "SELECT ris_order_master.pmi_no,ris_order_master.order_no,ris_order_master.hfc_cd,ris_order_master.episode_date,ris_order_master.encounter_date,DATE_FORMAT(ris_order_master.order_date,'%d/%m/%Y %T'),ris_order_master.order_by,ris_order_master.hfc_from,ris_order_master.hfc_to,ris_order_master.order_status,ris_order_master.diagnosis_cd,ris_order_master.created_by,ris_order_master.created_date,pms_patient_biodata.PATIENT_NAME,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE, ris_order_master.billing_status FROM ris_order_master JOIN pms_patient_biodata ON (ris_order_master.pmi_no = pms_patient_biodata.PMI_NO) WHERE ris_order_master.order_status='2' AND ris_order_master.billing_status='0' AND pms_patient_biodata.NEW_IC_NO = '" + ic + "' " + whereClause;
        } else if (!order_no.equalsIgnoreCase("")) {
            sql = "SELECT ris_order_master.pmi_no,ris_order_master.order_no,ris_order_master.hfc_cd,ris_order_master.episode_date,ris_order_master.encounter_date,DATE_FORMAT(ris_order_master.order_date,'%d/%m/%Y %T'),ris_order_master.order_by,ris_order_master.hfc_from,ris_order_master.hfc_to,ris_order_master.order_status,ris_order_master.diagnosis_cd,ris_order_master.created_by,ris_order_master.created_date,pms_patient_biodata.PATIENT_NAME,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE, ris_order_master.billing_status FROM ris_order_master JOIN pms_patient_biodata ON (ris_order_master.pmi_no = pms_patient_biodata.PMI_NO) WHERE ris_order_master.order_status='2' AND ris_order_master.order_no = '" + order_no + "'" + whereClause;
        } else if (dateType.equalsIgnoreCase("custom") && !dateType.isEmpty() ) {
            sql = "SELECT ris_order_master.pmi_no,ris_order_master.order_no,ris_order_master.hfc_cd,ris_order_master.episode_date,ris_order_master.encounter_date,DATE_FORMAT(ris_order_master.order_date,'%d/%m/%Y %T'),ris_order_master.order_by,ris_order_master.hfc_from,ris_order_master.hfc_to,ris_order_master.order_status,ris_order_master.diagnosis_cd,ris_order_master.created_by,ris_order_master.created_date,pms_patient_biodata.PATIENT_NAME,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE, ris_order_master.billing_status FROM ris_order_master JOIN pms_patient_biodata ON (ris_order_master.pmi_no = pms_patient_biodata.PMI_NO) WHERE ris_order_master.order_status='2' AND ris_order_master.billing_status='0' AND date(ris_order_master.order_date) BETWEEN STR_TO_DATE('" + DateFrom + "','%d/%m/%Y') and STR_TO_DATE('" + DateTo + "','%d/%m/%Y') " + whereClause;
        }else if (dateType.equalsIgnoreCase("today") && !dateType.isEmpty() ) {
            sql = "SELECT ris_order_master.pmi_no,ris_order_master.order_no,ris_order_master.hfc_cd,ris_order_master.episode_date,ris_order_master.encounter_date,DATE_FORMAT(ris_order_master.order_date,'%d/%m/%Y %T'),ris_order_master.order_by,ris_order_master.hfc_from,ris_order_master.hfc_to,ris_order_master.order_status,ris_order_master.diagnosis_cd,ris_order_master.created_by,ris_order_master.created_date,pms_patient_biodata.PATIENT_NAME,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE, ris_order_master.billing_status FROM ris_order_master JOIN pms_patient_biodata ON (ris_order_master.pmi_no = pms_patient_biodata.PMI_NO) WHERE ris_order_master.order_status='2' AND ris_order_master.billing_status='0' AND date(ris_order_master.order_date) = date(now()) " + whereClause;
        }else if (dateType.equalsIgnoreCase("yesterday") && !dateType.isEmpty() ) {
            sql = "SELECT ris_order_master.pmi_no,ris_order_master.order_no,ris_order_master.hfc_cd,ris_order_master.episode_date,ris_order_master.encounter_date,DATE_FORMAT(ris_order_master.order_date,'%d/%m/%Y %T'),ris_order_master.order_by,ris_order_master.hfc_from,ris_order_master.hfc_to,ris_order_master.order_status,ris_order_master.diagnosis_cd,ris_order_master.created_by,ris_order_master.created_date,pms_patient_biodata.PATIENT_NAME,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE, ris_order_master.billing_status FROM ris_order_master JOIN pms_patient_biodata ON (ris_order_master.pmi_no = pms_patient_biodata.PMI_NO) WHERE ris_order_master.order_status='2' AND ris_order_master.billing_status='0' AND date(ris_order_master.order_date) = DATE(NOW() - INTERVAL 1 DAY) " + whereClause;
        }else if (dateType.equalsIgnoreCase("7") && !dateType.isEmpty() ) {
            sql = "SELECT ris_order_master.pmi_no,ris_order_master.order_no,ris_order_master.hfc_cd,ris_order_master.episode_date,ris_order_master.encounter_date,DATE_FORMAT(ris_order_master.order_date,'%d/%m/%Y %T'),ris_order_master.order_by,ris_order_master.hfc_from,ris_order_master.hfc_to,ris_order_master.order_status,ris_order_master.diagnosis_cd,ris_order_master.created_by,ris_order_master.created_date,pms_patient_biodata.PATIENT_NAME,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE, ris_order_master.billing_status FROM ris_order_master JOIN pms_patient_biodata ON (ris_order_master.pmi_no = pms_patient_biodata.PMI_NO) WHERE ris_order_master.order_status='2' AND ris_order_master.billing_status='0' AND (date(ris_order_master.order_date) between SUBDATE(CURDATE(),7) and CURDATE()) " + whereClause;
        }else if (dateType.equalsIgnoreCase("30") && !dateType.isEmpty() ) {
            sql = "SELECT ris_order_master.pmi_no,ris_order_master.order_no,ris_order_master.hfc_cd,ris_order_master.episode_date,ris_order_master.encounter_date,DATE_FORMAT(ris_order_master.order_date,'%d/%m/%Y %T'),ris_order_master.order_by,ris_order_master.hfc_from,ris_order_master.hfc_to,ris_order_master.order_status,ris_order_master.diagnosis_cd,ris_order_master.created_by,ris_order_master.created_date,pms_patient_biodata.PATIENT_NAME,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE, ris_order_master.billing_status FROM ris_order_master JOIN pms_patient_biodata ON (ris_order_master.pmi_no = pms_patient_biodata.PMI_NO) WHERE ris_order_master.order_status='2' AND ris_order_master.billing_status='0' AND (date(ris_order_master.order_date) between SUBDATE(CURDATE(),30) and CURDATE()) " + whereClause;
        }else if (dateType.equalsIgnoreCase("60") && !dateType.isEmpty() ) {
            sql = "SELECT ris_order_master.pmi_no,ris_order_master.order_no,ris_order_master.hfc_cd,ris_order_master.episode_date,ris_order_master.encounter_date,DATE_FORMAT(ris_order_master.order_date,'%d/%m/%Y %T'),ris_order_master.order_by,ris_order_master.hfc_from,ris_order_master.hfc_to,ris_order_master.order_status,ris_order_master.diagnosis_cd,ris_order_master.created_by,ris_order_master.created_date,pms_patient_biodata.PATIENT_NAME,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE, ris_order_master.billing_status FROM ris_order_master JOIN pms_patient_biodata ON (ris_order_master.pmi_no = pms_patient_biodata.PMI_NO) WHERE ris_order_master.order_status='2' AND ris_order_master.billing_status='0' AND (date(ris_order_master.order_date) between SUBDATE(CURDATE(),60) and CURDATE()) " + whereClause;
        }

        ArrayList<ArrayList<String>> dataPatientOrderList = conn.getData(sql);

        int size = dataPatientOrderList.size();
        
        for (int i = 0; i < size; i++) {
            String status = "New";
            String disableCheckBox = "";
            
            if(dataPatientOrderList.get(i).get(18).equalsIgnoreCase("2")){
            
                status = "Sent";
                disableCheckBox = "disabled";
            }
            
    %>

    <tr id="moveToRISOrderDetailsTButton" style="text-align: left;">
        <td>
            <!--                                                                                                            0                                       1                                       2                                   3                                       4-->
            <input type="checkbox" id="checky" name="order" <%=disableCheckBox%> value="<%= dataPatientOrderList.get(i).get(1)%>|<%= dataPatientOrderList.get(i).get(0)%>|<%= dataPatientOrderList.get(i).get(5)%>|<%=dataPatientOrderList.get(i).get(3)%>|<%=dataPatientOrderList.get(i).get(4)%>">
        </td><!-- Doctor's Name -->
        <td><%= dataPatientOrderList.get(i).get(1)%></td> <!-- Order No -->
        <td><%= dataPatientOrderList.get(i).get(0)%></td> <!-- PMI No -->
        <td><%= dataPatientOrderList.get(i).get(14)%></td> <!-- IC No -->
        <td style="font-weight: 500;"><%= dataPatientOrderList.get(i).get(13)%></td> <!-- Name -->
        <td><%= dataPatientOrderList.get(i).get(5)%></td> <!-- Order Date -->
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
        $('#BillTo').DataTable({
            language: {
                emptyTable: "No Completed Order Available To Display"
            }, initComplete: function (settings, json) {
                destroyScreenLoading();
            },"order": [[ 5, "desc" ]]
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
                        bootbox.alert({title:'Success!',message:'Success to send to the billing'});

                        loadBillTable();


                    } else if (data.trim() === 'fail') {
                        bootbox.alert({title:'Failed',message:'Failed to sent to the billing'});

                    }  else {
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

