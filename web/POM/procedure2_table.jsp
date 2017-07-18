<%-- 
    Document   : procedure1_table
    Created on : May 10, 2017, 6:41:43 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    //                          0                   1                   2         3                     4                   5               6
    String sqlBS = "Select c2.procedure_1_cd, c2.procedure_2_name, c2.status, c2.procedure_2_cd, c1.procedure_1_name, c.procedure_cd, c.procedure_name "
            + "from cis_procedure_2 c2 "
            + "join cis_procedure_1 c1 on c1.procedure_1_cd=c2.procedure_1_cd and c1.hfc_cd=c2.hfc_cd "
            + "join cis_procedure c on c.procedure_cd=c1.procedure_cd and c.hfc_cd=c2.hfc_cd "
            + "where c2.hfc_cd = '"+hfc_cd+"' order by c2.procedure_2_cd asc";

    ArrayList<ArrayList<String>> dataBS = conn.getData(sqlBS);

%>

<table id="THE_procedure2Table"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th>Level 1 Code</th>
    <th>Level 1 Name</th>
    <th>Level 2 Code</th>
    <th>Level 2 Name</th>
    <th>Level 3 Code</th>
    <th>Level 3 Name</th>
    <th style="width: 5%">Status</th>
    <th style="width: 5%">Update</th>
    <th style="width: 5%">Delete</th>
</thead>

<tbody>
    <%            for (int i = 0; i < dataBS.size(); i++) {

    %>
    <tr>
<input id="PRO2_hidden" type="hidden" value="<%= String.join("|", dataBS.get(i))%>">
<td><%= dataBS.get(i).get(5)%></td>
<td><%= dataBS.get(i).get(6)%></td>
<td><%= dataBS.get(i).get(0)%></td>
<td><%= dataBS.get(i).get(4)%></td>
<td><%= dataBS.get(i).get(3)%></td>
<td><%= dataBS.get(i).get(1)%></td>
<td  style="width: 5%"><%= dataBS.get(i).get(2)%>
</td>
<td  style="width: 5%">
    <a id="PRO2_btnModalUpdate" data-toggle="modal" data-target="#PRO2_detail" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
</td>
<td  style="width: 5%">
    <a id="PRO2_btnDelete" class="testing" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
</td>
</tr>

<%
    }

%>
</tbody>

</table>


<script type="text/javascript" charset="utf-8">

    $(function () {
        $('#THE_procedure2Table').DataTable();
    });


    
</script>

