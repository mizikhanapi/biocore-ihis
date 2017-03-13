<%-- 
    Document   : master_lookup_table_loader
    Created on : Feb 24, 2017, 2:54:59 AM
    Author     : user
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();
%>

<thead>
    <th>Master Code</th>
    <th>Master Name</th>
    <th>Source</th>
    <th>Status</th>
    <th>Update</th>
    <th>Delete</th>
</thead>
<tbody>

    <%
        String sql = " SELECT Master_Reference_code, description, IFNULL(status, '0'), source_indicator FROM adm_lookup_master ";
        ArrayList<ArrayList<String>> dataMaster = conn.getData(sql);

        int size = dataMaster.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr>
        <input id="MLT_hidden" type="hidden" value="<%=String.join("|", dataMaster.get(i))%>">
        <td><%= dataMaster.get(i).get(0)%></td>
        <td><%= dataMaster.get(i).get(1)%></td>
        <td><%= dataMaster.get(i).get(3)%></td>
        <td><%if(dataMaster.get(i).get(2).equals("1"))
                out.print("Inactive"); 
              else
                out.print("Active"); %></td>


        <td style="width: 5% ">

            <!-- Update Part Start -->
            <a id="MLT_btnUpdate" data-toggle="modal" data-target="#detail2_" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>

            <!-- Modal Update -->

            <!-- Update Part End -->
        </td>
        <!-- Delete Part Start -->
        <td style="width: 5% ">
            <!-- Delete Button Start -->
            <a id="deleteButton_" class="testing" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
        </td>
        <!-- Delete Button End -->
    </tr>
    <%
        }
    %>
</tbody>
