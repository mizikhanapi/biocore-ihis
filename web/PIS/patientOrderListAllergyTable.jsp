<%-- 
    Document   : patientOrderListAllergyTable
    Created on : Mar 8, 2017, 6:15:29 PM
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

    String allergyList = "select lhr_allergy.pmi_no,lhr_allergy.hfc_cd,lhr_allergy.episode_date,lhr_allergy.encounter_cd,lhr_allergy.allergy_cd,icd10_codes.icd10_desc,lhr_allergy.comment"
            + " FROM lhr_allergy JOIN icd10_codes ON (lhr_allergy.allergy_cd = icd10_codes.icd10_code)"
            + " where lhr_allergy.pmi_no = '" + pmino + "' ";

    ArrayList<ArrayList<String>> dataAllergyList;
    dataAllergyList = conn.getData(allergyList);


%>

<table class="table table-filter table-striped table-bordered dt-head-right" style="background: #fff; border: 1px solid #ccc; width: 100%; text-align: left" id="patientAllergyListTable">
    <thead>
    <th style="display: none;text-align: center;">PMI NO</th>
    <th style="text-align: left;">HFC CODE</th>
    <th style="text-align: left;">EPISODE DATE</th>
    <th style="text-align: left;">ENCOUNTER DATE</th>
    <th style="text-align: left;">DIAGNOSIS CODE</th>
    <th style="text-align: left; width: 50%; font-weight: 500;">DIAGNOSIS DESCRIPTION</th>
    <th style="text-align: left; width: 20%;">COMMENT</th>
</thead>
<tbody>
    <%        for (int i = 0; i < dataAllergyList.size(); i++) {

    %>
    <tr style="text-align: left;">
<input id="dataPatientAllergyListhidden" type="hidden" value="<%=String.join("|", dataAllergyList.get(i))%>">
<td style="display: none"><%= dataAllergyList.get(i).get(0)%></td> <!-- Order No -->
<td ><%= dataAllergyList.get(i).get(1)%></td> <!-- Code -->
<td ><%= dataAllergyList.get(i).get(2)%></td> <!-- Description -->
<td ><%= dataAllergyList.get(i).get(3)%></td> <!-- Strength -->
<td ><%= dataAllergyList.get(i).get(4)%></td> <!-- Frequency -->
<td ><%= dataAllergyList.get(i).get(5)%> </td> <!-- Duration/Duration T -->
<td ><%= dataAllergyList.get(i).get(6)%></td> <!-- Dose -->
</tr>

<%  }
%>

</tbody>
</table>


