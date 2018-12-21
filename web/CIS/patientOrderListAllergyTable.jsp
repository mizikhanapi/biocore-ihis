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

    //                              0           1               2               3               4                   5                6   
    String allergyList = "SELECT alg.pmi_no, alg.hfc_cd, alg.episode_date, alg.allergy_cd, alg.icd10_description, alg.comment, adm.hfc_name "
            + " FROM lhr_allergy alg"
            + " JOIN adm_health_facility adm ON (alg.hfc_cd = adm.hfc_cd) "
            + " where alg.pmi_no = '6602060152612' ORDER BY alg.episode_date DESC ";

    ArrayList<ArrayList<String>> dataAllergyList;
    dataAllergyList = conn.getData(allergyList);
   

%>

<table class="table table-filter table-striped table-bordered dt-head-right" style="background: #fff; border: 1px solid #ccc; width: 100%; text-align: left" id="patientAllergyListTable">
    <thead>
    <th style="display: none;text-align: left;">PMI NO</th>
    <th style="display: none;text-align: left;">HFC CODE</th>
    <th style="text-align: left;">HFC NAME</th>
    <th style="text-align: left;">EPISODE DATE</th>
    <th style="text-align: left;">ALLERGY CODE</th>
    <th style="text-align: left;">ALLERGY DESCRIPTION</th>
    <th style="text-align: left;">COMMENT</th>
</thead>
<tbody>
    <%        for (int i = 0; i < dataAllergyList.size(); i++) {

    %>
    <tr style="text-align: left;">
        <td style="display: none"><%= dataAllergyList.get(i).get(0)%></td> <!-- PMI No -->
        <td style="display: none"><%= dataAllergyList.get(i).get(1)%></td> <!-- HFC Code -->
        <td  ><%= dataAllergyList.get(i).get(6)%></td> <!-- HFC Name -->
        <td ><%= dataAllergyList.get(i).get(2)%></td> <!-- EPISODE DATE -->
        <td ><%= dataAllergyList.get(i).get(3)%></td> <!-- ALERYGY CODE -->
        <td ><%= dataAllergyList.get(i).get(4)%> </td> <!-- DIAGNOSIS DESCRIPTION -->
        <td ><%= dataAllergyList.get(i).get(5)%></td> <!-- COMMENT -->
    </tr>

    <%  }
    %>

</tbody>
</table>


