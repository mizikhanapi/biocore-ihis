<%-- 
    Document   : laporanKosPerubatanReport
    Created on : Feb 24, 2017, 9:14:18 PM
    Author     : user
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.io.*"%> 
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="net.sf.jasperreports.engine.*"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<hr/>
<div class="row">
    <div class="col-md-12">
        <div class="thumbnail">
            <%
                Conn conn = new Conn();
                String startDate = request.getParameter("startDate");
                String endDate = request.getParameter("endDate");
                String my_1_hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
                //out.print(startDate);

                String sql = "SELECT pat.`PMI_NO`, pat.`NEW_IC_NO`, pat.`ID_NO`, pat.`OLD_IC_NO`, led.`customer_id` ,led.`txn_date` ,led.`bill_amt` ,led.`bill_desc`, pat.`PATIENT_NAME` "
                        + "FROM `far_customer_ledger` led "
                        + "INNER JOIN `pms_patient_biodata` pat ON led.`customer_id` = pat.`PMI_NO` "
                        + "WHERE led.hfc_cd='"+my_1_hfc_cd+"' AND led.`txn_date` BETWEEN '"+startDate+"' AND '"+endDate+"';";
                //AND diagnosis.`HFC_Cd`='"+my_1_hfc_cd+"'
                ArrayList<ArrayList<String>> cost = conn.getData(sql);

                String hfc_cd_logo = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + my_1_hfc_cd + "'";
                ArrayList<ArrayList<String>> mysqlhfc_cd = conn.getData(hfc_cd_logo);
                LocalDate localDate = LocalDate.now();
                String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);
            %>

            <div class="pull-right hidden"><input name="b_print" id="b_print" type="button" class="btn btn-success" value=" Print "></div><br>
            <table id="costTable">
                <thead>
                    <tr>
                        <th style="width: 5%;">No.</th>
                        <th style="width: 15%;">Date Visit</th>
                        <th >IC No.</th>
                        <th style="width: 25%;">Name</th>
                        <th style="">Description</th>  
                        <th style="">Cost (RM)</th>  
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th colspan="4" style="text-align:right"></th>
                        <th></th>
                    </tr>
                </tfoot>
                <tbody>
                    <%
                        int size = cost.size();
                        float grandTotal = 0f;
                        for (int i = 0; i < size; i++) {
                            try {
                                grandTotal += Float.parseFloat(cost.get(i).get(6));
                            } catch (Exception e) {

                            }
                    %>
                    <tr>
                        <td id="No"><%= i + 1%></td>
                        <td id="DateTime"><%= cost.get(i).get(5)%></td>
                        <td id="icNo"><%= cost.get(i).get(1)%></td>
                        <td id="Name"><%= cost.get(i).get(8)%></td>
                        <td id="Name"><%= cost.get(i).get(7)%></td>
                        <td id="cost"><%= cost.get(i).get(6)%></td>


                    </tr>

                    <%
                        }// end for loop

                        String strGrand = String.format("%.02f", grandTotal);
                    %> 
                </tbody>
            </table>
            <div class="row" id="data">
                <!-- content goes here -->
                <form class="form-horizontal" id="addForm">

                    <div class="col-md-3">
                    </div>
                    <div class="col-md-3">
                    </div>

                    <div class="col-md-4">

                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-5 control-label" for="textinput">Grand Total (RM)</label>
                            <div class="col-md-4">
                                <input id="reportYearlyGrandTotal" name="reportYearlyGrandTotal" type="number" placeholder="Grand Total (RM)" class="form-control input-md" maxlength="50" value="<%= strGrand%>" readonly>
                            </div>
                        </div>

                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

<script>

    $(document).ready(function () {


        $('#costTable').DataTable({
            initComplete: function (settings, json) {
                destroyScreenLoading();
            },
            pageLength: 15,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'Laporan Kos Perubatan',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'Laporan Kos Perubatan',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'print',
                    text: 'Print',
                    title: $('h1').text(),
                    message: '<br><br>',
                    className: 'btn btn-primary',
                    customize: function (win) {
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .prepend(
                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Laporan Kos Perubatan</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        </div> '
                                        );
                        $(win.document.body).find('table')
                                .addClass('compact')
                                .css('font-size', '10pt')
                                .css('font-size', 'inherit');
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .css('font-weight', 'bolder')
                                .append('<div style="text-align: right;padding-top:10px;"><br>Grand Total (RM): <%=strGrand%></div>');
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

        $('#b_print').click(function () {
            printReport();
        });

        function printReport() {
            var divElements = $('#PrintCost').html();
            var popupWin = window.open('', '_blank', 'width=1200,height=500');
            popupWin.document.open();
            popupWin.document.write('<html><body onload="window.print()">' + divElements + '</html>');
            popupWin.document.close();
        }

    });

</script>

<%-- 
<div id="PrintCost" style="display: none">


    <table id="costTable">
        <thead>
        <th style="width: 5%;">No.</th>
        <th style="width: 15%;">Date and Time</th>
        <th style="width: 25%;">Name</th>			 
        <th >Pmi No.</th>
        <th >IC No.</th>
        <th style="">Cost (RM)</th>                
        </thead>
        <tfoot>
            <tr>
                <th colspan="5" style="text-align:right">
                    <%
                        String Total = "SELECT SUM(far_customer_ledger.`bill_amt`) FROM `far_customer_ledger` far_customer_ledger INNER JOIN `pms_patient_biodata` pms_patient_biodata ON far_customer_ledger.`customer_id` = pms_patient_biodata.`PMI_NO`WHERE far_customer_ledger.`txn_date` BETWEEN '" + startDate + "' AND '" + endDate + "'";
                        ArrayList<ArrayList<String>> total = conn.getData(Total);
                    %>
                    Total: <%=total.get(0).get(0)%></th>
                <th></th>
            </tr>
        </tfoot>
        <tbody>
            <%
                ArrayList<ArrayList<String>> cost1 = conn.getData(sql);
                int size1 = cost1.size();
                for (int i = 0; i < size1; i++) {
            %>
            <tr>
                <td id="No"><%= i + 1%></td>
                <td id="DateTime"><%= cost1.get(i).get(5)%></td>
                <td id="Name"><%= cost1.get(i).get(7)%></td>
                <td id="pmino"><%= cost1.get(i).get(0)%></td>
                <td id="icNo"><%= cost1.get(i).get(1)%></td>
                <td id="cost"><%= cost1.get(i).get(6)%></td>


            </tr>

            <%
                }
            %> 
        </tbody>
    </table>
</div>
--%>