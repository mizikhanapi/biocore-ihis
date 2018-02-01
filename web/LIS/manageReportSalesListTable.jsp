<%-- 
    Document   : manageReportSalesListTable
    Created on : Feb 1, 2018, 11:06:37 AM
    Author     : Shammugam
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();

    NumberFormat formatterInt = new DecimalFormat("#0");
    NumberFormat formatter = new DecimalFormat("#0.00");

    String timeFrame = request.getParameter("timeFrame");
    String strName = request.getParameter("strName");

    //                                      0                                           1                   2
    String query = "SELECT date_format(om.order_date, '" + timeFrame + "') as masa, count(od.order_no), sum(id.ser_price) "
            //   FROM ORDER MASTER TABLE
            + "FROM lis_order_master om "
            //   JOIN ORDER DETAIL TABLE
            + "JOIN lis_order_detail od ON (om.order_no = od.order_no) "
            //   JOIN ITEM TABLE
            + "JOIN lis_item_detail id ON (id.item_cd = od.item_cd) AND id.hfc_cd = om.hfc_to "
            //   WHERE CONDITION
            + "WHERE om.hfc_to = '" + hfc + "' AND om.billing_status = '2' "
            //   GROUP BY CONDITION
            + "GROUP BY masa;";

    ArrayList<ArrayList<String>> dataSale = conn.getData(query);

    int intTotal = 0;
    double dblTotal = 0;

%>
<h3 style="font-weight: bolder;font-size: large;"> <%=strName%> Sale</h3>
<table id="reportLabSalesTable"  class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th >Date</th>
            <th >Total Order</th>
            <th >Total Sale (RM)</th>
        </tr>
    </thead>
    <tbody>

        <%
            for (int i = 0; i < dataSale.size(); i++) {%>
        <tr class="clickable_tr"  style="cursor: pointer;">
            <td><%=dataSale.get(i).get(0)%></td>
            <td><%=dataSale.get(i).get(1)%></td>
            <td>
                <%=dataSale.get(i).get(2)%>
                <input type="hidden" id="hiddenDate" value="<%=dataSale.get(i).get(0)%>">
                <input type="hidden" id="hiddenTimeFrame" value="<%=timeFrame%>">
            </td>
        </tr>
        <%
                try {
                    intTotal += Integer.parseInt(dataSale.get(i).get(1));
                } catch (Exception e) {
                    intTotal += 0;
                }

                try {
                    dblTotal += Double.parseDouble(dataSale.get(i).get(2));
                } catch (Exception e) {
                    dblTotal += 0;
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
                <label class="col-md-5 control-label" for="textinput">Total Quantity</label>
                <div class="col-md-4">
                    <input id="theQuantity" name="reportDailyTotalQuantity" type="text" placeholder="Total Order" class="form-control input-md" maxlength="50" value="<%= formatterInt.format(intTotal)%>" readonly>
                </div>
            </div>

        </div>

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-5 control-label" for="textinput">Grand Total (RM)</label>
                <div class="col-md-4">
                    <input id="theSale" name="reportDailyGrandTotal" type="number" placeholder="Grand Total (RM)" class="form-control input-md" maxlength="50" value="<%= formatter.format(dblTotal)%>" readonly>
                </div>
            </div>

        </div>
    </form>
</div>



<%
    String sqlhfc_cd = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc + "'";
    ArrayList<ArrayList<String>> mysqlhfc_cd = conn.getData(sqlhfc_cd);

    LocalDate localDate = LocalDate.now();
    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);

%>

<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {

        $('#reportLabSalesTable').DataTable({
            initComplete: function (settings, json) {
                $('.loading').hide();
            },
            pageLength: 15,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'Laboratory Sales List (<%=strName%>)',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'Laboratory Sales List (<%=strName%>)',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'print',
                    text: 'Print Sales List',
                    title: $('h1').text(),
                    message: '<br><br>',
                    className: 'btn btn-primary',
                    customize: function (win) {
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .prepend(
                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Laboratory Sales List For <%=strName%> </div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong>LIS-0005</strong></dd>\n\
                                        </div> '
                                        );
                        $(win.document.body).find('table')
                                .addClass('compact')
                                .css('font-size', 'inherit');
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .css('font-weight', 'bolder')
                                .append('<div style="text-align: right;padding-top:10px;"><br>Grand Total Order : <%=intTotal%><br>Grand Total Sale(RM) : <%=String.format("%.2f", dblTotal)%></div>');
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .append('<div style="text-align: center;padding-top:20px;"><br> ***** &nbsp;&nbsp;  End Of Report  &nbsp;&nbsp;  ***** </div>');
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
