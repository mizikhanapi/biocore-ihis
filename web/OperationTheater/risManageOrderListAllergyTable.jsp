<%-- 
    Document   : risManageOrderListAllergyTable
    Created on : Mar 28, 2017, 5:51:48 PM
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
//                                      0                       1                   2                   3                          4                        5                   6               7
    String allergyList = "SELECT alg.pmi_no, alg.hfc_cd, alg.episode_date, alg.encounter_cd, alg.allergy_cd, alg.icd10_description, alg.comment, adm_health_facility.hfc_name "
            + " FROM lhr_allergy alg"
            + " JOIN adm_health_facility ON (alg.hfc_cd = adm_health_facility.hfc_cd) "
            + " where alg.pmi_no = '" + pmino + "' ORDER BY alg.episode_date DESC ";

    ArrayList<ArrayList<String>> dataAllergyList;
    dataAllergyList = conn.getData(allergyList);


%>

<table class="table table-filter table-striped table-bordered dt-head-right" style="background: #fff; border: 1px solid #ccc; width: 100%; text-align: left" id="risManageAllergyListTable">
    <thead>
    <th style="display: none;text-align: left;">PMI NO</th>
    <th style="text-align: left;">HFC </th>
    <th style="text-align: left;">EPISODE DATE</th>
    <th style="text-align: left;">ENCOUNTER DATE</th>
    <th style="text-align: left;">ALLERGY CODE</th>
    <th style="text-align: left;">ALLERGY DESCRIPTION</th>
    <th style="text-align: left;">COMMENT</th>
</thead>
<tbody>
    <%        for (int i = 0; i < dataAllergyList.size(); i++) {

    %>
    <tr style="text-align: left;">
<input id="dataRISManageAllergyListhidden" type="hidden" value="<%=String.join("|", dataAllergyList.get(i))%>">
<td style="display: none"><%= dataAllergyList.get(i).get(0)%></td> <!-- Order No -->
<td ><%= dataAllergyList.get(i).get(7)%></td> <!-- Code -->
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

