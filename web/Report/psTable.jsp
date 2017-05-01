<%-- 
    Document   : psTable
    Created on : Apr 25, 2017, 3:07:58 AM
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
    String psType = request.getParameter("psType");
    String psInput = request.getParameter("psInput");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<hr class="pemisah" />
<table id="psTableDivision" class="table table-filter table-striped table-bordered margin-top-50px" style="background: #fff; border: 1px solid #ccc; margin-top: 20px">

    <thead>

    <th> Name </th>
    <th> Date </th>
    <th> PMI NO </th>
    <th> Reprint </th>

    <%  String sql = "";
        if (psType.equals("001")) {
            sql = "SELECT A.`PATIENT_NAME`, B.`ORDER_DATE`, A.`PMI_NO` FROM PMS_PATIENT_BIODATA A JOIN PIS_ORDER_MASTER B ON A.`PMI_NO` = B.`PMI_NO` WHERE A.PMI_NO = '" + psInput + "'";
        } else if (psType.equals("002")) {
            sql = "SELECT A.`PATIENT_NAME`, B.`ORDER_DATE`, A.`PMI_NO` FROM PMS_PATIENT_BIODATA A JOIN PIS_ORDER_MASTER B ON A.`PMI_NO` = B.`PMI_NO` WHERE A.NEW_IC_N0 = '" + psInput + "'";
        } else if (psType.equals("003")) {
            sql = "SELECT A.`PATIENT_NAME`, B.`ORDER_DATE`, A.`PMI_NO` FROM PMS_PATIENT_BIODATA A JOIN PIS_ORDER_MASTER B ON A.`PMI_NO` = B.`PMI_NO` WHERE A.OLD.IC_NO = '" + psInput + "'";
        } else {
            sql = "SELECT A.`PATIENT_NAME`, B.`ORDER_DATE`, A.`PMI_NO` FROM PMS_PATIENT_BIODATA A JOIN PIS_ORDER_MASTER B ON A.`PMI_NO` = B.`PMI_NO` WHERE A.ID_NO = '" + psInput + "'";
        }
        ArrayList<ArrayList<String>> ps = conn.getData(sql);

        int size = ps.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr>
        <td id="name"><%= ps.get(i).get(0)%></td>
        <td id="startDate"><%= ps.get(i).get(1)%>
            <input type="hidden" id="startDate_<%=i%>" value="<%= ps.get(i).get(1)%>">
        </td>
        <td id="pmino"><%= ps.get(i).get(2)%></td>
        <td><form><input type=submit value="reprint" id="printPS<%=i%>" role="button"></form></td>

    </tr>

    <script type="text/javascript" charset="utf-8">

        $(document).ready(function () {
            $('#printPS<%=i%>').on('click', function (e) {

                e.preventDefault();

                var psType = $("#psType").val();
                var psInput = $("#psInput").val();
                var startDate = $("#startDate_<%=i%>").val();
                console.log(psType);
                console.log(psInput);
                console.log(startDate);

                window.open("prescriptionSlipReport.jsp?psType=" + psType + "&psInput=" + psInput + "&startDate=" + startDate);

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
</div>