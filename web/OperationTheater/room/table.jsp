<%-- 
    Document   : table
    Created on : Jul 22, 2017, 6:41:20 AM
    Author     : Ardhi Surya Ibrahim; rdsurya147@gmail.com; insta:@rdcfc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    //                          0      1         2
    String sqlBS = "SELECT room_no, room_name, status FROM opt_room WHERE hfc_cd='"+hfc_cd+"' order by room_no asc;";

    ArrayList<ArrayList<String>> dataROOM = conn.getData(sqlBS);

%>

<table id="THE_roomTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="display: none">Hidden</th>    
    <th>Room Number</th>
    <th>Room Name</th>
    <th style="width: 5%">Status</th>
    <th style="width: 5%">Update</th>
    <th style="width: 5%">Delete</th>
</thead>

<tbody>
    <%  
        String status ="";
        for (int i = 0; i < dataROOM.size(); i++) {
            if(dataROOM.get(i).get(2).equalsIgnoreCase("0")){
                status = "Active";
            }
            else{
                status = "Inactive";
            }
        
    %>
    <tr>
<td style="display:none" id="ROOM_hidden_column"><%= String.join("|", dataROOM.get(i))%></td>
<td><%= dataROOM.get(i).get(0)%></td>
<td><%= dataROOM.get(i).get(1)%></td>
<td><%= status%>
</td>
<td>
    <a id="ROOM_btnModalUpdate" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
</td>
<td>
    <a id="ROOM_btnDelete" class="testing" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
</td>
</tr>

<%
    }

%>
</tbody>

</table>


<script type="text/javascript" charset="utf-8">

    $(function () {
        $('#THE_roomTable').DataTable();
    });


    
</script>
