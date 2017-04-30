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
    String mcType = request.getParameter("mcType");
    String mcInput = request.getParameter("mcInput");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="thumbnail">
    <table id="mcTableDivision" class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; margin-top: 20px">

        <thead>

        <th> Name </th>
        <th> Episode date </th>
        <th> PMI No </th>
        <th> Reprint </th>

        <%  String sql = "";
            if (mcType.equals("pmino")) {
                sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO` FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.PMI_NO = '" + mcInput + "'";
            } else if (mcType.equals("icnew")) {
                sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO` FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.NEW_IC_NO = '" + mcInput + "'";
            } else {
                sql = "SELECT A.PATIENT_NAME , B.EPISODE_DATE, A.`PMI_NO` FROM PMS_PATIENT_BIODATA A JOIN LHR_MED_LEAVE B ON A.`PMI_NO` = B.pmi_no WHERE A.ID_NO = '" + mcInput + "'";
            }
            ArrayList<ArrayList<String>> mc = conn.getData(sql);

            int size = mc.size();
            for (int i = 0; i < size; i++) {
        %>

        <tr>
            <td id="name"><%= mc.get(i).get(0)%></td>
            <td id="episodeDate2"><%= mc.get(i).get(1)%>
            <input type="hidden" id="episodeDate2_<%=i%>" value="<%= mc.get(i).get(1)%>">
            </td>
            <td id="pmino"><%= mc.get(i).get(2)%></td>
            <td><form><input type=submit value="reprint" id="printMC3<%=i%>" role="button"></form></td>

        </tr>

        <script type="text/javascript" charset="utf-8">

            $(document).ready(function () {
                $('#printMC3<%=i%>').on('click', function (e) {

                    e.preventDefault();

                    var mcType = $("#mcType").val();
                    var mcInput = $("#mcInput").val();
                    var episodeDate2 = $("#episodeDate2_<%=i%>").val();
                    console.log(mcType);
                    console.log(mcInput);
                    console.log(episodeDate2);

                    window.open("mcReport2.jsp?mcType=" + mcType + "&mcInput=" + mcInput+ "&episodeDate2=" + episodeDate2);

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


<!--        "&episodeDate=" + episodeDate-->
