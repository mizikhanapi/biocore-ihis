<%-- 
    Document   : manageReportDailyTable
    Created on : Jan 24, 2017, 12:33:56 PM
    Author     : Shammugam
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
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
    DAILY LIST OF WARD OCCUPANCY
</h4>


<table  id="reportDailyTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">DATE</th>
    <th style="text-align: center;">WARD</th>
    <th style="text-align: center;">TOTAL BED</th>
    <th style="text-align: center;">OCCUPIED</th>
    <th style="text-align: center;">AVAILABLE</th>


</thead>
<tbody>

    <%
        NumberFormat formatterInt = new DecimalFormat("#0");
        NumberFormat formatter = new DecimalFormat("#0.00");

        double quantity = 0.00;
        double grandTotal = 0.00;
        String totalA = "";
        String totalP = "";
        String totalO = "";
        String totalS = "";
        String sqlbedRemarks = "SELECT  a.ward_class_name, b.ward_name, a.hfc_cd, a.ward_class_code,b.ward_class_code,  b.ward_id, DATE_FORMAT(c.created_date, '%d %M %Y') AS DATE  FROM wis_ward_class a LEFT JOIN wis_ward_name b ON (a.ward_class_code = b.ward_class_code) "
                + "left join wis_bed_id c on (c.ward_id = b.ward_id) where a.hfc_cd = '" + hfc + "' AND b.hfc_cd = '" + hfc + "' group by  c.ward_id ";

        ArrayList<ArrayList<String>> databedRemarks = conn.getData(sqlbedRemarks);

        int sizeR = databedRemarks.size();
        for (int i = 0; i < sizeR; i++) {

            String wardid = databedRemarks.get(i).get(5);
            String wardclass = databedRemarks.get(i).get(4);
              String date = databedRemarks.get(i).get(6);

            String a = "Available";

            String totalAV = "SELECT COUNT(bed_status), DATE_FORMAT(wis_bed_id.created_date, '%d %M %Y') AS DATE  FROM wis_bed_id where bed_status = '" + a + "' AND ward_id = '" + wardid + "' AND ward_class_code = '" + wardclass + "' AND hfc_cd = '" + hfc + "' group by '" + date + "' ";
            ArrayList<ArrayList<String>> dataTotalAV = conn.getData(totalAV);

            int sizetotalAV = dataTotalAV.size();
            for (int iTA = 0; iTA < sizetotalAV; iTA++) {
                String tA = dataTotalAV.get(iTA).get(0);
                totalA = tA;
            }

            String red = "Occupied";
            String totalOC = "SELECT COUNT(bed_status) , DATE_FORMAT(wis_bed_id.created_date, '%d %M %Y') AS DATE FROM wis_bed_id where bed_status = '" + red + "' AND ward_id = '" + wardid + "' AND ward_class_code = '" + wardclass + "' AND hfc_cd = '" + hfc + "' group by '" + date + "' ";
            ArrayList<ArrayList<String>> dataTotalOC = conn.getData(totalOC);

            int sizetotalOC = dataTotalOC.size();
            for (int iOC = 0; iOC < sizetotalOC; iOC++) {
                String tOC = dataTotalOC.get(iOC).get(0);
                totalO = tOC;
            }

            String totalSum = "SELECT COUNT(bed_status), DATE_FORMAT(wis_bed_id.created_date, '%d %M %Y') AS DATE FROM wis_bed_id where ward_id = '" + wardid + "' AND ward_class_code = '" + wardclass + "' AND hfc_cd = '" + hfc + "' group by '" + date + "'  ";
            ArrayList<ArrayList<String>> dataTotalSum = conn.getData(totalSum);
            // out.print(totalOC);
            int sizetotalSum = dataTotalSum.size();
            for (int sum1 = 0; sum1 < sizetotalSum; sum1++) {
                String sum = dataTotalSum.get(sum1).get(0);
                totalS = sum;
                quantity = quantity + Double.parseDouble(dataTotalSum.get(sum1).get(0));

                //grandTotal = grandTotal + Double.parseDouble(dataReportDaily.get(i).get(3));
            }
    %>

    <tr style="text-align: center;" id="moveToDailySalesDetailsTButton">
<input id="dataDailySalesListhidden" type="hidden" value="<%=String.join("|", databedRemarks.get(i))%>">

<td><%= databedRemarks.get(i).get(6)%></td>
<td><%= databedRemarks.get(i).get(1)%></td>
<td><%= totalS%></td>
<td><%= totalA%></td>
<td><%= totalO%></td>



</tr>
<%
    }


%>
</tbody>
</table>


<div class="row" id="data">
    <!-- content goes here -->
    <form class="form-horizontal" id="addForm">

        <div class="col-md-3">
        </div>
        <div class="col-md-3">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-5 control-label" for="textinput">Total Bed </label>
                <div class="col-md-4">
                    <input id="reportDailyTotalQuantity" name="reportDailyTotalQuantity" type="text" class="form-control input-md" maxlength="50" value="<%= formatterInt.format(quantity)%>" readonly>
                </div>
            </div>

        </div>


    </form>
</div>


<%
    String hfc_cd = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc + "'";
    ArrayList<ArrayList<String>> mysqlhfc_cd = conn.getData(hfc_cd);
    LocalDate localDate = LocalDate.now();
    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);
%>


<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {

        var reportQuantity = $("#reportDailyTotalQuantity").val();
        var reportGrandTotal = $("#reportDailyGrandTotal").val();

        $('#reportDailyTable').DataTable({
            pageLength: 15,
            initComplete: function (settings, json) {
                $('.loading').hide();
            },
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: ' Daily Ward Occupancy List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'Daily Ward Occupancy List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'print',
                    text: 'Print Daily Ward Occupancy List',
                    title: $('h1').text(),
                    message: '<br><br>',
                    className: 'btn btn-primary',
                    customize: function (win) {
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .prepend(
                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Daily Ward Occupancy List</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong>ADT-0001</strong></dd>\n\
                                        </div> '
                                        );
                        $(win.document.body).find('table')
                                .addClass('compact')
                                .css('font-size', 'inherit');
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .css('font-weight', 'bolder')
                                .append('<div style="text-align: right;padding-top:10px;"><br> Grand Total Bed = ' + reportQuantity + ' </div>')
                        // .append('<div style="text-align: right;"><br> Grand Total (RM) = ' + reportGrandTotal + ' </div>');
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .append('<div style="text-align: center;padding-top:30px;"><br> ***** &nbsp;&nbsp;  End Of Report  &nbsp;&nbsp;  ***** </div>');

                    },
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'colvis',
                    text: 'Filter Table Column',
                    className: 'btn btn-success'
                }
            ]
        });

    });
</script>
