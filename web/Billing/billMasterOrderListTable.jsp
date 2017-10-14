<%-- 
    Document   : billMasterOrderListTable
    Created on : Oct 11, 2017, 11:10:22 AM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
    String userID = session.getAttribute("USER_ID").toString();
%>

<table  id="billMasterOrderListTable"  class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%">
    <thead>
    <th style="text-align: left;">PMI No.</th>
    <th style="text-align: left;">Name</th>
    <th style="text-align: left;">IC No.</th>
    <th style="text-align: left;">Other ID</th>
    <th style="text-align: left;">Address</th>
    <th style="text-align: left;">Phone No.</th>
    <th style="text-align: left; display: none;">Episode Date</th>
    <th style="text-align: left; display: none;">Total Un-Generated Bill</th>
    <th style="text-align: left; display: none;">HFC</th>
</thead>
<tbody>

    <%
        String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
        String dis = (String) session.getAttribute("DISCIPLINE_CODE");
        String current_user = (String) session.getAttribute("USER_ID");
        String last_nine = current_user.substring(current_user.length() - 1);

        String whereClause = "";
        String orderWhereClause = " ";

        //-------------------------- to refresh order table based on request--------------------------------
        String longString, dateTime, filter, startDate, endDate;
        filter = "all";
        dateTime = "";
        startDate = "";
        endDate = "";

        if (request.getParameter("longString") != null) {

            longString = request.getParameter("longString");
            String splittedData[] = longString.split("\\|", -1);

            dateTime = splittedData[1];
            filter = splittedData[0];

        }

        if (filter.equalsIgnoreCase("today")) {

            whereClause = " WHERE fm.hfc_cd = '" + hfc + "' AND fm.status ='0' AND date(fm.txn_date) = date(now()) GROUP BY pb.pmi_no ORDER BY fm.txn_date DESC; ";

        } else if (filter.equalsIgnoreCase("yesterday")) {

            whereClause = " WHERE fm.hfc_cd = '" + hfc + "' AND fm.status ='0' AND DATE(fm.txn_date) = SUBDATE('" + dateTime + "',1) GROUP BY pb.pmi_no ORDER BY fm.txn_date DESC; ";

        } else if (filter.equalsIgnoreCase("7day")) {

            whereClause = " WHERE fm.hfc_cd = '" + hfc + "' AND fm.status ='0' AND DATE(fm.txn_date) BETWEEN SUBDATE('" + dateTime + "',7) AND '" + dateTime + "' GROUP BY pb.pmi_no ORDER BY fm.txn_date DESC; ";

        } else if (filter.equalsIgnoreCase("30day")) {

            whereClause = " WHERE fm.hfc_cd = '" + hfc + "' AND fm.status ='0' AND DATE(fm.txn_date) BETWEEN SUBDATE('" + dateTime + "',30) AND '" + dateTime + "' GROUP BY pb.pmi_no ORDER BY fm.txn_date DESC; ";

        } else if (filter.equalsIgnoreCase("60day")) {

            whereClause = " WHERE fm.hfc_cd = '" + hfc + "' AND fm.status ='0' AND DATE(fm.txn_date) BETWEEN SUBDATE('" + dateTime + "',60) AND '" + dateTime + "' GROUP BY pb.pmi_no ORDER BY fm.txn_date DESC; ";

        } else if (filter.equalsIgnoreCase("custom")) {

            String dateSplit[] = dateTime.split("\\^", -1);
            startDate = dateSplit[0];
            endDate = dateSplit[1];
            whereClause = " WHERE fm.hfc_cd = '" + hfc + "' AND fm.status ='0' AND DATE(fm.txn_date) between '" + startDate + "' and '" + endDate + "' GROUP BY pb.pmi_no ORDER BY fm.txn_date DESC; ";

        } else if (filter.equalsIgnoreCase("all")) {

            whereClause = " WHERE fm.hfc_cd = '" + hfc + "' AND fm.status ='0'  GROUP BY pb.pmi_no ORDER BY fm.txn_date DESC; ";

        }

        //=============================================================================================
        //                     0                 1               2            3            4            5               6           7               8
        String sql = "SELECT pb.pmi_no,UPPER(pb.patient_name),pb.new_ic_no,pb.id_no,pb.home_address,pb.mobile_phone,fm.txn_date,COUNT(fm.order_no),fm.hfc_cd "
                + " FROM far_order_master fm  "
                + " LEFT JOIN pms_patient_biodata pb ON (fm.customer_id = pb.PMI_NO)    "
                + whereClause + " ;";

        ArrayList<ArrayList<String>> dataBillMasterOrderList = conn.getData(sql);

        int size = dataBillMasterOrderList.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr id="moveToBillDetailsTButton" style="text-align: left;">
<input id="dataBillMasterOrderListhidden" type="hidden" value="<%=String.join("|", dataBillMasterOrderList.get(i))%>">
<td><%= dataBillMasterOrderList.get(i).get(0)%></td> <!-- PMI No. -->
<td><%= dataBillMasterOrderList.get(i).get(1)%></td> <!-- PMI No. -->
<td><%= dataBillMasterOrderList.get(i).get(2)%></td> <!-- IC No. -->
<td><%= dataBillMasterOrderList.get(i).get(3)%></td> <!-- Other ID. -->
<td><%= dataBillMasterOrderList.get(i).get(4)%></td> <!-- Address -->
<td ><%= dataBillMasterOrderList.get(i).get(5)%></td> <!-- Phone No -->
<td style="display: none"><%= dataBillMasterOrderList.get(i).get(6)%></td> <!-- Episode Date -->
<td style="display: none"><%= dataBillMasterOrderList.get(i).get(7)%></td> <!-- Total Bill -->
<td style="display: none"><%= dataBillMasterOrderList.get(i).get(8)%></td> <!-- Health Facility Code -->
</tr>
<%
    }
%>
</tbody>
</table>


<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {

        $('#billMasterOrderListTable').DataTable({
            "language": {
                "emptyTable": "No Bill Record Available To Display"
            }, initComplete: function (settings, json) {
                $('.loading').hide();
            }
        });

    });
</script>

