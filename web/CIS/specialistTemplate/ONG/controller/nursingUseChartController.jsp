<%-- 
    Document   : nursingUseChartController
    Created on : Oct 2, 2017, 12:15:21 PM
    Author     : Shammugam
--%>

<%@page import="OnG_helper.NursingUseChart"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.ArrayList"%>

<%
    NursingUseChart nurUse = new NursingUseChart();
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

    if (methodName.equalsIgnoreCase("addMaster")) {
        result = nurUse.addNursingUseMaster(data + longString);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("addDetail")) {
        result = nurUse.addNursingUseDetail(data + longString);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("updateMaster")) {
        result = nurUse.updateNursingUseMaster(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("updateDetail")) {
        result = nurUse.updateNursingUseDetail(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("approveMasterDetail")) {
        result = nurUse.approveNursingUseMasterDetail(data + longString);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("deleteMaster")) {
        result = nurUse.delNursingUseMasterDetail(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("deleteDetail")) {
        result = nurUse.delNursingUseDetail(data);
        out.print(result);
    } else if (methodName.equalsIgnoreCase("view") && data.equalsIgnoreCase("null")) {
        // Do Nothing

    } else if (methodName.equalsIgnoreCase("viewMaster") && !data.equalsIgnoreCase("null")) {
        ArrayList<ArrayList<String>> datas = nurUse.getNursingUseMaster(data + longString);
%>
<h5>Nursing Use Master Chart</h5>
<div class="table-guling">
    <table class="table table-bordered" id="tableChartNursingUseMasterTable" style="width: 100%">
        <thead>
        <th>Master Date</th>     
        <th>Range</th>
        <th>Drug Details</th>
        <th>Supply</th>
        <th>Approval</th>
        <th>Status</th>
        <th>Action</th>
        </thead>
        <tbody>
            <% for (int i = 0; i < datas.size(); i++) {%>
            <tr>
        <input id="dataNursingUseMasterCharthidden" type="hidden" value="<%=String.join("|", datas.get(i))%>">
        <td>                                                                <!-- Master Date Time -->
            Date : <strong><%=datas.get(i).get(5)%></strong>
            <br>
            Time : <strong><%=datas.get(i).get(4)%></strong>
        </td> 
        <td>                                                                <!-- Range Date -->
            Start Date : <strong><%=datas.get(i).get(7)%></strong>
            <br>
            End Date : <strong><%=datas.get(i).get(9)%></strong>
        </td> 
        <td>                                                                <!-- Drug Details -->
            Name : <strong><%=datas.get(i).get(20)%></strong>
            <br>
            Strength : <strong><%=datas.get(i).get(23)%></strong>
            <br>
            Frequency : <strong><%=datas.get(i).get(26)%></strong>
            <br>
            Route : <strong><%=datas.get(i).get(24)%></strong>
            <br>
            Form : <strong><%=datas.get(i).get(25)%></strong>
        </td>
        <td>                                                                <!-- Supply One -->
            Supply One : <strong><%=datas.get(i).get(11)%></strong>
            <br>
            Dispensed By : <strong><%=datas.get(i).get(27)%></strong>
            <br><br>
            Supply Two : <strong><%=datas.get(i).get(13)%></strong>
            <br>
            Dispensed By : <strong><%=datas.get(i).get(28)%></strong>
        </td> 
        <td><%=datas.get(i).get(21)%></td>                  <!-- Approved By -->
        <td>
            <%
                if (datas.get(i).get(16).equalsIgnoreCase("pending")) { %>

            <button class="btn btn-warning btn-block" id="tableNursingUseMasterChartPendingBtn"><i class="fa fa-check-square-o"></i> Pending</button>

            <%          } else if (datas.get(i).get(16).equalsIgnoreCase("approved")) { %>

            <button class="btn btn-success btn-block disabled"><i class="fa fa-check-square-o"></i> Approved</button>
            <%    }
            %>
        </td>
        <td>
            <a id="tableNursingUseMasterChartShowDetailBtn" class="testing"><i class="fa fa-arrow-circle-o-down fa-lg" aria-hidden="true" style="display: inline-block;color: #0000A0;"></i></a>
            &nbsp;
            <%
                if (datas.get(i).get(16).equalsIgnoreCase("pending")) { %>

            <a data-toggle="modal" data-target="#edit" id="tableNursingUseMasterChartUpdateBtn"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>

            <%  } %>
            &nbsp;
            <a id="tableNursingUseMasterChartDeleteBtn" class="testing"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>

        </td>

        </tr> 
        <%    } %>
        </tbody>
    </table>
</div>

<script>
    $('#tableChartNursingUseMasterTable').DataTable({
        "paging": true,
        "lengthChange": false,
        "pageLength": 2,
        "language": {
            "emptyTable": "No Record Available To Display"
        }
    });
</script>


<%        } else if (methodName.equalsIgnoreCase("viewDetail") && !data.equalsIgnoreCase("null")) {
    ArrayList<ArrayList<String>> datass = nurUse.getNursingUseDetail(data + longString);
%>

<div class="col-md-12" >     
    <div class="pull-left" id="tableChartNursingUseDetailAddDiv">
        <button id="tableChartNursingUseDetailAddButton" class="btn btn-primary" data-toggle="modal" data-target="#ong-nurseryUseDetail"><i class="fa fa-plus fa-lg"></i>&nbsp; New Details</button>
    </div>
</div>

<br><br><br>

<div class="col-md-12" id="tableChartNursingUseDetailTableDiv">     
    <h5>Nursing Use Detail Chart</h5>
    <input id="tableChartNursingUseDetailTableMasterDateHidden" type="hidden" >
    <div class="table-guling">
        <table class="table table-bordered" id="tableChartNursingUseDetailTable" style="width: 100%">
            <thead>
            <th>Master Date</th>     
            <th>Detail Date</th>     
            <th>Description</th>
            <th>Action</th>
            </thead>
            <tbody>
                <% for (int i = 0; i < datass.size(); i++) {%>
                <tr>
            <input id="dataNursingUseDetailCharthidden" type="hidden" value="<%=String.join("|", datass.get(i))%>">
            <td>                                                                <!-- Master Date Time -->
                Date : <strong><%=datass.get(i).get(5)%></strong>
                <br>
                Time : <strong><%=datass.get(i).get(4)%></strong>
            </td> 
            <td>                                                                <!-- Detail Date Time -->
                Date : <strong><%=datass.get(i).get(7)%></strong>
                <br>
                Time : <strong><%=datass.get(i).get(6)%></strong>
            </td> 
            <td><%=datass.get(i).get(8)%></td>                   <!-- Description -->        
            <td>
                <%
                    if (datass.get(i).get(13).equalsIgnoreCase("pending")) { %>
                <a data-toggle="modal"  id="tableNursingUseDetailChartUpdateBtn" ><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>              
                &nbsp;
                <a id="tableNursingUseDetailChartDeleteBtn" class="testing" ><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block;color: #d9534f;"></i></a>
                    <%
                    } else {%>
                <button class="btn btn-danger btn-block disabled"><i class="fa fa-ban"></i> Non-Editable</button>              
                <%}%>
            </td>

            </tr> 
            <%    } %>
            </tbody>
        </table>
    </div>         
</div>


<script>
    $('#tableChartNursingUseDetailTable').DataTable({
        "paging": true,
        "lengthChange": false,
        "pageLength": 2,
        "language": {
            "emptyTable": "No Record Available To Display"
        }
    });
</script>


<% }%>




