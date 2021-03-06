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
    //                          0               1                       2         3                     4
    String sqlBS = "Select c1.procedure_cd, c1.procedure_1_name, c1.status, c1.procedure_1_cd, c.procedure_name "
            + "from cis_procedure_1 c1 "
            + "join cis_procedure c on c.procedure_cd=c1.procedure_cd and c.hfc_cd=c1.hfc_cd "
            + "where c1.hfc_cd = '"+hfc_cd+"' "
            + "order by c1.procedure_1_cd asc";

    ArrayList<ArrayList<String>> dataBS = conn.getData(sqlBS);

%>

<table id="THE_procedure1Table"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th>Level 1 Code</th>
    <th>Level 1 Name</th>
    <th>Level 2 Code</th>
    <th>Level 2 Name</th>
    <th style="width: 5%">Status</th>
    <th style="width: 5%">Action</th>
</thead>

<tbody>
    <%            for (int i = 0; i < dataBS.size(); i++) {

    %>
    <tr style="text-align: left;">
<input id="PRO1_hidden" type="hidden" value="<%= String.join("|", dataBS.get(i))%>">
<td><%= dataBS.get(i).get(0)%></td>
<td><%= dataBS.get(i).get(4)%></td>
<td><%= dataBS.get(i).get(3)%></td>
<td><%= dataBS.get(i).get(1)%></td>
<td  style="width: 5%"><%= dataBS.get(i).get(2)%>
</td>
<td  style="width: 5%">
    <a id="PRO1_btnModalUpdate" data-toggle="modal" data-target="#PRO1_detail" style="cursor: pointer"><i data-toggle="tooltip" data-placement="left" title="Update code" class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
    &nbsp;&nbsp;&nbsp;
    <a id="PRO1_btnDelete" class="testing" style="cursor: pointer"><i data-toggle="tooltip" data-placement="right" title="Delete code" class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
</td>
</tr>

<%
    }

%>
</tbody>

</table>


<script type="text/javascript" charset="utf-8">

    $(function () {
        $('#THE_procedure1Table').DataTable();
    });


    
</script>

<script>
    $(function () {
        $('[data-toggle="tooltip"]').tooltip();
      }); 
</script>