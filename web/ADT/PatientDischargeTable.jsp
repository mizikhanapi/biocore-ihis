<%-- 
    Document   : manageReportDailyTable
    Created on : Jan 24, 2017, 12:33:56 PM
    Author     : Shammugam
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
%>


<h4>
    LIST OF PATIENT DISCHARGE                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 

</h4>
<table  id="reportDailyTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">DATE</th>
    <th style="text-align: center;">ID NUMBER</th>
    <th style="text-align: center;">PATIENT NAME </th>
    <th style="text-align: center;">REASON OF DISCHARGE</th>
    <th style="text-align: center;">ELIGIBILITY TYPE</th>
</thead>
<tbody>

    <%
        NumberFormat formatterInt = new DecimalFormat("#0");
        NumberFormat formatter = new DecimalFormat("#0.00");

        String sql = " SELECT DATE_FORMAT(wis_inpatient_episode.episode_date, '%d %M %Y') AS DATE, "
                + " wis_inpatient_episode.NEW_IC_NO, wis_inpatient_episode.PATIENT_NAME, wis_inpatient_episode_history.transfer_reason, adm_lookup_detail.Description "
                + " FROM wis_inpatient_episode JOIN wis_inpatient_episode_history ON (wis_inpatient_episode.pmi_no =  wis_inpatient_episode_history.pmi_no) "
              //  + " JOIN wis_order_detail ON (wis_order_master.order_no =  wis_order_detail.order_no) "
                + " JOIN adm_lookup_detail ON (adm_lookup_detail.Detail_Reference_Code =  wis_inpatient_episode.eligibility_category_cd) "
                + " WHERE wis_inpatient_episode.hfc_cd  = '" + hfc + "' AND wis_inpatient_episode_history.inpatient_status  = '2'  AND adm_lookup_detail.master_reference_code = '0063' group by  wis_inpatient_episode_history.pmi_no ";

        ArrayList<ArrayList<String>> dataReportDaily = conn.getData(sql);

        int size = dataReportDaily.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr style="text-align: center;">
        <td><%= dataReportDaily.get(i).get(0)%></td>
        <td><%= dataReportDaily.get(i).get(1)%></td>
        <td><%= dataReportDaily.get(i).get(2)%></td>
        <td><%= dataReportDaily.get(i).get(3)%></td>
        <td><%= dataReportDaily.get(i).get(4)%></td>

    </tr>
    <%
        }
    %>
</tbody>
</table>

<script type="text/javascript" charset="utf-8">
//    $(document).ready(function () {
//
//
//        $('#reportDailyTable').DataTable({
//            pageLength: 15,
//            initComplete: function (settings, json) {
//                $('.loading').hide();
//            },
//            dom: 'Bfrtip',
//            buttons: [
//                {
//                    extend: 'excelHtml5',
//                    text: 'Export To Excel',
//                    title: 'Pharmacy Daily Report'
//                }, {
//                    extend: 'csvHtml5',
//                    text: 'Export To Excel CSV',
//                    title: 'Pharmacy Daily Report'
//                }
//            ]
//        });
//
//    });
</script>
