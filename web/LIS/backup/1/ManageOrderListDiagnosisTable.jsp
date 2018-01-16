<%-- 
    Document   : risManageOrderListDiagnosisTable
    Created on : Mar 28, 2017, 5:59:03 PM
    Author     : Shammugam
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    Conn conn = new Conn();
    String pmino = request.getParameter("pmino");
//                                               0                   1                   2                          3                               4                        5                   6
    String diagnosisList = "select lhr_diagnosis.PMI_no,AHF.hfc_name,lhr_diagnosis.Episode_Date,lhr_diagnosis.Encounter_Date,lhr_diagnosis.Diagnosis_Cd,icd10_codes.icd10_desc,lhr_diagnosis.Comment"
            + " FROM lhr_diagnosis JOIN icd10_codes ON (lhr_diagnosis.Diagnosis_Cd = icd10_codes.icd10_code ) JOIN adm_health_facility AHF ON AHF.hfc_cd = lhr_diagnosis.HFC_Cd"
            + " where lhr_diagnosis.PMI_no = '" + pmino + "' ";

    ArrayList<ArrayList<String>> dataDiagnosisList;
    dataDiagnosisList = conn.getData(diagnosisList);


%>

<table class="table table-filter table-striped table-bordered dt-head-right" style="background: #fff; border: 1px solid #ccc; width: 100%; text-align: center" id="ManageOrderListDetailTable">
    <thead>
    <th style="display: none;">PMI NO</th>
    <th >HFC</th>
    <th >EPISODE DATE</th>
    <th >ENCOUNTER DATE</th>
    <th >DIAGNOSIS CODE</th>
    <th >DIAGNOSIS DESCRIPTION</th>
    <th >COMMENT</th>
</thead>
<tbody>
    <%        for (int i = 0; i < dataDiagnosisList.size(); i++) {

    %>
    <tr style="text-align: left;">
<input id="dataRISManageDiagnosisListhidden" type="hidden" value="<%=String.join("|", dataDiagnosisList.get(i))%>">
<td style="display: none"><%= dataDiagnosisList.get(i).get(0)%></td> <!-- Order No -->
<td  ><%= dataDiagnosisList.get(i).get(1)%></td> <!-- Code -->
<td ><%= dataDiagnosisList.get(i).get(2)%></td> <!-- Episode Date -->
<td ><%= dataDiagnosisList.get(i).get(3)%></td> <!-- Encounter Date -->
<td ><%= dataDiagnosisList.get(i).get(4)%></td> <!-- Diagnosis Code -->
<td style="font-weight: 500;" ><%= dataDiagnosisList.get(i).get(5)%> </td> <!-- Diagnosis Description -->
<td ><%= dataDiagnosisList.get(i).get(6)%></td> <!-- Comment -->
</tr>

<%  }
%>

</tbody>
</table>

<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {
        $('#ManageOrderListDetailTable').DataTable({
            language: {
                emptyTable: "No Order Available To Display"
            }, initComplete: function (settings, json) {
                $('.loading').hide();
            },
            "iDisplayLength": 3,
        });
        
    });

</script>


