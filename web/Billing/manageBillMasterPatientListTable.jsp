<%-- 
    Document   : manageBillMasterPatientListTable
    Created on : Nov 5, 2017, 12:28:19 PM
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
<div style="width:50%;margin: auto;">
    <form class="form-horizontal" name="manageBillMasterListMainFilterForm" id="manageBillMasterListMainFilterForm" autocomplete="off">
        <div class="form-group">
            <label class="col-md-4 control-label" for="textinput">Bill Status</label>
            <div class="col-sm-7 col-md-7" style="margin-bottom: 10px">
                <div class="input-group">
                    <div id="manageBillMasterListMainFilterStatus" class="btn-group">
                        <a class="btn btn-primary btn-sm active" data-toggle="status" data-title="U">UNPAID</a>
                        <a class="btn btn-primary btn-sm" data-toggle="status" data-title="P">PAID</a>
                    </div>
                </div>
            </div>
        </div>
        <!--        <div id="custom-search-input">
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="textinput">IC No.</label>
                        <div class="col-md-4">
                            <input type="text" class="form-control input-md singleNumbersOnly" id="manageBillMasterListMainFilterIC" placeholder="IC No." maxlength="12">
                        </div>
                        <button class="btn btn-primary" type="button" id="manageBillMasterListMainFilterSearchBillBtn" name="manageBillMasterListMainFilterSearchBillBtn"><i class="fa fa-search fa-lg"></i>&nbsp; Search</button>
                    </div>
                </div>-->
    </form>
</div>


<table  id="manageBillMasterPatientListTable"  class="table table-filter table-striped table-bordered" style="background: #fff; border: 1px solid #ccc; width: 100%">
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

            whereClause = " WHERE fm.hfc_cd = '" + hfc + "' AND date(fm.txn_date) = date(now()) GROUP BY pb.pmi_no ORDER BY fm.txn_date DESC; ";

        } else if (filter.equalsIgnoreCase("yesterday")) {

            whereClause = " WHERE fm.hfc_cd = '" + hfc + "' AND DATE(fm.txn_date) = SUBDATE('" + dateTime + "',1) GROUP BY pb.pmi_no ORDER BY fm.txn_date DESC; ";

        } else if (filter.equalsIgnoreCase("7day")) {

            whereClause = " WHERE fm.hfc_cd = '" + hfc + "' AND DATE(fm.txn_date) BETWEEN SUBDATE('" + dateTime + "',7) AND '" + dateTime + "' GROUP BY pb.pmi_no ORDER BY fm.txn_date DESC; ";

        } else if (filter.equalsIgnoreCase("30day")) {

            whereClause = " WHERE fm.hfc_cd = '" + hfc + "' AND DATE(fm.txn_date) BETWEEN SUBDATE('" + dateTime + "',30) AND '" + dateTime + "' GROUP BY pb.pmi_no ORDER BY fm.txn_date DESC; ";

        } else if (filter.equalsIgnoreCase("60day")) {

            whereClause = " WHERE fm.hfc_cd = '" + hfc + "' AND DATE(fm.txn_date) BETWEEN SUBDATE('" + dateTime + "',60) AND '" + dateTime + "' GROUP BY pb.pmi_no ORDER BY fm.txn_date DESC; ";

        } else if (filter.equalsIgnoreCase("custom")) {

            String dateSplit[] = dateTime.split("\\^", -1);
            startDate = dateSplit[0];
            endDate = dateSplit[1];
            whereClause = " WHERE fm.hfc_cd = '" + hfc + "' AND DATE(fm.txn_date) between '" + startDate + "' and '" + endDate + "' GROUP BY pb.pmi_no ORDER BY fm.txn_date DESC; ";

        } else if (filter.equalsIgnoreCase("all")) {

            whereClause = " WHERE fm.hfc_cd = '" + hfc + "' GROUP BY pb.pmi_no ORDER BY fm.txn_date DESC; ";

        }

        //=============================================================================================
        //                     0                 1               2            3            4            5               6           7               8
        String sql = "SELECT pb.pmi_no,UPPER(pb.patient_name),pb.new_ic_no,pb.id_no,pb.home_address,pb.mobile_phone,fm.txn_date,COUNT(fm.order_no),fm.hfc_cd "
                + " FROM far_customer_hdr fm  "
                + " LEFT JOIN pms_patient_biodata pb ON (fm.customer_id = pb.PMI_NO)    "
                + whereClause + " ;";

        ArrayList<ArrayList<String>> dataManageBillMasterOrderList = conn.getData(sql);

        int size = dataManageBillMasterOrderList.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr id="manageBillMasterListMainFilterSearchBillBtn" style="text-align: left;">
<input id="dataManageBillMasterOrderListhidden" type="hidden" value="<%=String.join("|", dataManageBillMasterOrderList.get(i))%>">
<td><%= dataManageBillMasterOrderList.get(i).get(0)%></td> <!-- PMI No. -->
<td><%= dataManageBillMasterOrderList.get(i).get(1)%></td> <!-- PMI No. -->
<td><%= dataManageBillMasterOrderList.get(i).get(2)%></td> <!-- IC No. -->
<td><%= dataManageBillMasterOrderList.get(i).get(3)%></td> <!-- Other ID. -->
<td><%= dataManageBillMasterOrderList.get(i).get(4)%></td> <!-- Address -->
<td ><%= dataManageBillMasterOrderList.get(i).get(5)%></td> <!-- Phone No -->
<td style="display: none"><%= dataManageBillMasterOrderList.get(i).get(6)%></td> <!-- Episode Date -->
<td style="display: none"><%= dataManageBillMasterOrderList.get(i).get(7)%></td> <!-- Total Bill -->
<td style="display: none"><%= dataManageBillMasterOrderList.get(i).get(8)%></td> <!-- Health Facility Code -->
</tr>
<%
    }
%>
</tbody>
</table>


<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {

// --------------------------------------------------------------- Datatable --------------------------------------------------------------- //


        $('#manageBillMasterPatientListTable').DataTable({
            "language": {
                "emptyTable": "No Bill Record Available To Display"
            }, initComplete: function (settings, json) {
                $('.loading').hide();
            }
        });


// --------------------------------------------------------------- Datatable --------------------------------------------------------------- //





// --------------------------------------------------------------- Status Button On Off --------------------------------------------------------------- //




        $('#manageBillMasterListMainFilterStatus a').on('click', function () {

            var sel = $(this).data('title');
            var tog = $(this).data('toggle');

            $('#' + tog).prop('value', sel);

            $('a[data-toggle="' + tog + '"]').not('[data-title="' + sel + '"]').removeClass('active').addClass('notActive');
            $('a[data-toggle="' + tog + '"][data-title="' + sel + '"]').removeClass('notActive').addClass('active');

        });




// --------------------------------------------------------------- Status Button On Off --------------------------------------------------------------- //



    });
</script>

