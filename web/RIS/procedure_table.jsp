<%-- 
    Document   : procedure_table
    Created on : Apr 4, 2017, 10:23:33 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    String PRO_hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    //                          0                            1               2              3           4               5               6                   7               8           9       10
    String sqlPRO = "Select clinical_discipline_cd, body_system_cd, body_system_name, modality_cd, modality_name, ris_procedure_cd, ris_procedure_name, buying_price, selling_price, quantity, status from ris_procedure_master"
            + " where hfc_cd = '" + PRO_hfc + "'";

    ArrayList<ArrayList<String>> dataPRO = conn.getData(sqlPRO);

%>

<table id="THE_procedureTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th>Body System</th>
    <th>Modality</th>
    <th>Procedure Code</th>   
    <th>Procedure Name</th>
    <th>Buying Price (RM)</th>   
    <th>Selling Price (RM)</th>
    <th>Quantity</th>
    <th>Status</th>
    <th>Update</th>
    <th>Delete</th>
</thead>

<tbody>
    <%            for (int i = 0; i < dataPRO.size(); i++) {

    %>
    <tr>
<input id="PRO_hidden" type="hidden" value="<%= String.join("|", dataPRO.get(i))%>">
<td><%= dataPRO.get(i).get(2)%></td>
<td><%= dataPRO.get(i).get(4)%></td>
<td><%= dataPRO.get(i).get(5)%></td>
<td><%= dataPRO.get(i).get(6)%></td>
<td><%= dataPRO.get(i).get(7)%></td>
<td><%= dataPRO.get(i).get(8)%></td>
<td><%= dataPRO.get(i).get(9)%></td>
<td><% if (dataPRO.get(i).get(10).equalsIgnoreCase("0")) {
        out.print("Active");
    } else {
        out.print("Inactive");
    }
    %>
</td>
<td style="width: 5%">
    <a id="PRO_btnModalUpdate" data-toggle="modal" data-target="#PRO_detail" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
</td>
<td style="width: 5%">
    <a id="PRO_btnDelete" class="testing" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
</td>
</tr>

<%
    }

%>
</tbody>

</table>


<script type="text/javascript" charset="utf-8">

    $(function () {
        $('#THE_procedureTable').DataTable();
    });



</script>


