<%-- 
    Document   : ICD10Report
    Created on : Mar 12, 2017, 6:00:15 PM
    Author     : user
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.io.*"%> 
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<hr/>
<%
    Conn conn = new Conn();
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    String disp = request.getParameter("disp");
    String my_1_hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    //AND diagnosis.`HFC_Cd`='"+my_1_hfc_cd+"'

    if (disp.equals("All")) {
%>
<table id="ICD10Table" class="table table-filter table-striped margin-top-50px" style="background: #fff; border: 1px solid #ccc; margin-top: 20px">

    <thead>


    <th> Chapter Code </th>
    <th> Chapter Name </th>
    <th> Block Code</th>
    <th> Block Name </th>
    <th> ICD10 Code </th>
    <th> Description</th>
    <th> Discipline </th>
    <th> Total Patient </th>

    <%  String sql = "SELECT codes.`icd10_code`,diagnosis.`Diagnosis_Cd`, codes.`icd10_chapter`,blocks.`Id`, chapters.`name` ,blocks.`name`, count(diagnosis.`PMI_no`), codes.`icd10_desc`, codes.`icd10_digit`,diagnosis.`Centre_Code`FROM `icd10_codes` codes INNER JOIN `lhr_diagnosis` diagnosis ON codes.`icd10_code` = diagnosis.`diagnosis_cd` INNER JOIN `icd10_chapters` chapters ON codes.`icd10_chapter` = chapters.`id` INNER JOIN `icd10_blocks` blocks ON codes.`icd10_block` = blocks.`id` JOIN adm_health_facility ADF ON ADF.hfc_cd = diagnosis.`HFC_Cd` WHERE diagnosis.`Episode_Date` BETWEEN '" + startDate + "' AND '" + endDate + "' AND diagnosis.`HFC_Cd`='" + my_1_hfc_cd + "' GROUP BY diagnosis.`HFC_Cd`,codes.icd10_code ORDER BY chapters.`Id` ASC, blocks.`Id` ASC";
        //String sql = "SELECT blocks.`Id`,blocks.`name`, codes.`icd10_code`, codes.`icd10_chapter`,codes.`icd10_block`, codes.`icd10_desc`, codes.`icd10_digit`,diagnosis.`PMI_no`,diagnosis.`Episode_Date`,diagnosis.`Diagnosis_Cd`,diagnosis.`HFC_Cd`,diagnosis.`Centre_Code`,chapters.`Id`, chapters.`name` FROM `icd10_codes` codes INNER JOIN `lhr_diagnosis` diagnosis ON codes.`icd10_code` = diagnosis.`diagnosis_cd` INNER JOIN `icd10_chapters` chapters ON codes.`icd10_chapter` = chapters.`id` INNER JOIN `icd10_blocks` blocks ON codes.`icd10_block` = blocks.`id` WHERE diagnosis.`Episode_Date` BETWEEN '"+startDate+"' AND '"+endDate+"' ORDER BY chapters.`Id` ASC, blocks.`Id` ASC"; 

        ArrayList<ArrayList<String>> ICD10 = conn.getData(sql);

        int size = ICD10.size();
        for (int i = 0; i < size; i++) {
    %>
</thead>
<tr>

    <td id="chapter"><%= ICD10.get(i).get(2)%></td>
    <td id="desc"><%= ICD10.get(i).get(4)%></td>
    <td id="block"><%= ICD10.get(i).get(3)%></td>
    <td id="pmino"><%= ICD10.get(i).get(5)%></td>
    <td id="ICD10Code"><%= ICD10.get(i).get(0)%></td>
    <td id="center"><%= ICD10.get(i).get(7)%></td>
    <td id="center"><%= ICD10.get(i).get(9)%></td>
    <td id="hfc"><%= ICD10.get(i).get(6)%></td>


</tr>



<%
    }
%>
</table>
<%
} else {
%>
<table id="ICD10Table" class="table table-filter table-striped margin-top-50px" style="background: #fff; border: 1px solid #ccc; margin-top: 20px">

    <thead>


    <th> Chapter Code </th>
    <th> Chapter Name </th>
    <th> Block Code</th>
    <th> Block Name </th>
    <th> ICD10 Code </th>
    <th> Description</th>
    <th> Discipline </th>
    <th> Total Patient </th>

    <%  String 
        sql = "SELECT codes.`icd10_code`,diagnosis.`Diagnosis_Cd`, codes.`icd10_chapter`,blocks.`Id`, chapters.`name` ,blocks.`name`, count(diagnosis.`PMI_no`), codes.`icd10_desc`, codes.`icd10_digit`,diagnosis.`Centre_Code`FROM `icd10_codes` codes INNER JOIN `lhr_diagnosis` diagnosis ON codes.`icd10_code` = diagnosis.`diagnosis_cd` INNER JOIN `icd10_chapters` chapters ON codes.`icd10_chapter` = chapters.`id` INNER JOIN `icd10_blocks` blocks ON codes.`icd10_block` = blocks.`id` JOIN adm_health_facility ADF ON ADF.hfc_cd = diagnosis.`HFC_Cd` WHERE diagnosis.`Episode_Date` BETWEEN '"+startDate+"' AND '"+endDate+"' AND diagnosis.`HFC_Cd`='"+my_1_hfc_cd+"' AND diagnosis.Centre_Code = '"+disp+"' GROUP BY diagnosis.`HFC_Cd`,codes.icd10_code ORDER BY chapters.`Id` ASC, blocks.`Id` ASC";
         //String sql = "SELECT blocks.`Id`,blocks.`name`, codes.`icd10_code`, codes.`icd10_chapter`,codes.`icd10_block`, codes.`icd10_desc`, codes.`icd10_digit`,diagnosis.`PMI_no`,diagnosis.`Episode_Date`,diagnosis.`Diagnosis_Cd`,diagnosis.`HFC_Cd`,diagnosis.`Centre_Code`,chapters.`Id`, chapters.`name` FROM `icd10_codes` codes INNER JOIN `lhr_diagnosis` diagnosis ON codes.`icd10_code` = diagnosis.`diagnosis_cd` INNER JOIN `icd10_chapters` chapters ON codes.`icd10_chapter` = chapters.`id` INNER JOIN `icd10_blocks` blocks ON codes.`icd10_block` = blocks.`id` WHERE diagnosis.`Episode_Date` BETWEEN '"+startDate+"' AND '"+endDate+"' ORDER BY chapters.`Id` ASC, blocks.`Id` ASC"; 
            
        ArrayList<ArrayList<String>> ICD10 = conn.getData(sql);

        int size = ICD10.size();
        for (int i = 0; i < size; i++) {
    %>
</thead>
<tr>

    <td id="chapter"><%= ICD10.get(i).get(2)%></td>
    <td id="desc"><%= ICD10.get(i).get(4)%></td>
    <td id="block"><%= ICD10.get(i).get(3)%></td>
    <td id="pmino"><%= ICD10.get(i).get(5)%></td>
    <td id="ICD10Code"><%= ICD10.get(i).get(0)%></td>
    <td id="center"><%= ICD10.get(i).get(7)%></td>
    <td id="center"><%= ICD10.get(i).get(9)%></td>
    <td id="hfc"><%= ICD10.get(i).get(6)%></td>


</tr>



<%
    }
%>
</table>
<%
    }
%>


<script>

    $(document).ready(function () {
        $('#ICD10Table').DataTable({
            dom: 'Bfrtip',
            buttons: [
                'csv', 'excel', 'pdf', 'print'
            ]
        });

        $('#b_print').click(function () {
            printReport();
        });
    });
</script>

