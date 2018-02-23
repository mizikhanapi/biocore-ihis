<%-- 
    Document   : reportBillingSalesReportGetDailyCustomerSalesReport
    Created on : Feb 23, 2018, 8:43:54 PM
    Author     : Shammugam
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>

<%
    Conn con = new Conn();

    // Generate Parameter
    String day = request.getParameter("day");
    String month = request.getParameter("month");
    String year = request.getParameter("year");
    String monthString = request.getParameter("monthString");

    // Get Session Parameter
    String userId = session.getAttribute("USER_ID").toString();
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis_cd = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub_cd = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    // Generate Decimal Format
    NumberFormat formatterInt = new DecimalFormat("#0");
    NumberFormat formatter = new DecimalFormat("#0.00");

    // Get HFC Details SQL
    String queryLogo = "SELECT logo, hfc_name, CONCAT(address1,' ',address2,' ',address3) FROM adm_health_facility WHERE hfc_cd='" + hfc_cd + "';";
    ArrayList<ArrayList<String>> dataLogo = con.getData(queryLogo);

    LocalDate localDate = LocalDate.now();
    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);

    // Declare Variable
    int num = 1;

    String sql = " SELECT cd.customer_id , IFNULL(pb.`PATIENT_NAME`,'-'), SUM(cd.quantity) AS SQ, SUM(cd.item_amt) AS SA"
            + " FROM far_customer_dtl cd  "
            + " LEFT JOIN far_customer_hdr ch ON (cd.bill_no = ch.bill_no)  "
            + " LEFT JOIN pms_patient_biodata pb ON (cd.customer_id = pb.PMI_NO)  "
            + " WHERE DATE(cd.txn_date) = '" + year + "-" + month + "-" + day + "' AND ch.hfc_cd = '" + hfc_cd + "'  "
            + " GROUP BY cd.customer_id "
            + " ORDER BY SQ DESC; ";

    ArrayList<ArrayList<String>> data = con.getData(sql);

    // Total
    double grandTotalSales = 0;
    int grandTotalQty = 0;

%>
<div class="center-block"  style="text-align: center;">
    <h2>
        Daily Sales Report for <%=day%> <%=monthString%> <%=year%>
    </h2>
</div> 
<br>
<div class="center-block" style="align-content: center;">
    <table class="table table-filter table-striped table-bordered" width="100%" cellpadding="5" border="1" id="reportBilllingCustomerSalesReportTable">
        <thead>
            <tr>
                <th width="10%">No.</th>
                <th width="20%">PMI No</th>
                <th width="46%">Name</th>
                <th style="text-align: center;" width="17%">Total Unit Purchased</th>
                <th style="text-align: center;" width="17%">Total Money Spend (RM)</th>
            </tr>
        </thead>
        <tbody> 
            <%
                for (int i = 0; i < data.size(); i++) {

                    String pmi_no = data.get(i).get(0);
                    String name = data.get(i).get(1);
                    int totalQty = Integer.parseInt(data.get(i).get(2));
                    double totalSales = Double.parseDouble(data.get(i).get(3));

                    grandTotalQty += totalQty;
                    grandTotalSales += totalSales;
            %>
            <tr>
                <td><%=num%></td>
                <td><%=pmi_no%></td>
                <td><%=name%></td>
                <td style="text-align: center;"><%=totalQty%></td>
                <td style="text-align: center;"><%=formatter.format(totalSales)%></td>
            </tr> 

            <%  num++;
                }

            %>
        </tbody>
    </table>
</div>
<br>
<hr/>


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
                    <input id="reportTotalQuantity" name="reportTotalQuantity" type="text" placeholder="Total Order" class="form-control input-md" maxlength="50" value="<%= formatterInt.format(grandTotalQty)%>" readonly>
                </div>
            </div>

        </div>

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-5 control-label" for="textinput">Grand Total (RM)</label>
                <div class="col-md-4">
                    <input id="reportGrandTotal" name="reportGrandTotal" type="number" placeholder="Grand Total (RM)" class="form-control input-md" maxlength="50" value="<%= formatter.format(grandTotalSales)%>" readonly>
                </div>
            </div>

        </div>
    </form>
</div>


<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {

        var reportQuantity = $("#reportTotalQuantity").val();
        var reportGrandTotal = $("#reportGrandTotal").val();

        $('#reportBilllingCustomerSalesReportTable').DataTable({
            pageLength: 10,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'Daily Customer Sales List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'Daily Customer Sales List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'print',
                    text: 'Print Daily Customer Sales List',
                    title: $('h1').text(),
                    message: '<br><br>',
                    className: 'btn btn-primary',
                    customize: function (win) {
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .prepend(
                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=dataLogo.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Daily Customer Sales List for <%=day%> <%=monthString%> <%=year%></div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong>BLI-0004</strong></dd>\n\
                                        </div> '
                                        );
                        $(win.document.body).find('table')
                                .addClass('compact')
                                .css('font-size', 'inherit');
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .css('font-weight', 'bolder')
                                .append('<div style="text-align: right;padding-top:10px;"><br> Total Item (UNIT) : ' + reportQuantity + ' </div>')
                                .append('<div style="text-align: right;"><br> Grand Total (RM) : ' + reportGrandTotal + ' </div>');
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