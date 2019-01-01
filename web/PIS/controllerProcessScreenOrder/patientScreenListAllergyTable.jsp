<%-- 
    Document   : patientScreenListAllergyTable
    Created on : Oct 29, 2018, 11:23:03 PM
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

    String allergyList = "SELECT alg.pmi_no, alg.hfc_cd, alg.episode_date, alg.encounter_cd, alg.allergy_cd, alg.icd10_description, alg.comment, adm_health_facility.hfc_name, DATE_FORMAT(alg.episode_date, '%d/%m/%Y %T'), DATE_FORMAT(alg.encounter_cd, '%d/%m/%Y %T') "
            + " FROM lhr_allergy alg"
            + " JOIN adm_health_facility ON (alg.hfc_cd = adm_health_facility.hfc_cd) "
            + " where alg.pmi_no = '" + pmino + "' ORDER BY alg.episode_date DESC ";

    ArrayList<ArrayList<String>> dataAllergyList;
    dataAllergyList = conn.getData(allergyList);


%>
<table class="table table-filter table-striped table-bordered dt-head-right" style="background: #fff; border: 1px solid #ccc; width: 100%; text-align: left" id="patientAllergyListTable">
    <thead>
    <th style="display: none;text-align: left;">PMI NO</th>
    <th style="display: none;text-align: left;">HFC CODE</th>
    <th style="text-align: left;">HFC NAME</th>
    <th style="text-align: left;">EPISODE DATE</th>
    <th style="text-align: left;">ENCOUNTER DATE</th>
    <th style="display: none;text-align: left;">ALLERGY CODE</th>
    <th style="text-align: left; width: 50%;">ALLERGY NAME</th>
    <th style="text-align: left; width: 20%;">COMMENT</th>
</thead>
<tbody>
    <%        for (int i = 0; i < dataAllergyList.size(); i++) {

    %>
    <tr style="text-align: left;">
        <td style="display: none"><%= dataAllergyList.get(i).get(0)%></td> <!-- PMI No -->
        <td style="display: none"><%= dataAllergyList.get(i).get(1)%></td> <!-- HFC Code -->
        <td  ><%= dataAllergyList.get(i).get(7)%></td> <!-- HFC Name -->
        <td ><%= dataAllergyList.get(i).get(8)%></td> <!-- EPISODE DATE -->
        <td ><%= dataAllergyList.get(i).get(9)%></td> <!-- ENCOUNTER DATE -->
        <td style="display: none"><%= dataAllergyList.get(i).get(4)%></td> <!-- DIAGNOSIS CODE -->
        <td style="font-weight: 500"><%= dataAllergyList.get(i).get(5)%> </td> <!-- DIAGNOSIS DESCRIPTION -->
        <td ><%= dataAllergyList.get(i).get(6)%></td> <!-- COMMENT -->
    </tr>
    <%  }
    %>

</tbody>
</table>


