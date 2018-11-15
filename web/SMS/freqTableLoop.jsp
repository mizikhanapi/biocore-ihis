<%-- 
    Document   : freqTableLoop
    Created on : Sep 6, 2017, 6:37:03 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>



<%
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
%>


<table  id="freqTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">Frequency Code</th>
    <th style="text-align: center;">Frequency Description</th>
    <th style="text-align: center;">Frequency Value</th>
    <th style="text-align: center;">STATUS</th>
    <th style="text-align: center;">Update</th>
    <th style="text-align: center;">Delete</th>
</thead>
<tbody>

    <%
        //                         0                1               2          3         4              5           6        
        String sql = " SELECT frequency_code,frequency_desc,frequency_value,hfc_cd,discipline_cd,subdiscipline_cd,status "
                + " FROM pis_drug_frequency WHERE hfc_cd  = '" + hfc + "' AND discipline_cd = '" + dis + "'";
        ArrayList<ArrayList<String>> dataFreq = conn.getData(sql);

        int size = dataFreq.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr style="text-align: center;">
<input id="dataFreqhidden" type="hidden" value="<%=String.join("|", dataFreq.get(i))%>">
<td><%= dataFreq.get(i).get(0)%></td> <!-- Code -->
<td><%= dataFreq.get(i).get(1)%></td> <!-- Desc -->
<td><%= dataFreq.get(i).get(2)%></td> <!-- Value -->
<td><% if (dataFreq.get(i).get(6).equals("1")) {
        out.print("Active");
    } else {
        out.print("Inactive");
    }%></td> <!-- Status -->
<td>
    <!-- Update Part Start -->
    <a id="freqUpdateTButton" data-toggle="modal" data-target="#freqModal"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
    <!-- Update Part End -->
</td>
<td>
    <!-- Delete Button Start -->
    <a id="freqDeleteTButton" ><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f; width: " ></i></a>
    <!-- Delete Button End -->
</td>
</tr>
<%
    }
%>
</tbody>
</table>




<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {

        // Supplier DataTables Start
        $('#freqTable').DataTable({
            pageLength: 15,
            lengthMenu: [[15, 25, 50, -1], [15, 25, 50, "All"]],
            "language": {
                "emptyTable": "No Order Available To Display"
            }
        });
        // Supplier DataTables End



    });

</script>
