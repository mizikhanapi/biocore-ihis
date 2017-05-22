<%-- 
    Document   : atcTable
    Created on : Jan 25, 2017, 12:33:56 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>



<%
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
%>


<table  id="supplierTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">ID</th>
    <th style="text-align: center;">NAME</th>
    <th style="text-align: center;">BANK ACCOUNT NO.</th>
    <th style="display: none">BANK CODE</th>
    <th style="display: none">ADDRESS 1</th>
    <th style="display: none">ADDRESS 2</th>
    <th style="display: none">ADDRESS 3</th>
    <th style="display: none">TOWNCODE</th>
    <th style="display: none">POSCODE</th>
    <th style="display: none">DISTRICT</th>
    <th style="display: none">STATE</th>
    <th style="display: none">COUNTRY</th>
    <th style="text-align: center;">TELEPHONE NO.</th>
    <th style="text-align: center;">FAX NO.</th>
    <th style="display: none">EMAIL</th>
    <th style="display: none">GL CODE</th>
    <th style="display: none">ROC NO</th>
    <th style="display: none">REGIS DATE</th>
    <th style="display: none">CONTACT PERSON</th>
    <th style="display: none">PAYMENT TERM</th>
    <th style="display: none">ACC TYPE</th>
    <th style="display: none">CREDIT LIMIT</th>
    <th style="display: none">CURRENCY</th>
    <th style="display: none">STATUS</th>
    <th style="text-align: center;">Update</th>
    <th style="text-align: center;">Delete</th>
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
<td><%= dataSupplier.get(i).get(0)%></td> <!-- ID -->
<td><%= dataSupplier.get(i).get(1)%></td> <!-- NAME -->
<td><%= dataSupplier.get(i).get(2)%></td> <!-- ACC -->
<td style="display: none"><%= dataSupplier.get(i).get(3)%></td> <!-- BANK CODE -->
<td style="display: none"><%= dataSupplier.get(i).get(4)%></td> <!-- ADD 1 -->
<td style="display: none"><%= dataSupplier.get(i).get(5)%></td> <!-- ADD 2 -->
<td style="display: none"><%= dataSupplier.get(i).get(6)%></td> <!-- ADD 3 -->
<td style="display: none"><%= dataSupplier.get(i).get(7)%></td>  <!-- TOWN -->
<td style="display: none"><%= dataSupplier.get(i).get(8)%></td> <!-- POSTCODE -->
<td style="display: none"><%= dataSupplier.get(i).get(9)%></td> <!-- DISTRICT -->
<td style="display: none"><%= dataSupplier.get(i).get(10)%></td> <!-- STATE -->
<td style="display: none"><%= dataSupplier.get(i).get(11)%></td> <!-- COUNTRY -->
<td><%= dataSupplier.get(i).get(12)%></td> <!-- TEL -->
<td><%= dataSupplier.get(i).get(13)%></td> <!-- FAX -->
<td style="display: none"><%= dataSupplier.get(i).get(14)%></td> <!-- EMAIL -->
<td style="display: none"><%= dataSupplier.get(i).get(15)%></td> <!-- GL -->
<td style="display: none"><%= dataSupplier.get(i).get(16)%></td> <!-- ROC -->
<td style="display: none"><%= dataSupplier.get(i).get(17)%></td> <!-- REGIS DATE -->
<td style="display: none"><%= dataSupplier.get(i).get(18)%></td> <!-- CONTACT PERSON -->
<td style="display: none"><%= dataSupplier.get(i).get(19)%></td> <!-- PAYMENT TERM -->
<td style="display: none"><%= dataSupplier.get(i).get(20)%></td> <!-- ACC TYPE -->
<td style="display: none"><%= dataSupplier.get(i).get(21)%></td> <!-- CREDIT LIMIT -->
<td style="display: none"><%= dataSupplier.get(i).get(22)%></td> <!-- CURRENCY -->
<td style="display: none"><%= dataSupplier.get(i).get(23)%></td> <!-- STATUS -->
<td>
    <!-- Update Part Start -->
    <a id="supplierUpdateTButton" data-toggle="modal" data-target="#supplierModal"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
    <!-- Update Part End -->
</td>
<td>
    <!-- Delete Button Start -->
    <a id="supllierDeleteTButton" ><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f; width: " ></i></a>
    <!-- Delete Button End -->
</td>
</tr>
<%
    }
%>
</tbody>
</table>




<script type="text/javascript" charset="utf-8">

    $(document).ready(function () {

        // Supplier DataTables Start
        $('#supplierTable').DataTable({
            pageLength: 15,
            lengthMenu: [[15, 25, 50, -1], [15, 25, 50, "All"]],
            "language": {
                "emptyTable": "No Order Available To Display"
            }, initComplete: function (settings, json) {
                $('.loading').hide();
            }
        });
        // Supplier DataTables End



    });

</script>
