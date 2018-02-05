<%-- 
    Document   : freqObservationChartController
    Created on : Sep 27, 2017, 9:51:03 AM
    Author     : Shammugam
--%>

<%@page import="OnG_helper.FrequentObservationChart"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>

<%
    FrequentObservationChart freqObser = new FrequentObservationChart();
    DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    LocalDateTime now = LocalDateTime.now();

    String data = request.getParameter("dataString");
    String methodName = request.getParameter("methodName");

    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String discipline = session.getAttribute("DISCIPLINE_CODE").toString();
    String subdiscipline = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
    String created_by = session.getAttribute("USER_ID").toString();
    String created_date = format.format(now);

    String longString = "|" + hfc + "|" + discipline + "|" + subdiscipline + "|" + created_by + "|" + created_date;

    Boolean result;

    if (methodName.equalsIgnoreCase("add")) {
        result = freqObser.addFrequentObservation(data + longString);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("update")) {
        result = freqObser.updateFrequentObservation(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("approve")) {
        result = freqObser.approveFrequentObservation(data + longString);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("delete")) {
        result = freqObser.delFrequentObservation(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("view") && data.equalsIgnoreCase("null")) {
        // Do Nothing
    } else if (methodName.equalsIgnoreCase("view") && !data.equalsIgnoreCase("null")) {
        ArrayList<ArrayList<String>> datas = freqObser.getFrequentObservation(data + longString);

%>
<div class="table-guling">
    <table class="table table-bordered" id="tableFreqObservationChartTable" style="width: 100%">
        <thead>
        <th>Date</th>
        <th>Time</th>
        <th>Temperature</th>
        <th>Pulse</th>
        <th>Respiration</th>
        <th>B. Pressure</th>
        <th>Pupil Details</th>
        <th>Conscious State &amp; Remarks</th>
        <th>Drugs Given</th>
        <th>Record Information</th>
        <th>Status</th>
        <th>Action</th>
        </thead>
        <tbody>
            <% for (int i = 0; i < datas.size(); i++) {%>
            <tr>
        <input id="dataFreqObservationCharthidden" type="hidden" value="<%=String.join("|", datas.get(i))%>">
        <td><%=datas.get(i).get(5)%></td>                   <!-- Date -->
        <td><%=datas.get(i).get(4)%></td>                   <!-- Time -->
        <td><%=datas.get(i).get(6)%></td>                   <!-- Temperature -->
        <td><%=datas.get(i).get(7)%></td>                   <!-- Pulse -->
        <td><%=datas.get(i).get(8)%></td>                   <!-- Respiration -->
        <td>            
            Systolic: <strong><%=datas.get(i).get(9)%></strong><br>
            Diastolic: <strong><strong><%=datas.get(i).get(10)%></strong>
        </td>                   <!-- BP -->
        <td>   
            <strong>Pulse Right</strong><br><!-- Pulse Right -->
            Size: <strong><%=datas.get(i).get(11)%></strong><br>
            React: <strong><%=datas.get(i).get(12)%></strong><br><br>
            <strong>Pulse Left</strong><br><!-- Pulse Left -->
            Size: <strong><%=datas.get(i).get(13)%></strong><br>
            React:<strong><%=datas.get(i).get(14)%></strong>
        </td>                                                               <!-- Pulse Right -->                
        <td><%=datas.get(i).get(15)%></td>                  <!-- Remark -->
        <td><%=datas.get(i).get(20)%></td>                  <!-- Drug -->
        <td>
            <strong>Created By</strong><br><!-- Created By -->
            <%=datas.get(i).get(22)%>
            <br><br>
            <strong>Approved By</strong><br><!-- Approved By -->
            <%=datas.get(i).get(21)%>
        </td>                  <!-- Approved By -->
        <td>
            <%
                if (datas.get(i).get(18).equalsIgnoreCase("pending")) { %>

            <button class="btn btn-warning btn-block" id="tableFreqObservationChartPendingBtn"><i class="fa fa-check-square-o"></i> Pending</button>

            <%          } else if (datas.get(i).get(18).equalsIgnoreCase("approved")) { %>

            <button class="btn btn-success btn-block disabled"><i class="fa fa-check-square-o"></i> Approved</button>
            <%    }
            %>
        </td>
        <td>
            <%
                if (datas.get(i).get(18).equalsIgnoreCase("pending")) { %>

            <a data-toggle="modal" data-target="#edit" id="tableFreqObservationChartUpdateBtn"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>

            <%  } %>
            &nbsp;
            <a id="tableFreqObservationChartDeleteBtn" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>

        </td>

        </tr> 
        <%    } %>
        </tbody>

    </table>

</div>
<script>

    $('#tableFreqObservationChartTable').DataTable({
        "paging": true,
        "lengthChange": false,
        "pageLength": 4,
        "language": {
            "emptyTable": "No Record Available To Display"
        }, initComplete: function (settings, json) {
            $('.loading').hide();
        }
    });

</script>

<% }%>