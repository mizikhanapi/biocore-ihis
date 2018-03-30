<%-- 
    Document   : responsibility_table
    Created on : Mar 2, 2017, 4:29:36 AM
    Author     : user
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();
%>
<table  id="THE_responsibilityTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="width: 15% ">Role Name</th>
    <th>Page Code</th>
    <th>Page Name</th>
    <th>Status</th>
    <th>Update</th>
    <th>Delete</th>
</thead>
<tbody>

    <%
        String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();

        //                          0           1           2           3               4               5               6
        String sql = " select res.page_code, page_name, res.role_code, role_name, res.system_code, res.module_code, res.status "
                + "from adm_responsibility res join adm_role r using (role_code) "
                + "join adm_page p using (page_code) "
                + "WHERE res.health_facility_code = r.hfc_cd AND res.health_facility_code = '" + hfc_cd + "'";
        ArrayList<ArrayList<String>> dataRes = conn.getData(sql);

        int size = dataRes.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr>

        <td><a id="REST_btnRolePage" data-toggle="modal" data-target="#REST_detail2" style="cursor: pointer"><%= dataRes.get(i).get(3)%></a></td>
        <td><%= dataRes.get(i).get(0)%></td>
        <td><a id="MENU_btnMenuModal" style="cursor: pointer"><%= dataRes.get(i).get(1)%></a></td>
        <td style="width: 5% "><%if (dataRes.get(i).get(6).equals("1")) {
                out.print("Inactive");
            } else {
                out.print("Active");
            }%></td>


        <td style="width: 5% ">
            <input id="REST_hidden" type="hidden" value="<%=String.join("|", dataRes.get(i))%>">
            <!-- Update Part Start -->
            <a id="REST_btnUpdate" data-toggle="modal" data-target="#REST_detail" style="cursor: pointer"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>

            <!-- Modal Update -->

            <!-- Update Part End -->
        </td>
        <!-- Delete Part Start -->
        <td style="width: 5% ">
            <!-- Delete Button Start -->
            <a id="REST_btnDelete" class="testing" style="cursor: pointer"><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f;" ></i></a>
        </td>
        <!-- Delete Button End -->
    </tr>
    <%
        }
    %>
</tbody>
</table>    



<script type="text/javascript" >
    $(document).ready(function () {
        $('#THE_responsibilityTable').DataTable();
    });
</script>

