<%-- 
    Document   : lisManageOrderListAllergyTable
    Created on : Mar 28, 2017, 5:51:48 PM
    Author     : Raziff
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
    //String pmino = request.getParameter("pmino");
//                                      0                       1                   2                   3                          4                        5                   6
    String allergyList = "select lhr_allergy.pmi_no,lhr_allergy.hfc_cd,lhr_allergy.episode_date,lhr_allergy.encounter_cd,lhr_allergy.allergy_cd,icd10_codes.icd10_desc,lhr_allergy.comment"
            + " FROM lhr_allergy JOIN icd10_codes ON (lhr_allergy.allergy_cd = icd10_codes.icd10_code)"
            + " where lhr_allergy.pmi_no = '" + pmino + "' ";

    ArrayList<ArrayList<String>> dataAllergyList;
    dataAllergyList = conn.getData(allergyList);


%>

<table class="table table-filter table-striped table-bordered dt-head-right" style="background: #fff; border: 1px solid #ccc; width: 100%; text-align: center" id="risManageAllergyListTable">
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
    <%        for (int i = 0; i < dataAllergyList.size(); i++) {

    %>
    <tr style="text-align: left;">
<input id="dataRISManageAllergyListhidden" type="hidden" value="<%=String.join("|", dataAllergyList.get(i))%>">
<td style="display: none"><%= dataAllergyList.get(i).get(0)%></td> <!-- Order No -->
<td ><%= dataAllergyList.get(i).get(1)%></td> <!-- Code -->
<td ><%= dataAllergyList.get(i).get(2)%></td> <!-- Episode Date -->
<td ><%= dataAllergyList.get(i).get(3)%></td> <!-- Encounter Date -->
<td ><%= dataAllergyList.get(i).get(4)%></td> <!-- Diagnosis Code -->
<td style="font-weight: 500;" ><%= dataAllergyList.get(i).get(5)%> </td> <!-- Diagnosis Description -->
<td ><%= dataAllergyList.get(i).get(6)%></td> <!-- Comment -->
</tr>

<%  }
%>

</tbody>
</table>
<script>
    $(document).ready(function () {
        $('#risManageAllergyListTable').DataTable({
            language: {
                emptyTable: "No Allegy List Available To Display"
            }, initComplete: function (settings, json) {
                $('.loading').hide();
            }
        });
    });
</script>

