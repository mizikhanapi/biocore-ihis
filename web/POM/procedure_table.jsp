<%-- 
    Document   : procedure_table
    Created on : May 10, 2017, 6:41:43 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    //                          0               1           2           3               4
    String sqlBS = "Select procedure_cd, procedure_name, status, buying_price, selling_price from cis_procedure where hfc_cd = '"+hfc_cd+"' order by procedure_cd asc";

    ArrayList<ArrayList<String>> dataBS = conn.getData(sqlBS);

%>

<table id="THE_procedureTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th>Procedure Code</th>
    <th>Procedure Name</th>
    <th>Buying Price(RM)</th>
    <th>Selling Price(RM)</th>
    <th style="width: 5%">Status</th>
    <th style="width: 5%">Update</th>
    <th style="width: 5%">Delete</th>
</thead>

<tbody>
    <%            for (int i = 0; i < dataBS.size(); i++) {

    %>
    <tr>
<input id="PRO_hidden" type="hidden" value="<%= String.join("|", dataBS.get(i))%>">
<td><%= dataBS.get(i).get(0)%></td>
<td><%= dataBS.get(i).get(1)%></td>
<td><%= dataBS.get(i).get(3)%></td>
<td><%= dataBS.get(i).get(4)%></td>
<td><%= dataBS.get(i).get(2)%>
</td>
<td>
    <a id="PRO_btnModalUpdate" data-toggle="modal" data-target="#PRO_detail" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
</td>
<td>
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

