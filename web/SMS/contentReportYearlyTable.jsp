<%-- 
    Document   : contentReportYearlyTable
    Created on : Dec 13, 2017, 10:20:16 AM
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
    YEARLY RELEASED DATA
</h4>


<table  id="reportYearlyTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">YEAR</th>
    <th style="text-align: center;">TOTAL ITEM QUANTITY RELEASED</th>
    <th style="text-align: center;">TOTAL PRICE (RM)</th>
</thead>
<tbody>

    <%
        NumberFormat formatterInt = new DecimalFormat("#0");
        NumberFormat formatter = new DecimalFormat("#0.00");

        double quantity = 0.00;
        double grandTotal = 0.00;

        String sql = " SELECT YEAR(sdd.txt_date) AS DATE,COUNT(sdd.item_cd), "
                + " SUM(sdd.item_quantity),SUM(sdd.item_amt),YEAR(sdd.txt_date)  "
                + " FROM stk_distribition_detail sdd "
                + " LEFT JOIN stk_distribition_master sdm ON (sdm.order_no =  sdd.order_no) "
                + " WHERE sdm.hfc_cd  = '" + hfc + "' AND sdm.discipline_cd  = '" + dis + "'  "
                + " GROUP BY DATE ";

        ArrayList<ArrayList<String>> dataReportYearly = conn.getData(sql);

        int size = dataReportYearly.size();
        for (int i = 0; i < size; i++) {

            quantity = quantity + Double.parseDouble(dataReportYearly.get(i).get(2));
            grandTotal = grandTotal + Double.parseDouble(dataReportYearly.get(i).get(3));

    %>

    <tr style="text-align: center;" id="moveToYearlySalesDetailsTButton">
<input id="dataYearlySalesListhidden" type="hidden" value="<%=String.join("|", dataReportYearly.get(i))%>">
<td><%= dataReportYearly.get(i).get(0)%></td>
<td><%= formatterInt.format(Double.parseDouble(dataReportYearly.get(i).get(2)))%></td>
<td><%= formatter.format(Double.parseDouble(dataReportYearly.get(i).get(3)))%></td>
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
                    <input id="reportYearlyTotalQuantity" name="reportYearlyTotalQuantity" type="text" placeholder="Total Order" class="form-control input-md" maxlength="50" value="<%= formatterInt.format(quantity)%>" readonly>
                </div>
            </div>

        </div>

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-5 control-label" for="textinput">Grand Total (RM)</label>
                <div class="col-md-4">
                    <input id="reportYearlyGrandTotal" name="reportYearlyGrandTotal" type="number" placeholder="Grand Total (RM)" class="form-control input-md" maxlength="50" value="<%= formatter.format(grandTotal)%>" readonly>
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

        var reportQuantity = $("#reportYearlyTotalQuantity").val();
        var reportGrandTotal = $("#reportYearlyGrandTotal").val();

        $('#reportYearlyTable').DataTable({
            pageLength: 15,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'Yearly Released Item List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'Yearly Released Item List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'print',
                    text: 'Print Yearly Sales List',
                    title: $('h1').text(),
                    message: '<br><br>',
                    className: 'btn btn-primary',
                    customize: function (win) {
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .prepend(
                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Yearly Released Item List</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong>SMS-0008</strong></dd>\n\
                                        </div> '
                                        );
                        $(win.document.body).find('table')
                                .addClass('compact')
                                .css('font-size', 'inherit');
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .css('font-weight', 'bolder')
                                .append('<div style="text-align: right;padding-top:10px;"><br> Total Item Released : ' + reportQuantity + ' </div>')
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


        // Move to Order Details Fetch Yearly Details Start
        $('#contentReportYearlyTable').off('click', '#reportYearlyTable #moveToYearlySalesDetailsTButton').on('click', '#reportYearlyTable #moveToYearlySalesDetailsTButton', function (e) {

            // $('<div class="loading">Loading</div>').appendTo('body');

            e.preventDefault();

            $('#contentReportSalesDetailViewModalTable').DataTable().destroy();


            var row = $(this).closest("tr");
            var rowData = row.find("#dataYearlySalesListhidden").val();
            var arrayData = rowData.split("|");
            console.log(arrayData);

            var rdate = arrayData[0];
            var date = arrayData[4];

            var data = {
                date: date
            };

            $.ajax({
                url: "controllerProcessReport/contentReportYearlyDetailsTable.jsp",
                type: "post",
                data: data,
                timeout: 3000,
                success: function (returnReportDetailsTableHTML) {

                    console.log(returnReportDetailsTableHTML);


                    var arrayData = returnReportDetailsTableHTML.split("<ShannugamRamasamySeperator></ShannugamRamasamySeperator>");

                    var table = arrayData[0];
                    var reportQuantity = arrayData[1];
                    var reportGrandTotal = arrayData[2];


                    $('#contentReportSalesDetailViewModalTable').html(table);

                    $('.loading').hide();

                    $('#contentReportSalesDetailViewModalTable').DataTable({
                        pageLength: 15,
                        initComplete: function (settings, json) {
                            $('.loading').hide();
                        },
                        dom: 'Bfrtip',
                        buttons: [
                            {
                                extend: 'excelHtml5',
                                text: 'Export To Excel',
                                title: 'Released Item List For ' + rdate,
                                className: 'btn btn-primary',
                                exportOptions: {
                                    columns: ':visible'
                                }
                            }, {
                                extend: 'csvHtml5',
                                text: 'Export To Excel CSV',
                                title: 'Released Item List For ' + rdate,
                                className: 'btn btn-primary',
                                exportOptions: {
                                    columns: ':visible'
                                }
                            }, {
                                extend: 'print',
                                text: 'Print Yearly Sales List',
                                title: $('h1').text(),
                                message: '<br><br>',
                                className: 'btn btn-primary',
                                customize: function (win) {
                                    $(win.document.body)
                                            .css('font-size', '10pt')
                                            .prepend(
                                                    '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Released Item List For ' + rdate + '</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong>SMS-0009</strong></dd>\n\
                                        </div> '
                                                    );
                                    $(win.document.body).find('table')
                                            .addClass('compact')
                                            .css('font-size', 'inherit');
                                    $(win.document.body)
                                            .css('font-size', '10pt')
                                            .css('font-weight', 'bolder')
                                            .append('<div style="text-align: right;padding-top:10px;"><br> Total Item Released : ' + reportQuantity + ' </div>')
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

                    $('#salesDetailViewModal').modal('show');

                }
            });



        });
        // Move to Order Details Fetch Details End

    });

</script>
