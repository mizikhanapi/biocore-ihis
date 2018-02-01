<%-- 
    Document   : manageReportOrderListTableDetails
    Created on : Feb 1, 2018, 9:25:19 AM
    Author     : Shammugam
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");

    String date = request.getParameter("date");
    String status = request.getParameter("status");
    String timeFrame = request.getParameter("timeFrame");

    String whereCondition = "", tabStat = "";

    if (status.equalsIgnoreCase("0")) {

        whereCondition = " AND lis_order_master.order_no in "
                + "(SELECT order_no FROM lis_order_detail "
                + "GROUP BY order_no HAVING sum(detail_status <> '0') = 0) ";
        tabStat = "Pending";

    } else if (status.equalsIgnoreCase("1")) {

        whereCondition = " AND lis_order_master.order_no in "
                + "(SELECT order_no FROM lis_order_detail "
                + "WHERE detail_status in ('1')) ";
        tabStat = "In progress";

    } else if (status.equalsIgnoreCase("2")) {

        whereCondition = " AND lis_order_master.order_status='3' ";
        tabStat = "Completed";

    } else if (status.equalsIgnoreCase("3")) {

        whereCondition = " AND lis_order_master.order_status='1' ";
        tabStat = "Canceled";

    }

    //                            0                           1                           2                       3                         4                                                         
    String sql = "SELECT lis_order_master.pmi_no, lis_order_master.order_no, lis_order_master.hfc_cd, lis_order_master.episode_date, lis_order_master.encounter_date,  "
            //                  5                                                   6                                          
            + " date_format(lis_order_master.order_date, '%d/%m/%Y'), lis_order_master.order_status, "
            //                  7                                              8
            + " IFNULL(pms_patient_biodata.PATIENT_NAME, '-') ,IFNULL(pms_patient_biodata.NEW_IC_NO , '-') "
            //        FROM MASTER TABLE
            + " FROM lis_order_master  "
            //        JOIN PATIENT TABLE
            + " LEFT JOIN pms_patient_biodata ON (lis_order_master.pmi_no = pms_patient_biodata.PMI_NO) "
            //        WHERE CONDITION
            + " WHERE lis_order_master.hfc_to = '" + hfc_cd + "' AND date_format(lis_order_master.order_date, '" + timeFrame + "')='" + date + "' " + whereCondition;

    ArrayList<ArrayList<String>> dataOrder = conn.getData(sql);

%>
<table id="reportLabOrderTableDetails"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Order No</th>
            <th>Episode Date</th>
            <th>Order Date</th>
            <th>Patient PMI</th>
            <th>Patient Name</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody>

        <%            for (int i = 0; i < dataOrder.size(); i++) {

        %>
        <tr>
            <td><%=dataOrder.get(i).get(1)%></td>
            <td><%=dataOrder.get(i).get(3)%></td>
            <td><%=dataOrder.get(i).get(5)%></td>
            <td><%=dataOrder.get(i).get(0)%></td>
            <td style="text-transform: uppercase;"><%=dataOrder.get(i).get(7)%></td>
            <td><%=tabStat%></td>
        </tr>
        <%

            }
        %>
    </tbody>
</table>




<%
    String sqlhfc_cd = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc_cd + "'";
    ArrayList<ArrayList<String>> mysqlhfc_cd = conn.getData(sqlhfc_cd);

    LocalDate localDate = LocalDate.now();
    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);

%>

<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {

        $('#reportLabOrderTableDetails').DataTable({
            initComplete: function (settings, json) {
                $('.loading').hide();
            },
            pageLength: 15,
            dom: 'Bfrtip',
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'Laboratory Order List Details',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'Laboratory Order List Details',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'print',
                    text: 'Print Order List Details',
                    title: $('h1').text(),
                    message: '<br><br>',
                    className: 'btn btn-primary',
                    customize: function (win) {
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .prepend(
                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej"><br>Laboratory Order List Details</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong>LIS-0004</strong></dd>\n\
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
                }, {
                    extend: 'colvis',
                    text: 'Filter Table Column',
                    className: 'btn btn-success'
                }
            ]
        });

    });

</script>