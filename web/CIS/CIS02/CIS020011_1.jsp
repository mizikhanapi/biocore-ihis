<%-- 
    Document   : CIS020011_1
    Created on : Feb 15, 2017, 10:00:30 AM
    Author     : -D-
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>

<%
    String pmiNo = session.getAttribute("patientPMINo").toString();
    String hfc_cd = session.getAttribute("HFC_NAME").toString();

    Conn conn = new Conn();

    String orderNo;
    String itemCd;
    String remarks;
    String procedureName;
    String modalityName;
    String bodySystemName;
    String diagnosis;

//String sqlRIS = "select result,remark,test_date,`testTime`,specimen_no,test_name,`performBy`,`Verification` from lis_assign_result where pmi_no = '"+pmiNo+"'" ;
//                                   0          1           2           3           4           5               6               7   
// String  resultProblem = "SELECT om.order_no, om.hfc_to ,hf.hfc_name, od.item_cd, id.item_name, r.`result`, om.episode_date, r.result_no, "
//         //        8            9               10      11          12          13              14              15              16
//         + "au.`USER_NAME`, od.spe_source, r.test_date,r.test_time, r.remark, r.`performBy`,r.`Verification`, r.`verify_by` , r.remark  "
//         + "FROM lis_order_master om  "
//         + "JOIN lis_order_detail od  "
//         + "JOIN lis_item_detail id  "
//         + "JOIN adm_health_facility hf  "
//         + "JOIN lis_result r  "
//         + "JOIN adm_users au  "
//         + "WHERE om.order_no = od.order_no  "
//         + "AND au.`USER_ID` = r.`performBy`  "
//         + "AND r.order_no = om.order_no  "
//         + "AND od.item_cd = id.item_cd  "
//         + "AND om.hfc_to = hf.hfc_cd  "
//         + "AND om.pmi_no = '"+pmiNo+"'" 
//         + " GROUP BY od.item_cd "
//         + "ORDER BY om.order_no ;";
    //                                  0           1           2               3           4           5           6           7
    String resultProblem = "SELECT r.result_no, r.test_name, r.test_date, r.test_time, r.`result`, r.remark, u.`USER_NAME`, r.verification, date(r.test_date) AS tarikh "
            + "FROM lis_result r "
            + "LEFT JOIN adm_users u ON u.`USER_ID`=r.`performBy` "
            + "WHERE r.pmi_no='" + pmiNo + "' "
            + "ORDER BY tarikh ;";
    ArrayList<ArrayList<String>> dataRIS = conn.getData(resultProblem);
   
%>
<table class="table table-striped table-filter table-bordered" id="lisTable" style="width: 100%">
    <%        if (dataRIS.size() > 0) {
    %>
    <thead>
        <tr>
            <th>Test Name</th>
            <th>Test Date</th>
            <th>Test Time</th>
            <th>Result</th>
            <th>Remarks</th>
            <th>Perform By</th>
            <th>Verification</th>
            <th hidden>Result ID</th>
        </tr>
    </thead>
    <tbody>
        <%
            for (int i = 0; i < dataRIS.size(); i++) {
        %>
        <tr>
            <td><%out.print(dataRIS.get(i).get(1));%></td>
            <td><%out.print(dataRIS.get(i).get(2));%></td>
            <td><%out.print(dataRIS.get(i).get(3));%></td>
            <td><%out.print(dataRIS.get(i).get(4));%><br><button id="btnCIS_O_LIO_VIEW_RESULT"><i class="fa fa-eye"></i> Result </button></td>
            <td><%out.print(dataRIS.get(i).get(5));%></td>
            <td><%out.print(dataRIS.get(i).get(6));%></td>
            <td><%out.print(dataRIS.get(i).get(7));%></td>
            <td hidden id="id_result"><%out.print(dataRIS.get(i).get(0));%></td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>
<script type="text/javascript">

    $('#lisTable').DataTable({
        language: {
            emptyTable: "No result",
            aaSorting: []
        }
    });


</script>

<%
    } else {
        out.print("No record for this moment. ");
    }
%>

