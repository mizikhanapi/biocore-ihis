<%-- 
    Document   : manageReportSupplierListTable
    Created on : May 29, 2017, 1:24:12 PM
    Author     : Shammugam
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>



<%
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
%>
<h4 style="padding-top: 2%;padding-bottom: 1%;">List Of Supplier</h4>

<table  id="reportListSupplierTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">ID</th>
    <th style="text-align: center;">NAME</th>
    <th style="text-align: center;">BANK ACCOUNT NO.</th>
    <th style="text-align: center;">BANK CODE</th>
    <th style="text-align: center;">ADDRESS 1</th>
    <th style="text-align: center;">ADDRESS 2</th>
    <th style="text-align: center;">ADDRESS 3</th>
    <th style="text-align: center;">TOWNCODE</th>
    <th style="text-align: center;">POSCODE</th>
    <th style="text-align: center;">DISTRICT</th>
    <th style="text-align: center;">STATE</th>
    <th style="text-align: center;">COUNTRY</th>
    <th style="text-align: center;">TELEPHONE NO.</th>
    <th style="text-align: center;">FAX NO.</th>
    <th style="text-align: center;">EMAIL</th>
    <th style="text-align: center;">GL CODE</th>
    <th style="text-align: center;">ROC NO</th>
    <th style="text-align: center;">REGIS DATE</th>
    <th style="text-align: center;">CONTACT PERSON</th>
    <th style="text-align: center;">PAYMENT TERM</th>
    <th style="text-align: center;">ACC TYPE</th>
    <th style="text-align: center;">CREDIT LIMIT</th>
    <th style="text-align: center;">CURRENCY</th>
    <th style="text-align: center;">STATUS</th>
</thead>
<tbody>

    <%
        //                         0        1               2               3            4       5         6        7        8       9      10     11           12
        String sql = " SELECT vendor_id,vendor_name,vendor_bank_acc_no,vendor_bank_cd,address1,address2,address3,towncode,poscode,district,state,country,telephone_no, "
                //    13    14     15      16         17                     18                       19                  20                      21                      22            23      24          25          26
                + " fax_no,email,gl_code,roc_no,registration_date, IFNULL(contact_person,''),IFNULL(payment_term,''),IFNULL(acc_type,''), IFNULL(credit_limit,''),IFNULL(currency,''),status,created_by,created_date,hfc_cd "
                + " FROM fap_vendor WHERE hfc_cd  = '" + hfc + "'";
        ArrayList<ArrayList<String>> dataSupplier = conn.getData(sql);

        int size = dataSupplier.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr style="text-align: center;">
<input id="dataSupplierhidden" type="hidden" value="<%=String.join("|", dataSupplier.get(i))%>">
<td ><%= dataSupplier.get(i).get(0)%></td> <!-- ID -->
<td ><%= dataSupplier.get(i).get(1)%></td> <!-- NAME -->
<td ><%= dataSupplier.get(i).get(2)%></td> <!-- ACC -->
<td ><%= dataSupplier.get(i).get(3)%></td> <!-- BANK CODE -->
<td ><%= dataSupplier.get(i).get(4)%></td> <!-- ADD 1 -->
<td ><%= dataSupplier.get(i).get(5)%></td> <!-- ADD 2 -->
<td ><%= dataSupplier.get(i).get(6)%></td> <!-- ADD 3 -->
<td ><%= dataSupplier.get(i).get(7)%></td>  <!-- TOWN -->
<td ><%= dataSupplier.get(i).get(8)%></td> <!-- POSTCODE -->
<td ><%= dataSupplier.get(i).get(9)%></td> <!-- DISTRICT -->
<td ><%= dataSupplier.get(i).get(10)%></td> <!-- STATE -->
<td ><%= dataSupplier.get(i).get(11)%></td> <!-- COUNTRY -->
<td ><%= dataSupplier.get(i).get(12)%></td> <!-- TEL -->
<td ><%= dataSupplier.get(i).get(13)%></td> <!-- FAX -->
<td ><%= dataSupplier.get(i).get(14)%></td> <!-- EMAIL -->
<td ><%= dataSupplier.get(i).get(15)%></td> <!-- GL -->
<td ><%= dataSupplier.get(i).get(16)%></td> <!-- ROC -->
<td ><%= dataSupplier.get(i).get(17)%></td> <!-- REGIS DATE -->
<td ><%= dataSupplier.get(i).get(18)%></td> <!-- CONTACT PERSON -->
<td ><%= dataSupplier.get(i).get(19)%></td> <!-- PAYMENT TERM -->
<td ><%= dataSupplier.get(i).get(20)%></td> <!-- ACC TYPE -->
<td ><%= dataSupplier.get(i).get(21)%></td> <!-- CREDIT LIMIT -->
<td ><%= dataSupplier.get(i).get(22)%></td> <!-- CURRENCY -->
<td ><%if (dataSupplier.get(i).get(23).equals("1")) {
        out.print("Active");
    } else {
        out.print("Inactive");
    } %></td> <!-- STATUS -->

</tr>
<%
    }
%>
</tbody>
</table>

<%
    String hfc_cd = "SELECT logo FROM adm_health_facility WHERE hfc_cd='" + hfc + "'";
    ArrayList<ArrayList<String>> mysqlhfc_cd = conn.getData(hfc_cd);
    LocalDate localDate = LocalDate.now();
    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);
%>


<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {

        // Supplier DataTables Start
        $('#reportListSupplierTable').DataTable({
            initComplete: function (settings, json) {
                $('.loading').hide();
            },
            pageLength: 15,
            dom: 'Bfrtip',
            columnDefs: [
                {targets: [0, 1, 2, 12, 13, 23], visible: true},
                {targets: '_all', visible: false}
            ],
            buttons: [
                {
                    extend: 'excelHtml5',
                    text: 'Export To Excel',
                    title: 'Pharmacy Supplier List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'csvHtml5',
                    text: 'Export To Excel CSV',
                    title: 'Pharmacy Supplier List',
                    className: 'btn btn-primary',
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'print',
                    text: 'Print Supplier List',
                    title: $('h1').text(),
                    message: '<br><br>',
                    className: 'btn btn-primary',
                    customize: function (win) {
                        $(win.document.body)
                                .css('font-size', '10pt')
                                .prepend(
                                        '<div class="logo-hfc asset-print-img" style="z-index: 0; top: 0px; opacity: 1.0;">\n\
                                        <img src="<%=mysqlhfc_cd.get(0).get(0)%>" style="text-align: center; height: 100%; " /></div> <div class="mesej">Pharmacy Supplier List</div>\n\
                                        <div class="info_kecik">\n\
                                        <dd>Date: <strong><%=newdate%></strong></dd>\n\
                                        <dd>Report No: <strong><%=newdate%></strong></dd>\n\
                                        </div> '
                                        );
                        $(win.document.body).find('table')
                                .addClass('compact')
                                .css('font-size', 'inherit');
                    },
                    exportOptions: {
                        columns: ':visible'
                    }
                }, {
                    extend: 'colvis',
                    collectionLayout: 'fixed two-column',
                    text: 'Filter Table Column',
                    className: 'btn btn-success'
                }
            ]
        });
        // Supplier DataTables End



    });

</script>
