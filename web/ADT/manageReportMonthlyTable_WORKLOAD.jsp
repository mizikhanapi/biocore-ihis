<%-- 
    Document   : manageReportMonthlyTable
    Created on : Mar 9, 2017, 9:18:39 PM
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
   SUMMARY OF HEALTH WORKERS WORKLOAD BY MONTH
</h4>


<table  id="reportMonthlyTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">DATE</th>
    <th style="text-align: center;">DOCTOR</th>
    <th style="text-align: center;">TOTAL PATIENT</th>

</thead>
<tbody>

    <%
        NumberFormat formatterInt = new DecimalFormat("#0");
        NumberFormat formatter = new DecimalFormat("#0.00");

        double quantity = 0.00;
        double quantity2 = 0.00;
        // double quantity3 = 0.00;
        double grandTotal = 0.00;
        String status = "0";

        String sql = " SELECT COUNT(pms_patient_queue.pmi_no), "
                + " pms_patient_queue.user_id  "
                + " FROM pms_patient_queue "
                + " where hfc_cd  = '" + hfc + "' and patient_category = '003' GROUP BY  pms_patient_queue.user_id; ";
        ArrayList<ArrayList<String>> dataReportDaily = conn.getData(sql);

        int size = dataReportDaily.size();
        for (int i = 0; i < size; i++) {
            quantity2 = quantity2 + Double.parseDouble(dataReportDaily.get(i).get(0));
         //   quantity3 = quantity3 + Double.parseDouble(dataReportDaily.get(i).get(2));
            String USERID = dataReportDaily.get(i).get(1);
            String totalNew = "";

            String sql1 = " SELECT DATE_FORMAT(pms_patient_queue.episode_date, '%M %Y') AS DATE,"
                    + "COUNT(pms_patient_queue.pmi_no),"
                    + "COUNT(pms_patient_queue.pmi_no),"
                    + "EXTRACT(YEAR_MONTH FROM pms_patient_queue.created_date),  pms_patient_queue.user_id, adm_users.USER_NAME, pms_patient_queue.pmi_no "
                    + " FROM pms_patient_queue left join adm_users on (pms_patient_queue.user_id = adm_users.USER_ID) "
                    + " where pms_patient_queue.hfc_cd  = '" + hfc + "' AND pms_patient_queue.user_id  = '" + USERID + "'  GROUP BY DATE ; ";
            ArrayList<ArrayList<String>> dataTotal = conn.getData(sql1);

            int size29 = dataTotal.size();
            for (int i2 = 0; i2 < size29; i2++) {
                String t = dataTotal.get(i2).get(5);
                totalNew = t;

                quantity = quantity + Double.parseDouble(dataTotal.get(i2).get(1));
                //grandTotal = grandTotal + Double.parseDouble(dataReportDaily.get(i).get(3));


    %>

    <tr style="text-align: center;" id="moveToMonthlySalesDetailsTButton">
<input id="dataMonthlySalesListhidden" type="hidden" value="<%=String.join("|", dataReportDaily.get(i))%>">
<td><%= dataTotal.get(i2).get(0)%></td>
<td><%= totalNew%></td>
<td><%= formatterInt.format(Double.parseDouble(dataTotal.get(i2).get(1)))%></td>

</tr>
<%
        }
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
                <label class="col-md-5 control-label" for="textinput">Total Patient</label>
                <div class="col-md-4">
                    <input id="reportMonthlyTotalQuantity" name="reportMonthlyTotalQuantity" type="text" placeholder="Total Order" class="form-control input-md" maxlength="50" value="<%= formatterInt.format(quantity2)%>" readonly>
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

        var reportQuantity = $("#reportMonthlyTotalQuantity").val();
        var reportGrandTotal = $("#reportMonthlyGrandTotal").val();

        $('#reportMonthlyTable').DataTable({
            pageLength: 15,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'Monthly Summary of Health Workers Workload List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'Monthly Summary of Health Workers Workload List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'print',
                    text: 'Print Monthly Summary of Health Workers Workload List',
                    title: $('h1').text(),
                    message: '<br><br>',
                    className: 'btn btn-primary',
                    "paging": true,
                    "pagingType": "full_numbers",
                    customize: function (win) {
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .prepend(
                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Monthly Summary of Health Workers Workload List</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong>ADT-0003</strong></dd>\n\
                                        </div> '
                                        );
                        $(win.document.body).find('table')
                                .addClass('compact')
                                .css('font-size', '10pt')
                                .css('font-size', 'inherit');
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .css('font-weight', 'bolder')
                                .append('<div style="text-align: right;padding-top:10px;"><br> Grand Total Patient : ' + reportQuantity + ' </div>')
                              //  .append('<div style="text-align: right;"><br> Grand Total (RM) : ' + reportGrandTotal + ' </div>');
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
