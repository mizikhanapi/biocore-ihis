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
%>
<table id="ICD10Table" class="table table-filter table-striped margin-top-50px" style="background: #fff; border: 1px solid #ccc; margin-top: 20px">

    <thead>

    <th> ICD10 Code </th>
    <th> Chapter </th>
    <th> Block </th>
    <th> Description </th>
    <th> PMI No. </th>
    <th> HFC Code </th>
    <th> Center Code </th>
    <th> Reprint </th>

    <%  
         String sql = "SELECT blocks.`Id`,blocks.`name`, codes.`icd10_code`, codes.`icd10_chapter`,codes.`icd10_block`, codes.`icd10_desc`, codes.`icd10_digit`,diagnosis.`PMI_no`,diagnosis.`Episode_Date`,diagnosis.`Diagnosis_Cd`,diagnosis.`HFC_Cd`,diagnosis.`Centre_Code`,chapters.`Id`, chapters.`name` FROM `icd10_codes` codes INNER JOIN `lhr_diagnosis` diagnosis ON codes.`icd10_code` = diagnosis.`diagnosis_cd` INNER JOIN `icd10_chapters` chapters ON codes.`icd10_chapter` = chapters.`id` INNER JOIN `icd10_blocks` blocks ON codes.`icd10_block` = blocks.`id` WHERE diagnosis.`Episode_Date` BETWEEN '"+startDate+"' AND '"+endDate+"' ORDER BY chapters.`Id` ASC, blocks.`Id` ASC"; 
            
        ArrayList<ArrayList<String>> ICD10 = conn.getData(sql);

        int size = ICD10.size();
        for (int i = 0; i < size; i++) {
    %>
</thead>
<tr>
    <td id="ICD10Code"><%= ICD10.get(i).get(2)%></td>
    <td id="chapter"><%= ICD10.get(i).get(3)%></td>
    <td id="block"><%= ICD10.get(i).get(4)%></td>
    <td id="desc"><%= ICD10.get(i).get(5)%></td>
    <td id="pmino"><%= ICD10.get(i).get(8)%></td>
    <td id="hfc"><%= ICD10.get(i).get(10)%></td>
    <td id="center"><%= ICD10.get(i).get(11)%></td>
    <td>
        <input name="b_print" id="b_print<%=i%>" type="button" class="btn btn-success" value=" Print " data-toggle="modal" data-target="#basicModal">
        
        <script>
            $('#b_print<%=i%>').click(function () {

                $.ajax({
                    async: true,
                    type: "POST",
                    url: "ICD10Report.jsp",
                    data: {'name': "<%=ICD10.get(i).get(0)%>", 'episode': "<%=ICD10.get(i).get(1)%>", 'pmi': "<%=ICD10.get(i).get(2)%>"},
                    timeout: 10000,
                    success: function (list) {

                        $("#test").val(list.trim());
                        $('#test').html(list);
                        $('#test').trigger('contentchanged');
                        //printReport();
                    },
                    error: function (xhr, status, error) {
                        var err = eval("(" + xhr.responseText + ")");
                        bootbox.alert(err.Message);
                    }
                });

            });

        </script>

    </td>

</tr>



<%
    }
%>
</table>
        
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

