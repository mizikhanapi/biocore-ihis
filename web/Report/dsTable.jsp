<%-- 
    Document   : dsTable
    Created on : Apr 25, 2017, 3:49:31 AM
    Author     : user
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
    String dsType = request.getParameter("dsType");
    String dsInput = request.getParameter("dsInput");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<hr class="pemisah" />
<table id="dsTableDivision" class="table table-filter table-striped table-bordered margin-top-50px" style="background: #fff; border: 1px solid #ccc; margin-top: 20px">

    <thead>

    <th> Name </th>
    <th> Date </th>
    <th> PMI NO </th>
    <th> Reprint </th>

    <%  String sql = "";
        if (dsType.equals("001")) {
            sql = "SELECT A.`PATIENT_NAME`, B.`ORDER_DATE`, A.`PMI_NO` FROM PMS_PATIENT_BIODATA A JOIN PIS_ORDER_MASTER B ON A.`PMI_NO` = B.`PMI_NO` WHERE A.PMI_NO = '" + dsInput + "'";
        } else if (dsType.equals("002")) {
            sql = "SELECT A.`PATIENT_NAME`, B.`ORDER_DATE`, A.`PMI_NO` FROM PMS_PATIENT_BIODATA A JOIN PIS_ORDER_MASTER B ON A.`PMI_NO` = B.`PMI_NO` WHERE A.NEW_IC_N0 = '" + dsInput + "'";
        } else if (dsType.equals("003")) {
            sql = "SELECT A.`PATIENT_NAME`, B.`ORDER_DATE`, A.`PMI_NO` FROM PMS_PATIENT_BIODATA A JOIN PIS_ORDER_MASTER B ON A.`PMI_NO` = B.`PMI_NO` WHERE A.OLD_IC_NO = '" + dsInput + "'";
        } else {
            sql = "SELECT A.`PATIENT_NAME`, B.`ORDER_DATE`, A.`PMI_NO` FROM PMS_PATIENT_BIODATA A JOIN PIS_ORDER_MASTER B ON A.`PMI_NO` = B.`PMI_NO` WHERE A.ID_NO = '" + dsInput + "'";
        }
        ArrayList<ArrayList<String>> ds = conn.getData(sql);

        int size = ds.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr>
        <td id="name"><%= ds.get(i).get(0)%></td>
        <td id="startDate"><%= ds.get(i).get(1)%>
            <input type="hidden" id="startDate_<%=i%>" value="<%= ds.get(i).get(1)%>">
        </td>
        <td id="pmino"><%= ds.get(i).get(2)%></td>
        <td><form><input type=submit value="reprint" id="printDS<%=i%>" role="button"></form></td>

    </tr>

    <script type="text/javascript" charset="utf-8">

        $(document).ready(function () {
            $('#printDS<%=i%>').on('click', function (e) {

                e.preventDefault();

                var dsType = $("#dsType").val();
                var dsInput = $("#dsInput").val();
                var startDate = $("#startDate_<%=i%>").val();
                console.log(dsType);
                console.log(dsInput);
                console.log(startDate);

                window.open("dispensingSheetReport.jsp?dsType=" + dsType + "&dsInput=" + dsInput + "&startDate=" + startDate);

            });
        });


    </script>


    <%
        }
    %>
</thead>


<tbody>

</tbody>
</table>