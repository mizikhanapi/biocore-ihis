<%-- 
    Document   : drugOrderListReport
    Created on : Feb 20, 2017, 9:34:55 PM
    Author     : user
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>

<%
    Config.getBase_url(request);
    Config.getFile_url(session);

    Conn conn = new Conn();

    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    String filterBy = request.getParameter("filterBy");

    String hfccd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String discipline ="";
    if(!filterBy.equalsIgnoreCase("all")){
        String dis_name_query = "SELECT discipline_cd, discipline_name FROM adm_discipline WHERE discipline_hfc_cd='" + hfccd + "' and discipline_cd = '"+filterBy+"'";
        ArrayList<ArrayList<String>> mysqldis_name = conn.getData(dis_name_query);
        discipline = mysqldis_name.get(0).get(1);
    }else{
        discipline = "ALL";
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="../assets/header.html"%>

<hr class="pemisah" />
<table id="drugListTable" class="table table-filter table-striped table-bordered margin-top-50px" style="background: #fff; border: 1px solid #ccc; margin-top: 20px">

    <thead>
        <tr>
            <th> No </th>
            <th> Drug Code </th>
            <th> Description</th>
            <th> Price (RM)</th>
            <th> Total Patient </th>
            <th> Total Usage </th>
            <th> Total Amount (RM) </th>
        </tr>
    </thead>
    <tbody>
        <%            String sql = "";

            if (filterBy.equalsIgnoreCase("all")) {

                sql = "SELECT COUNT(m.drug_cd), COUNT(distinct(m.pmi_no)), m.drug_cd, m.drug_name, pmd2.`D_SELL_PRICE`, m.hfc_cd, m.discipline_cd "
                        + " FROM lhr_medication m, pis_mdc2 pmd2 "
                        + " WHERE m.drug_cd = pmd2.`UD_MDC_CODE` AND m.hfc_cd = '" + hfccd + "' AND m.episode_date between '" + startDate + "' AND '" + endDate + "' "
                        + " group by m.discipline_cd, m.drug_cd; ";

            } else {

                sql = "SELECT COUNT(m.drug_cd), COUNT(distinct(m.pmi_no)), m.drug_cd, m.drug_name, pmd2.`D_SELL_PRICE`, m.hfc_cd, m.discipline_cd "
                        + " FROM lhr_medication m, pis_mdc2 pmd2 "
                        + " WHERE m.drug_cd = pmd2.`UD_MDC_CODE` AND m.hfc_cd = '" + hfccd + "' AND m.episode_date between '" + startDate + "' AND '" + endDate + "' and m.discipline_cd = '"+filterBy+"' "
                        + " group by m.drug_cd; ";

            }

            ArrayList<ArrayList<String>> ps = conn.getData(sql);
            List empdetails = new LinkedList();
            JSONObject responseObj = new JSONObject();
            JSONObject empObj = null;
            int size = ps.size();
            float totalUsage = 0f;
            float grandAmount = 0f;
            DecimalFormat decimalFormat = new DecimalFormat("#.##");
            for (int i = 0; i < size; i++) {

                String drug_name = ps.get(i).get(4);
                String drug_usage = ps.get(i).get(0);
                float drug = Float.parseFloat(drug_usage);
                String total_patient = ps.get(i).get(1);
                float totPatient = Float.parseFloat(total_patient);
                String price = ps.get(i).get(4);
                float pri = Float.parseFloat(price);
                float total_amt = drug * totPatient * pri;
                total_amt = Float.valueOf(decimalFormat.format(total_amt));

                totalUsage += drug;
                grandAmount += total_amt;
                grandAmount = Float.valueOf(decimalFormat.format(grandAmount));

                //                empObj = new JSONObject();
                //                empObj.put("drug_name", drug_name);
                //                empObj.put("total_amount", total_amt);
                //                empdetails.add(empObj);
                //
                //                responseObj.put("empdetails", empdetails);
                //                out.print(responseObj.toString());
        %>

        <tr>
            <td>
                <%= i + 1%>
            </td>
            <td>
                <%= ps.get(i).get(2)%> 
            </td>
            <td>
                <%= ps.get(i).get(3)%>
                <input type="hidden" id="drug_name" value="<%= ps.get(i).get(3)%>">
            </td>
            <td>
                <%= ps.get(i).get(4)%>
            </td>

            <td>
                <%= ps.get(i).get(1)%>
            </td>

            <td>
                <%= ps.get(i).get(0)%>
            </td>

            <td>
                <%= total_amt%>
            </td>

        </tr>



        <%
            }
            String strGrand = String.format("%.02f", grandAmount);
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
                    <input id="reportYearlyTotalQuantity" name="reportYearlyTotalQuantity" type="text" placeholder="Total Order" class="form-control input-md" maxlength="50" value="<%=totalUsage%>" readonly>
                </div>
            </div>

        </div>

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-5 control-label" for="textinput">Grand Total (RM)</label>
                <div class="col-md-4">
                    <input id="reportYearlyGrandTotal" name="reportYearlyGrandTotal" type="number" placeholder="Grand Total (RM)" class="form-control input-md" maxlength="50" value="<%=strGrand%>" readonly="">
                </div>
            </div>

        </div>
    </form>
</div>

<%
    String hfc_cd = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfccd + "'";
    ArrayList<ArrayList<String>> mysqlhfc_cd = conn.getData(hfc_cd);
    LocalDate localDate = LocalDate.now();
    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);
%>

<script>
    var startdate,enddate;
            startdate="<%=startDate%>";
            enddate="<%=endDate%>";
            var temp = startdate.split("-");
             startdate = temp[2] + "-" + temp[1] + "-" + temp[0];

             temp = enddate.split("-");
             enddate = temp[2] + "-" + temp[1] + "-" + temp[0];
    $(document).ready(function () {
            

        $('#drugListTable').DataTable({
            initComplete: function (settings, json) {
                $('.loading').hide();
            },
            pageLength: 15,
            dom: 'Bfrtip',
            columnDefs: [
                {targets: [0, 1, 2, 3, 4, 5, 6], visible: true},
                {targets: '_all', visible: false}
            ],
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'Total Drug Cost List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'Total Drug Cost List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'print',
                    text: 'Print List',
                    title: $('h1').text(),
                    message: '<br><br>',
                    className: 'btn btn-primary',
                    customize: function (win) {
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .prepend(
                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Total Drug Cost List</div><p>Date: From <strong>'+startdate+'</strong>  To <strong>'+enddate+'</strong> </p><p>Discipline:<strong><%=discipline%></strong></p>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        </div> '
                                        );
                        $(win.document.body).find('table')
                                .addClass('compact')
                                .css('font-size', 'inherit');
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .append('<div style="text-align: center;padding-top:20px;"><br> ***** &nbsp;&nbsp;  End Of Report  &nbsp;&nbsp;  ***** </div>');
                    },
                    exportOptions: {
                        columns: ':visible'
                    }
                }
            ]
        });

    });
</script>