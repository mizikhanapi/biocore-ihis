<%-- 
    Document   : deleveryOrderBasic
    Created on : May 10, 2017, 1:18:29 AM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>


<%
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
%>


<form class="form-horizontal" name="myForm" id="invoiceForm">

    <!-- Select Basic -->
    <div class="form-group">
        <label class="col-md-4 control-label" for="selectbasic">Deliver order for</label>
        <div class="col-md-6">
            <select id="deleveryOrderFor" name="" class="form-control" required="">
                <option value="Pharmacy">Pharmacy</option>
            </select>
        </div>
    </div>

    <hr class="pemisah" />


    <div class="col-md-4">
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="textinput">Invoice Date *</label>
            <div class="col-md-6">
                <input id="invoiceDate" name="invoiceDate" type="text"class="form-control input-md" placeholder="Select Invoice Date" readonly>
            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="textinput">Delivery Date *</label>
            <div class="col-md-6">
                <input id="deliveryDate" name="deliveryDate" type="text"class="form-control input-md" placeholder="Select Delivery Date" readonly>
            </div>
        </div>

    </div>

    <div class="col-md-4">
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="textinput">Invoice Number *</label>
            <div class="col-md-6">
                <input id="invoiceNumber" name="invoiceNumber" type="text"class="form-control input-md" placeholder="Insert Invoice Number">
            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="textinput">Order Number *</label>
            <div class="col-md-6">
                <input id="orderNumber" name="orderNumber" type="text"class="form-control input-md" placeholder="Insert Order Number">
            </div>
        </div>
    </div>

    <div class="col-md-4">


        <div class="form-group">
            <label class="col-md-4 control-label" for="textinput">Supplier</label>
            <div class="col-md-6">
                <select id="supplierDetails" name="supplierDetails" class="form-control" >
                    <option value="">Please Select Supplier</option>
                    <%
                        String sqlSupp = "SELECT vendor_id,vendor_name FROM fap_vendor where hfc_cd = '" + hfc + "' ";
                        ArrayList<ArrayList<String>> listOfDClass = conn.getData(sqlSupp);

                        int size8 = listOfDClass.size();

                        for (int i = 0; i < size8; i++) {
                    %>
                    <option value="<%= listOfDClass.get(i).get(0)%>"><%= listOfDClass.get(i).get(1)%> </option>
                    <%
                        }
                    %>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-md-4 control-label" for="textinput">Description</label>
            <div class="col-md-6">
                <input type="text" class="form-control input-md" id="invoiceDescription" name="invoiceDescription" placeholder="Invoice Description (OPTIONAL)" >
                <input id="drug_Total_Quantity" type="hidden" class="form-control" >
                <input id="drug_Total_Ammount" type="hidden" class="form-control" >
                <input id="drug_Detail_Data" type="hidden" class="form-control" >
            </div>
        </div>
    </div>


</form>





<script>

    // Date Picker For Insert
    $("#invoiceDate").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd'
    });

    // Date Picker For Insert
    $("#deliveryDate").datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: 'yy-mm-dd'
    });


    // Move to Order Details Fetch Details Start
    $('#InvoiceTopContentMaster').off('click', '#drugInvoiceListTable #moveToInvoiceDetailsTButton').on('click', '#drugInvoiceListTable #moveToInvoiceDetailsTButton', function (e) {

        // $('<div class="loading">Loading</div>').appendTo('body');

        e.preventDefault();

        var row = $(this).closest("tr");
        var rowData = row.find("#dataInvoiceListhidden").val();
        var arrayData = rowData.split("|");
        console.log(arrayData);

        $('#deleveryOrderInvoiceDetailsTable').DataTable().destroy();

        //Assign Array into seprated val
        var invoiceNo = arrayData[1];
        var invoiceSupplierName = arrayData[12];
        var invoiceDate = arrayData[2];
        var invoiceTotalAmount = arrayData[7];

        var data = {
            invoiceNo: invoiceNo
        };

        $.ajax({
            url: "deleveryOrderInvoiceDetailTable.jsp",
            type: "post",
            data: data,
            timeout: 3000,
            success: function (returnInvoiceDetailsTableHTML) {
                console.log(returnInvoiceDetailsTableHTML);
                $('#deleveryOrderInvoiceDetailsTable').html(returnInvoiceDetailsTableHTML);
                $('#deleveryOrderInvoiceDetailsTable').DataTable({
                    "paging": true,
                    "lengthChange": false,
                    "pageLength": 5,
                    "language": {
                        "emptyTable": "No Details Available Available To Display"
                    }
                });

                $('#deleveryInvoiceNo').val(invoiceNo);
                $('#deleveryInvoiceSupplierName').val(invoiceSupplierName);
                $('#deleveryInvoiceDate').val(invoiceDate);
                $('#deleveryInvoiceTotalAmount').val(invoiceTotalAmount);

                $('#deleveryInvoiceModal').modal('show');

            }
        });


    });
    // Move to Order Details Fetch Details End




</script>