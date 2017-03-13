<%-- 
    Document   : patientOrderListDiagnosisTable
    Created on : Mar 8, 2017, 5:14:48 PM
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

    String diagnosisList = "select lhr_diagnosis.PMI_no,lhr_diagnosis.HFC_Cd,lhr_diagnosis.Episode_Date,lhr_diagnosis.Encounter_Date,lhr_diagnosis.Diagnosis_Cd,icd10_codes.icd10_desc,lhr_diagnosis.Comment"
            + " FROM lhr_diagnosis JOIN icd10_codes ON (lhr_diagnosis.Diagnosis_Cd = icd10_codes.icd10_code ) "
            + " where lhr_diagnosis.PMI_no = '" + pmino + "' ";

    ArrayList<ArrayList<String>> dataDiagnosisList;
    dataDiagnosisList = conn.getData(diagnosisList);


%>

<table class="table table-filter table-striped table-bordered dt-head-right" style="background: #fff; border: 1px solid #ccc; width: 100%; text-align: center" id="patientDiagnosisListTable">
    <thead>
    <th style="display: none">PMI NO</th>
    <th >HFC CODE</th>
    <th>EPISODE DATE</th>
    <th>ENCOUNTER DATE</th>
    <th>DIAGNOSIS CODE</th>
    <th>DIAGNOSIS DESCRIPTION</th>
    <th>COMMENT</th>
</thead>
<tbody>
    <%        for (int i = 0; i < dataDiagnosisList.size(); i++) {

    %>
    <tr >
<input id="dataPatientDiagnosisListhidden" type="hidden" value="<%=String.join("|", dataDiagnosisList.get(i))%>">
<td style="display: none"><%= dataDiagnosisList.get(i).get(0)%></td> <!-- Order No -->
<td  ><%= dataDiagnosisList.get(i).get(1)%></td> <!-- Code -->
<td ><%= dataDiagnosisList.get(i).get(2)%></td> <!-- Description -->
<td ><%= dataDiagnosisList.get(i).get(3)%></td> <!-- Strength -->
<td ><%= dataDiagnosisList.get(i).get(4)%></td> <!-- Frequency -->
<td ><%= dataDiagnosisList.get(i).get(5)%> </td> <!-- Duration/Duration T -->
<td ><%= dataDiagnosisList.get(i).get(6)%></td> <!-- Dose -->
</tr>

<%  }
%>

</tbody>
</table>


