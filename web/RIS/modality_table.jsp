<%-- 
    Document   : modality_table
    Created on : Mar 30, 2017, 7:58:15 PM
    Author     : user
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    String MOD_hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    //                          0               1               2
    String sqlMOD = "Select modality_cd, modality_name, status from ris_modality where hfc_cd = '" + MOD_hfc + "'";

    ArrayList<ArrayList<String>> dataMOD = conn.getData(sqlMOD);

%>

<table id="THE_modalityTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th>Modality Code</th>
    <th>Modality Name</th>
    <th>Status</th>
    <th>Update</th>
    <th>Delete</th>
</thead>

<tbody>
    <%            for (int i = 0; i < dataMOD.size(); i++) {

    %>
    <tr>
<input id="MOD_hidden" type="hidden" value="<%= String.join("|", dataMOD.get(i))%>">
<td><%= dataMOD.get(i).get(0)%></td>
<td><%= dataMOD.get(i).get(1)%></td>
<td><% if (dataMOD.get(i).get(2).equalsIgnoreCase("0")) {
        out.print("Active");
    } else {
        out.print("Inactive");
    }
    %>
</td>
<td style="width: 5%">
    <a id="MOD_btnModalUpdate" data-toggle="modal" data-target="#MOD_detail" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
</td>
<td style="width: 5%">
    <a id="MOD_btnDelete" class="testing" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
</td>
</tr>

<%
    }

%>
</tbody>

</table>


<script type="text/javascript" charset="utf-8">

    $(function () {
        $('#THE_modalityTable').DataTable();
    });



</script>

