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
    MONTHLY LIST OF ADMISSION
</h4>


<table  id="reportMonthlyTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead >
   <th style="text-align: center;">MONTH</th>
      <th style="text-align: center;">TOTAL PATIENT</th>
 
</thead>
<tbody>

    <%        NumberFormat formatterInt = new DecimalFormat("#0");
        NumberFormat formatter = new DecimalFormat("#0.00");

        double quantity = 0.00;
        double grandTotal = 0.00;

        String sql =  " SELECT DATE_FORMAT(wis_inpatient_episode.created_date, '%M %Y') AS DATE,"
                
                + "COUNT(wis_inpatient_episode.pmi_no),"
                + "COUNT(wis_inpatient_episode.pmi_no),"
                + "EXTRACT(YEAR_MONTH FROM wis_inpatient_episode.created_date)  "
                + " FROM wis_inpatient_episode "
             
                + " where hfc_cd  = '" + hfc + "' AND discipline_cd  = '" + dis + "' GROUP BY DATE; ";

       
        ArrayList<ArrayList<String>> dataReportMonthly = conn.getData(sql);

        int size = dataReportMonthly.size();
        for (int i = 0; i < size; i++) {

            quantity = quantity + Double.parseDouble(dataReportMonthly.get(i).get(2));
            //grandTotal = grandTotal + Double.parseDouble(dataReportMonthly.get(i).get(3));

    %>

    <tr style="text-align: center;" id="moveToMonthlySalesDetailsTButton">
<input id="dataMonthlySalesListhidden" type="hidden" value="<%=String.join("|", dataReportMonthly.get(i))%>">
<td><%= dataReportMonthly.get(i).get(0)%></td>
<td><%= formatterInt.format(Double.parseDouble(dataReportMonthly.get(i).get(1)))%></td>

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
                <label class="col-md-5 control-label" for="textinput">Total Quantity</label>
                <div class="col-md-4">
                    <input id="reportMonthlyTotalQuantity" name="reportMonthlyTotalQuantity" type="text" placeholder="Total Order" class="form-control input-md" maxlength="50" value="<%= formatterInt.format(quantity)%>" readonly>
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
                    title: 'Inpatient Monthly Admission List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'Inpatient Monthly Admission List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'print',
                    text: 'Print Monthly Admission List',
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
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Monthly Inpatient Admission List</div>\n\
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
                                .append('<div style="text-align: right;padding-top:10px;"><br> Grand Total Inpatient Admission : ' + reportQuantity + ' </div>')
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
