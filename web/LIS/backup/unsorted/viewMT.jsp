<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Config.connect"%>
<%@page import="java.util.ArrayList"%>
<%
    Conn conn = new Conn();
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String result = request.getParameter("process");

    if ((result.equals("2"))) {
%>
<table id="MTC"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <%
        String sqlPatientApp = "SELECT DISTINCT ls.specimen_no,ls.pmi_no,pms.NEW_IC_NO,pms.PATIENT_NAME,lom.order_no,lom.order_status,lom.order_date,ls.item_cd FROM lis_specimen ls,lis_order_detail lod,lis_order_master lom,pms_patient_biodata pms WHERE ls.order_no=lod.order_no AND receive_specimen_status = 'Approve' AND lod.order_no= lom.order_no AND lom.pmi_no = pms.PMI_NO AND lom.order_status='2' AND lom.hfc_cd='" + hfc_cd + "' GROUP BY(ls.specimen_no)";
        ArrayList<ArrayList<String>> dataPatientApp = conn.getData(sqlPatientApp);

    %>
    <thead>
        <tr>
            <th class="col-sm-1">Specimen No</th>
            <th class="col-sm-1">Order No</th>
            <th class="col-sm-1">PMI No</th>
            <th class="col-sm-1">IC No</th>
            <th class="col-sm-1">Name</th>
            <th class="col-sm-1">Status</th>
            <th class="col-sm-1">Order Date Time</th>
            <th class="col-sm-1">Action</th>
        </tr>
    </thead>
    <tbody>

        <%if (dataPatientApp.size() > 0) {
                for (int i = 0; i < dataPatientApp.size(); i++) {%>
        <tr>
            <td><%=dataPatientApp.get(i).get(0)%><input type="text" id="specimen_no" value="<%=dataPatientApp.get(i).get(0)%>" style="display: none;"></td>
            <td><%=dataPatientApp.get(i).get(4)%></td>
            <td><%=dataPatientApp.get(i).get(1)%><input type="text" id="pmi" value="<%=dataPatientApp.get(i).get(1)%>" style="display: none;"></td>
            <td><%=dataPatientApp.get(i).get(2)%></td>
            <td><%=dataPatientApp.get(i).get(3)%></td>
            <td>
                <%
                    if (dataPatientApp.get(i).get(5).equals("2")) {
                %>
                Pending
                <%
                } else {
                %>
                Verified
                <%
                    }
                %>
            </td>
            <td><%=dataPatientApp.get(i).get(6)%></td>
            <td>
                <a href='VerifySpecimen.jsp?pmi=<%=dataPatientApp.get(i).get(1)%> &specimen_no=<%=dataPatientApp.get(i).get(0)%>'><button class='btn btn-primary btn-block'>Assign Result</button></a>
            </td>
        </tr>
        <%
                }
            }
        %>
    </tbody>
</table>
<%
} else if ((result.equals("3"))) {
%>
<table id="MTC"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <%
        String sqlPatientApp = "SELECT DISTINCT ls.specimen_no,ls.pmi_no,pms.NEW_IC_NO,pms.PATIENT_NAME,lom.order_no,lom.order_status,lom.order_date,ls.item_cd FROM lis_specimen ls,lis_order_detail lod,lis_order_master lom,pms_patient_biodata pms WHERE ls.order_no=lod.order_no AND receive_specimen_status = 'Approve' AND lod.order_no= lom.order_no AND lom.pmi_no = pms.PMI_NO AND lom.order_status='3' AND lom.hfc_cd='" + hfc_cd + "' GROUP BY(ls.specimen_no)";
        ArrayList<ArrayList<String>> dataPatientApp = conn.getData(sqlPatientApp);

    %>
    <thead>
        <tr>
            <th class="col-sm-1">Specimen No</th>
            <th class="col-sm-1">Order No</th>
            <th class="col-sm-1">PMI No</th>
            <th class="col-sm-1">IC No</th>
            <th class="col-sm-1">Name</th>
            <th class="col-sm-1">Status</th>
            <th class="col-sm-1">Order Date Time</th>
            <th class="col-sm-1">Action</th>
        </tr>
    </thead>
    <tbody>

        <%if (dataPatientApp.size() > 0) {
                for (int i = 0; i < dataPatientApp.size(); i++) {%>
        <tr>
            <td><%=dataPatientApp.get(i).get(0)%><input type="text" id="specimen_no" value="<%=dataPatientApp.get(i).get(0)%>" style="display: none;"></td>
            <td><%=dataPatientApp.get(i).get(4)%></td>
            <td><%=dataPatientApp.get(i).get(1)%><input type="text" id="pmi" value="<%=dataPatientApp.get(i).get(1)%>" style="display: none;"></td>
            <td><%=dataPatientApp.get(i).get(2)%></td>
            <td><%=dataPatientApp.get(i).get(3)%></td>
            <td>
                <%
                    if (dataPatientApp.get(i).get(5).equals("2")) {
                %>
                Pending
                <%
                } else {
                %>
                Verified
                <%
                    }
                %>
            </td>
            <td><%=dataPatientApp.get(i).get(6)%></td>
            <td>
                <a href='VerifySpecimen.jsp?pmi=<%=dataPatientApp.get(i).get(1)%> &specimen_no=<%=dataPatientApp.get(i).get(0)%>'><button class='btn btn-primary btn-block'>Assign Result</button></a>
            </td>
        </tr>
        <%
                }
            }
        %>
    </tbody>
</table>
<%
} else if ((result.equals("4"))) {
%>
<table id="MTC"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <%
        String sqlPatientApp = "SELECT DISTINCT ls.specimen_no,ls.pmi_no,pms.NEW_IC_NO,pms.PATIENT_NAME,lom.order_no,lom.order_status,lom.order_date,ls.item_cd,lom.billing_status FROM lis_specimen ls,lis_order_detail lod,lis_order_master lom,pms_patient_biodata pms WHERE ls.order_no=lod.order_no AND receive_specimen_status = 'Approve' AND lod.order_no= lom.order_no AND lom.pmi_no = pms.PMI_NO AND lom.order_status='3' AND lom.billing_status='2' AND lom.hfc_cd='" + hfc_cd + "' GROUP BY(ls.specimen_no)";
        ArrayList<ArrayList<String>> dataPatientApp = conn.getData(sqlPatientApp);

    %>
    <thead>
        <tr>
            <th class="col-sm-1">Specimen No</th>
            <th class="col-sm-1">Order No</th>
            <th class="col-sm-1">PMI No</th>
            <th class="col-sm-1">IC No</th>
            <th class="col-sm-1">Name</th>
            <th class="col-sm-1">Status</th>
            <th class="col-sm-1">Order Date Time</th>
            <th class="col-sm-1">Action</th>
        </tr>
    </thead>
    <tbody>

        <%if (dataPatientApp.size() > 0) {
                for (int i = 0; i < dataPatientApp.size(); i++) {%>
        <tr>
            <td><%=dataPatientApp.get(i).get(0)%><input type="text" id="specimen_no" value="<%=dataPatientApp.get(i).get(0)%>" style="display: none;"></td>
            <td><%=dataPatientApp.get(i).get(4)%></td>
            <td><%=dataPatientApp.get(i).get(1)%><input type="text" id="pmi" value="<%=dataPatientApp.get(i).get(1)%>" style="display: none;"></td>
            <td><%=dataPatientApp.get(i).get(2)%></td>
            <td><%=dataPatientApp.get(i).get(3)%></td>
            <td>
                <%
                    if (dataPatientApp.get(i).get(5).equals("2")) {
                %>
                Pending
                <%
                } else if (dataPatientApp.get(i).get(8).equals("2")) {
                %>
                Send
                <%
                } else {
                %>
                Verified
                <%
                    }
                %>
            </td>
            <td><%=dataPatientApp.get(i).get(6)%></td>
            <td>
                <a href='VerifySpecimen.jsp?pmi=<%=dataPatientApp.get(i).get(1)%> &specimen_no=<%=dataPatientApp.get(i).get(0)%>'><button class='btn btn-primary btn-block'>Assign Result</button></a>
            </td>
        </tr>
        <%
                }
            }
        %>
    </tbody>
</table>
<%
    }
%>

<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
        $('#MTC').DataTable();
    });
</script>
