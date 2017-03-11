<%-- 
    Document   : pmhTable
    Created on : Feb 15, 2017, 9:14:41 PM
    Author     : User
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>

<%
    Config.getBase_url(request);
    Config.getFile_url(session);
    Conn conn = new Conn();
    String idType = request.getParameter("idType");
    String idInput = request.getParameter("idInput");


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="thumbnail">
    <table id="pmhTablediv" class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; margin-top: 20px">

        <thead>

        <th> PMI No </th>
        <th> Episode date </th>
        <th> Name </th>
        <th> Health Facility Code </th>
        <th> View </th>

        <%  String sql = "";
            if (idType.equals("pmino")) {
                sql = "SELECT PMI_NO, EPISODE_DATE, NAME, HEALTH_FACILITY_CODE FROM pms_episode WHERE pmi_no = '" + idInput + "'";
            } else if (idType.equals("icnew")) {
                sql = "SELECT PMI_NO, EPISODE_DATE, NAME, HEALTH_FACILITY_CODE FROM pms_episode WHERE NEW_IC_NO = '" + idInput + "'";
            } else if (idType.equals("icold")) {
                sql = "SELECT PMI_NO, EPISODE_DATE, NAME, HEALTH_FACILITY_CODE FROM pms_episode WHERE OLD_IC_NO = '" + idInput + "'";
            } else {
                sql = "SELECT PMI_NO, EPISODE_DATE, NAME, HEALTH_FACILITY_CODE FROM pms_episode WHERE ID_TYPE = '" + idType + "' AND ID_NO = '" + idInput + "'";
            }
            ArrayList<ArrayList<String>> pmh = conn.getData(sql);

            int size = pmh.size();
            for (int i = 0; i < size; i++) {
        %>
        
        <tr>
            <td id="PMI_NO"><%= pmh.get(i).get(0)%></td>
            <td id="episode_date"><%= pmh.get(i).get(1)%></td>
            <td id="name"><%= pmh.get(i).get(2)%></td>
            <td id="hfc"><%= pmh.get(i).get(3)%></td>
            <td><form><input type=submit value="view" id="btn_view_<%=i%>"></form></td>

        </tr>
        

        <%
            }
        %>
        </thead>


        <tbody>

        </tbody>
    </table>
</div>

<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#pmhTablediv').DataTable();
    });
</script>


