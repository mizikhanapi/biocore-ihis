<%-- 
    Document   : nurseryFeedingChartController
    Created on : Sep 27, 2017, 3:24:11 PM
    Author     : Shammugam
--%>

<%@page import="OnG_helper.NurseryFeedingChart"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>

<%
    NurseryFeedingChart feeding = new NurseryFeedingChart();
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
        result = feeding.addNurseryFeeding(data + longString);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("update")) {
        result = feeding.updateNurseryFeeding(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("approve")) {
        result = feeding.approveNurseryFeeding(data + longString);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("delete")) {
        result = feeding.delNurseryFeeding(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("view") && data.equalsIgnoreCase("null")) {
        // Do Nothing
    } else if (methodName.equalsIgnoreCase("view") && !data.equalsIgnoreCase("null")) {
        ArrayList<ArrayList<String>> datas = feeding.getNurseryFeeding(data + longString);

%>
<div class="table-guling">
    <table class="table table-bordered" id="tableNurseryFeedingChartTable" style="width: 100%">
        <thead>
        <th>Date</th>
        <th>Time</th>
        <th>Method of Feeding</th>
        <th>Strength of Milk (ML)</th>
        <th>Aspirate Vomit</th>
        <th>Temperature</th>
        <th>Respiration</th>
        <th>PU</th>
        <th>BO</th>
        <th>Remarks</th>
        <th>Record Information</th>
        <th>Status</th>
        <th>Action</th>
        </thead>
        <tbody>
            <% for (int i = 0; i < datas.size(); i++) {%>
            <tr>
        <input id="dataNurseryFeedingCharthidden" type="hidden" value="<%=String.join("|", datas.get(i))%>">
        <td><%=datas.get(i).get(5)%></td>                   <!-- Date -->
        <td><%=datas.get(i).get(4)%></td>                   <!-- Time -->
        <td><%=datas.get(i).get(7)%></td>                   <!-- Method -->
        <td><%=datas.get(i).get(6)%></td>                   <!-- Strength -->
        <td><%=datas.get(i).get(8)%></td>                   <!-- Aspirate -->
        <td><%=datas.get(i).get(9)%></td>                   <!-- Temperature -->                                                             <!-- Pulse Left -->  
        <td><%=datas.get(i).get(10)%></td>                   <!-- Respiration -->                                                             <!-- Pulse Left -->  
        <td><%=datas.get(i).get(11)%></td>                   <!-- PU -->                                                             <!-- Pulse Left -->  
        <td><%=datas.get(i).get(12)%></td>                  <!-- BO -->
        <td><%=datas.get(i).get(13)%></td>                  <!-- Remarks -->
        <td>
            <strong>Created By</strong><br><!-- Created By -->
            <%=datas.get(i).get(18)%>
            <br><br>
            <strong>Approved By</strong><br><!-- Approved By -->
            <%=datas.get(i).get(17)%>
        </td>   
        <td>
            <%
                if (datas.get(i).get(15).equalsIgnoreCase("pending")) { %>

            <button class="btn btn-warning btn-block" id="tableNurseryFeedingChartPendingBtn"><i class="fa fa-check-square-o"></i> Pending</button>

            <%          } else if (datas.get(i).get(15).equalsIgnoreCase("approved")) { %>

            <button class="btn btn-success btn-block disabled"><i class="fa fa-check-square-o"></i> Approved</button>
            <%    }
            %>
        </td>
        <td>
            <%
                if (datas.get(i).get(15).equalsIgnoreCase("pending")) { %>

            <a data-toggle="modal" data-target="#edit" id="tableNurseryFeedingChartUpdateBtn"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>

            <%  } %>
            &nbsp;
            <a id="tableNurseryFeedingChartDeleteBtn" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>

        </td>

        </tr> 
        <%    } %>
        </tbody>

    </table>

</div>
<script>
    
    $('#tableNurseryFeedingChartTable').DataTable({
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