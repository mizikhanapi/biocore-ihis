<%-- 
    Document   : mcTable
    Created on : Apr 17, 2017, 3:25:01 PM
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
    String tsType = request.getParameter("tsType");
    String tsInput = request.getParameter("tsInput");
//    String episodeDate2 = request.getParameter("episodeDate2");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="thumbnail">
    <table id="tsTableDivision" class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; margin-top: 20px">

        <thead>

        <th> PMI No </th>
        <th> Episode date </th>
        <th> status</th>
        <th> Reprint </th>

        <%  String sql = "";
            if (tsType.equals("pmino")) {
                sql = "SELECT A.PATIENT_NAME, B.EPISODE_DATE, B.ELIGIBILITY_TYPE_CODE FROM PMS_PATIENT_BIODATA A JOIN PMS_EPISODE B ON A.`PMI_NO` = B.`PMI_NO` JOIN LHR_DIAGNOSIS C ON B.`PMI_NO` = C.`PMI_no` WHERE A.PMI_NO = '" + tsInput + "'";
            } else if (tsType.equals("icnew")) {
                sql = "SELECT A.PATIENT_NAME, B.EPISODE_DATE, B.ELIGIBILITY_TYPE_CODE FROM PMS_PATIENT_BIODATA A JOIN PMS_EPISODE B ON A.`PMI_NO` = B.`PMI_NO` JOIN LHR_DIAGNOSIS C ON B.`PMI_NO` = C.`PMI_no` WHERE A.NEW_IC_NO = '" + tsInput + "'";
            } else if (tsType.equals("icold")) {
                sql = "SELECT A.PATIENT_NAME, B.EPISODE_DATE, B.ELIGIBILITY_TYPE_CODE FROM PMS_PATIENT_BIODATA A JOIN PMS_EPISODE B ON A.`PMI_NO` = B.`PMI_NO` JOIN LHR_DIAGNOSIS C ON B.`PMI_NO` = C.`PMI_no` WHERE A.OLD_IC_NO = '" + tsInput + "'";
            } else {
                sql = "SELECT A.PATIENT_NAME, B.EPISODE_DATE, B.ELIGIBILITY_TYPE_CODE FROM PMS_PATIENT_BIODATA A JOIN PMS_EPISODE B ON A.`PMI_NO` = B.`PMI_NO` JOIN LHR_DIAGNOSIS C ON B.`PMI_NO` = C.`PMI_no` WHERE A.ID_NO = '" + tsInput + "' AND ID_NO = '" + tsInput + "'";
            }
            ArrayList<ArrayList<String>> ts = conn.getData(sql);

            int size = ts.size();
            for (int i = 0; i < size; i++) {
        %>

        <tr>
            <td id="PMI_NO"><%= ts.get(i).get(0)%></td>
            <td id="episodeDate2"><%= ts.get(i).get(1)%>
                <input type="hidden" id="episodeDate2_<%=i%>" value="<%= ts.get(i).get(1)%>">
            </td>
            <td id="status"><%= ts.get(i).get(2)%></td>

            <td><form><input type=submit value="reprint" id="printTC_<%=i%>"></form></td>
        <script type="text/javascript" charset="utf-8">

            $(document).ready(function () {
                $('#printTC_<%=i%>').on('click', function (e) {

                    e.preventDefault();
//                    var row = $(this).closest("tr");
                    var tsType = $("#tsType").val();
                    var tsInput = $("#tsInput").val();
                    var episodeDate2 = $("#episodeDate2_<%=i%>").val();


                    console.log(tsType);
                    console.log(tsInput);
                    console.log(episodeDate2);

                    window.open("timeSlipReport.jsp?tsType=" + tsType + "&tsInput=" + tsInput + "&episodeDate2=" + episodeDate2);

                });
            });


        </script>

        </tr>


        <%
            }
        %>

        </thead>


        <tbody>

        </tbody>
    </table>

</div>






