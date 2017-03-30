<%-- 
    Document   : bodySystem_table
    Created on : Mar 29, 2017, 10:04:35 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    String BS_hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    //                          0               1               2
    String sqlBS = "Select body_system_cd, body_system_name, status from ris_body_system where hfc_cd = '" + BS_hfc + "'";

    ArrayList<ArrayList<String>> dataBS = conn.getData(sqlBS);

%>

<table id="THE_bodySystemTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th>Body System Code</th>
    <th>Body System Name</th>
    <th>Status</th>
    <th>Update</th>
    <th>Delete</th>
</thead>

<tbody>
    <%            for (int i = 0; i < dataBS.size(); i++) {

    %>
    <tr>
<input id="BS_hidden" type="hidden" value="<%= String.join("|", dataBS.get(i))%>">
<td><%= dataBS.get(i).get(0)%></td>
<td><%= dataBS.get(i).get(1)%></td>
<td><% if (dataBS.get(i).get(2).equalsIgnoreCase("0")) {
        out.print("Active");
    } else {
        out.print("Inactive");
    }
    %>
</td>
<td>
    <a id="BS_btnModalUpdate" data-toggle="modal" data-target="#BS_detail" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
</td>
<td>
    <a id="BS_btnDelete" class="testing" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
</td>
</tr>

<%
    }

%>
</tbody>

</table>


<script type="text/javascript" charset="utf-8">

    $(function () {
        $('#THE_bodySystemTable').DataTable();
    });


    
</script>
