<%-- 
    Document   : vendorTable
    Created on : Dec 15, 2017, 4:32:57 PM
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


<table  id="vendorTable"  class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
    <th style="text-align: center;">ID</th>
    <th style="text-align: center;">NAME</th>
    <th style="text-align: center;">BANK ACCOUNT NO.</th>
    <th style="text-align: center;">TELEPHONE NO.</th>
    <th style="text-align: center;">FAX NO.</th>
    <th style="text-align: center;">STATUS</th>
    <th style="text-align: center;">Update</th>
    <th style="text-align: center;">Delete</th>
</thead>
<tbody>

    <%
        //                         0        1         2               3                 4             5        6          7        8         9        10       11        
        String sql = " SELECT vendor_id, hfc_cd, vendor_name, vendor_bank_acc_no, vendor_bank_cd, address1, address2, address3, towncode, poscode, district, state, "
                //     12         13         14         15              16      17               18                       19                            20    
                + " country, telephone_no, fax_no, IFNULL(email,''), gl_code, roc_no, IFNULL(registration_date,''), IFNULL(contact_person,''), IFNULL(payment_term,''), "
                //          21                     22                   23               24         25          26
                + " IFNULL(acc_type,''), IFNULL(credit_limit,''), IFNULL(currency,''), status, created_by, created_date "
                //    FROM SQL
                + " FROM fap_vendor WHERE hfc_cd  = '" + hfc + "'";
        
        ArrayList<ArrayList<String>> dataVendor = conn.getData(sql);

        int size = dataVendor.size();
        for (int i = 0; i < size; i++) {
    %>

    <tr style="text-align: center;">
<input id="dataVendorhidden" type="hidden" value="<%=String.join("|", dataVendor.get(i))%>">
<td><%= dataVendor.get(i).get(0)%></td> <!-- ID -->
<td><%= dataVendor.get(i).get(2)%></td> <!-- NAME -->
<td><%= dataVendor.get(i).get(3)%></td> <!-- ACC -->
<td><%= dataVendor.get(i).get(13)%></td> <!-- TEL -->
<td><%= dataVendor.get(i).get(14)%></td> <!-- FAX -->
<td><% if (dataVendor.get(i).get(24).equals("1")) {
        out.print("Active");
    } else {
        out.print("Inactive");
    }%></td> <!-- STATUS -->
<td>
    <!-- Update Part Start -->
    <a id="vendorUpdateTButton" data-toggle="modal" data-target="#vendorModal"><i class="fa fa-pencil-square-o" aria-hidden="true" style="display: inline-block;color: #337ab7;"></i></a>
    <!-- Update Part End -->
</td>
<td>
    <!-- Delete Button Start -->
    <a id="vendorDeleteTButton" ><i class="fa fa-times" aria-hidden="true" style="display: inline-block;color: #d9534f; width: " ></i></a>
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
        $('#vendorTable').DataTable({
            pageLength: 15,
            lengthMenu: [[15, 25, 50, -1], [15, 25, 50, "All"]],
            "language": {
                "emptyTable": "No Vendor Data Available To Display"
            }, initComplete: function (settings, json) {
                $('.loading').hide();
            }
        });
        // Supplier DataTables End



    });

</script>
