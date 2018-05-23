<%-- 
    Document   : manageBillGenerateBillDetailUnpaidPaid
    Created on : Oct 25, 2017, 8:51:42 PM
    Author     : Shammugam
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="main.RMIConnector"%>

<%

    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = (String) session.getAttribute("DISCIPLINE_CODE");

    // Generate Decimal Format
    DecimalFormat df = new DecimalFormat("0.00");
    DecimalFormat dfQuan = new DecimalFormat("0");

    // Generate Parameter
    String billNo = request.getParameter("billNo");
    String txtDate = request.getParameter("txtDate");
    String custID = request.getParameter("custID");
    String pName = request.getParameter("pName");
    String address = request.getParameter("address");
    String icNo = request.getParameter("icNo");
    String otherID = request.getParameter("otherID");
    String phoneNo = request.getParameter("phoneNo");
    String status = request.getParameter("status");


%>


<div style="margin-bottom: 50px">
    <h4><b>Bill Detail</b></h4>
    <div class="form-group">
        <label class="col-lg-2">Bill No.</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" name="billNo" id="billNo" value="<%=billNo%>" readonly="true">
        </div>
        <label class="col-lg-2">Transaction Date</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" name="txnDate" id="txnDate" value="<%=txtDate%>" readonly="true">
        </div>
        <label class="col-lg-2">Customer ID</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" id="custID" value="<%=custID%>" readonly="true">
        </div>
        <label class="col-lg-2">Name</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" name="patientName" id="patientName" value="<%=pName%>" readonly="true">
        </div>
        <label class="col-lg-2">Address</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" name="address" id="address" value="<%=address%>" readonly="true">
        </div>
        <label class="col-lg-2">IC No.</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" name="ic" id="ic" value="<%=icNo%>" readonly="true">
        </div>
        <label class="col-lg-2">Other ID</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" name="otherID" id="otherID" value="<%=otherID%>" readonly="true">
        </div>
        <label class="col-lg-2">Phone No.</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" name="phone" id="phone" value="<%=phoneNo%>" readonly="true">
        </div>
    </div>
</div>


<br>
<br>


<h5><b>Item Detail</b></h5>
<div>
    <div id="listOfItems">
        <table id="tableItems" class="table table-filter table-striped table-bordered">
            <thead>
            <th>Transaction Date</th>
            <th>Item Code</th>
            <th>Item Description</th>
            <th style="text-align: right;">Item Quantity</th>
            <th style="text-align: right;">Unit Price (RM)</th>
            <th style="text-align: right;">Total Amount (RM)</th>
                <%
                    if (status.equalsIgnoreCase("unpaid")) {
                %>
            <th style="text-align: right;">Action</th>
                <%}%>
            </thead>
            <tbody>
                <%
                    String query2
                            = "SELECT txn_date, item_cd, item_desc, quantity, item_amt/quantity, item_amt, bill_no, ref_order_no "
                            + "FROM far_customer_dtl "
                            + "WHERE bill_no = '" + billNo + "' ";
                    ArrayList<ArrayList<String>> dataBill = conn.getData(query2);

                    for (int i = 0; i < dataBill.size(); i++) {
                %>
                <tr>
            <input id="dataManageBillDetailOrderListhidden" type="hidden" value="<%=String.join("|", dataBill.get(i))%>">
            <td><%=dataBill.get(i).get(0)%></td>
            <td><%=dataBill.get(i).get(1)%></td>
            <td><%=dataBill.get(i).get(2)%></td>
            <td style="text-align: right;"><%=dataBill.get(i).get(3)%></td>
            <td style="text-align: right;"><%=df.format(Double.parseDouble(dataBill.get(i).get(4)))%></td>
            <td style="text-align: right;"><%=df.format(Double.parseDouble(dataBill.get(i).get(5)))%></td>
            <%
                if (status.equalsIgnoreCase("unpaid")) {
            %>
            <td>
                <button id="manageBillViewBillDetailsDeleteBtn" class="btn btn-danger pull-right" type="button"><i class="fa fa-trash fa-lg" aria-hidden="true"></i>&nbsp; Delete</button>
            </td>
            <%}%>
            </tr>
            <%}
            %>
            </tbody>
        </table>
    </div>
</div>


<%
    double grandTotal = 0;
    int grandQuantity = 0;
    double subtotal = 0;
    double amtPaid = 0;

    String querySelectItem = "SELECT item_cd, item_desc, item_amt, quantity "
            + "FROM far_customer_dtl "
            + "WHERE bill_no = '" + billNo + "' ";

    ArrayList<ArrayList<String>> dataItem = conn.getData(querySelectItem);

    for (int i = 0; i < dataItem.size(); i++) {

        grandTotal += Double.parseDouble(dataItem.get(i).get(2));
        grandQuantity += Double.parseDouble(dataItem.get(i).get(3));

        if (dataItem.get(i).get(0).contains("BP") == true) {

        } else {

            subtotal += Double.parseDouble(dataItem.get(i).get(2));

        }
    }

    String querySelectMaster = "SELECT item_amt, amt_paid "
            + "FROM far_customer_hdr "
            + "WHERE bill_no = '" + billNo + "'";

    ArrayList<ArrayList<String>> dataMaster = conn.getData(querySelectMaster);

    grandTotal = Double.parseDouble(dataMaster.get(0).get(0));
    amtPaid = Double.parseDouble(dataMaster.get(0).get(1));

    double outstandingBalance = grandTotal - amtPaid;

    if ((outstandingBalance != 0) && (amtPaid != 0)) {

        subtotal = outstandingBalance;
        grandTotal = outstandingBalance;

    }

    grandTotal = Math.round(grandTotal * 20) / 20.0;
%>    


<br>


<div class="row">
    <!-- content goes here -->
    <form class="form-horizontal" id="manageBillDetailOrderDetailQuantityPriceFrom">

        <div class="col-md-8">
        </div>

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-5 control-label" for="textinput">Total Item Quantity :</label>
                <div class="col-md-4">
                    <input id="manageBillDetailOrderDetailTotalQuantity" name="manageBillDetailOrderDetailTotalQuantity" type="text" placeholder="Total Quantity" class="form-control input-md" maxlength="50" value="<%=grandQuantity%>" readonly>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-5 control-label" for="textinput">Grand Total (RM) :</label>
                <div class="col-md-4">
                    <input id="manageBillDetailOrderDetailGrandTotal" name="manageBillDetailOrderDetailGrandTotal" type="text" placeholder="Grand Total (RM)" class="form-control input-md" maxlength="50" value="<%=df.format(grandTotal)%>" readonly>
                </div>
            </div>          

        </div>

    </form>
</div>


<br>
<hr/>


<div id="manageBillViewBillDetailsButtonRightDiv">
    <div class="col-lg-4 pull-left" style="margin-bottom: 10px; ">
        <input type="hidden" class="form-control" name="manageBillViewBillDetailsStatusHiddenForUse" id="manageBillViewBillDetailsStatusHiddenForUse" value="<%=status%>" readonly="true">
        <input type="hidden" class="form-control" name="manageBillViewBillDetailsTabIDHiddenForUse" id="manageBillViewBillDetailsTabIDHiddenForUse" readonly="true">
        <button id="manageBillViewBillDetailsCancelBtn" class="btn btn-default" style="float: left;"><i class="fa fa-times fa-lg" aria-hidden="true"></i>&nbsp; Cancel</button>
    </div>
    <div class="col-lg-8 pull-right" style="margin-bottom: 10px; ">
        <div class="pull-right" style="margin-bottom: 10px; ">
            <%
                if (status.equalsIgnoreCase("unpaid")) {
            %>
            <button class="btn btn-success" data-toggle="modal" data-target="#makePayment" style="float: right;" id="manageBillViewBillDetailsPaymentBtn" ><i class="fa fa-money fa-lg" aria-hidden="true"></i>&nbsp; Payment</button>
            <button id="manageBillViewBillDetailsAddBtn" class="btn btn-warning modal-toggle" data-toggle="modal" data-target="#addItemList" style="float: right; margin-right: 10px;"><i class="fa fa-plus fa-lg" aria-hidden="true"></i>&nbsp; Add Item</button>
            <button id="manageBillViewBillDetailsInvoicePrintBtn" class="btn btn-primary" style="float: right; margin-right: 10px;"><i class="fa fa-print fa-lg" aria-hidden="true"></i>&nbsp; Print Invoice</button>
            <button id="manageBillViewBillDetailsInvoiceMergeBtn" class="btn btn-primary modal-toggle" data-toggle="modal" data-target="#mergeItemList" style="float: right; margin-right: 10px;"><i class="fa fa-print fa-lg" aria-hidden="true"></i>&nbsp; Merge Invoice</button>
            <%} else {%>
            <button id="manageBillViewBillDetailsPrintBtn" class="btn btn-info" style="float: right;"><i class="fa fa-print fa-lg" aria-hidden="true"></i>&nbsp; Print Receipt</button>
            <%}%>
        </div>
    </div>
</div>



<div id="manageBillViewBillDetailsGenerateRecieptForPrint" class="hidden">

</div>

<div id="manageBillViewBillDetailsGenerateInvoiceForPrint" class="hidden">

</div>


<div id="manageBillViewBillDetailsGenerateMergedInvoiceForPrint" class="hidden">

</div>


<div class="modal" id="addItemList" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <ul id="tabs" class="nav nav-tabs col-md-12 custom-bullet">
                    <li class="active"><a data-toggle="tab" href="#tabMiscItem" id="tabMiscItemHead">Miscellaneous Item</a></li>
                    <li><a data-toggle="tab" href="#tabDrugsItem" id="tabDrugsItemHead">Drugs Item</a></li>
                    <li><a data-toggle="tab" href="#tabRISProcItem" id="tabRISProcsItemHead">RIS Procedure</a></li>
                    <li><a data-toggle="tab" href="#tabPOSProcItem" id="tabPOSProcsItemHead">POS Procedure</a></li>
                    <li><a data-toggle="tab" href="#tabLISProcItem" id="tabLISProcsItemHead">LIS Procedure</a></li>
                    <li><a data-toggle="tab" href="#tabOPTProcItem" id="tabOPTProcsItemHead">OPT Procedure</a></li>
                </ul>
            </div>
            <div class="modal-body scrollable-modal-body" style="max-height: 350px;overflow: auto; height: 350px;">
                <div class="sd-tabs sd-tab-interaction">
                    <div class="row">
                        <div class="tab-content col-md-12">

                            <div id="tabMiscItem" class="tab-pane active">
                                <!-- Misc Item -->
                                <div id="custom-search-input" style="margin-top: 10px;">
                                    <div class="form-group ">
                                        <label class="col-md-4 control-label" for="textinput">Enter Item Name to Filter</label>
                                        <div class="col-md-4">
                                            <input id="searchMiscItem" type="text" class=" search-query form-control" placeholder="Item Name" onkeyup="searchMiscItem()"/>
                                        </div>
                                    </div>
                                </div>
                                <div id="miscItem" ></div>
                            </div>


                            <div id="tabDrugsItem" class="tab-pane">
                                <!-- Drugs Item -->
                                <div id="custom-search-input" style="margin-top: 10px;">
                                    <div class="form-group ">
                                        <label class="col-md-4 control-label" for="textinput">Enter Item Name to Filter</label>
                                        <div class="col-md-4">
                                            <input id="searchDrugsItem" type="text" class=" search-query form-control" placeholder="Item Name" onkeyup="searchDrugsItem()"/>
                                        </div>
                                    </div>
                                </div>
                                <div id="drugsItem" ></div>                            
                            </div>


                            <div id="tabRISProcItem" class="tab-pane">
                                <!-- Drugs Item -->
                                <div id="custom-search-input" style="margin-top: 10px;">
                                    <div class="form-group ">
                                        <label class="col-md-4 control-label" for="textinput">Enter Item Name to Filter</label>
                                        <div class="col-md-4">
                                            <input id="searchRISProcItem" type="text" class=" search-query form-control" placeholder="Item Name" onkeyup="searchRISProcItem()"/>
                                        </div>
                                    </div>
                                </div>
                                <div id="RISProcItem" ></div>                            
                            </div>

                            <div id="tabPOSProcItem" class="tab-pane">
                                <!-- Drugs Item -->
                                <div id="custom-search-input" style="margin-top: 10px;">
                                    <div class="form-group ">
                                        <label class="col-md-4 control-label" for="textinput">Enter Item Name to Filter</label>
                                        <div class="col-md-4">
                                            <input id="searchPOSProcItem" type="text" class=" search-query form-control" placeholder="Item Name" onkeyup="searchPOSProcItem()"/>
                                        </div>
                                    </div>
                                </div>
                                <div id="POSProcItem" ></div>                            
                            </div>


                            <div id="tabLISProcItem" class="tab-pane">
                                <!-- Drugs Item -->
                                <div id="custom-search-input" style="margin-top: 10px;">
                                    <div class="form-group ">
                                        <label class="col-md-4 control-label" for="textinput">Enter Item Name to Filter</label>
                                        <div class="col-md-4">
                                            <input id="searchLISProcItem" type="text" class=" search-query form-control" placeholder="Item Name" onkeyup="searchLISProcItem()"/>
                                        </div>
                                    </div>
                                </div>
                                <div id="LISProcItem" ></div>                            
                            </div>


                            <div id="tabOPTProcItem" class="tab-pane">
                                <!-- Drugs Item -->
                                <div id="custom-search-input" style="margin-top: 10px;">
                                    <div class="form-group ">
                                        <label class="col-md-4 control-label" for="textinput">Enter Item Name to Filter</label>
                                        <div class="col-md-4">
                                            <input id="searchOPTProcItem" type="text" class=" search-query form-control" placeholder="Item Name" onkeyup="searchOPTProcItem()"/>
                                        </div>
                                    </div>
                                </div>
                                <div id="OPTProcItem" ></div>                            
                            </div>


                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button id="addMiscItem" type="button" class="btn btn-success" data-dismiss="modal">Add Item</button>
            </div>
        </div>
    </div>
</div>



<div class="modal fade" id="addQuantityModal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Quantity to Add</h4>
            </div>

            <div class="modal-body">
                <label class="col-lg-4">Quantity</label>
                <div class="col-lg-8" style="margin-bottom: 10px">
                    <input type="text" class="form-control" id="quantity" value="" style="text-align: center;">
                </div>
            </div>
            <div class="modal-footer">
                <button id="addDrugsItem" type="button" class="btn btn-success" data-dismiss="modal">Ok</button>
            </div>
        </div>
    </div>
</div>




<div class="modal fade" id="mergeItemList" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Merge Bill</h4>
            </div>

            <div class="modal-body">

                <label class="col-lg-4">Grand Total (RM):</label>
                <div class="col-lg-8" style="margin-bottom: 10px">
                    <input type="text" class="form-control" id="grandTotalMergedInvoice" value="<%=df.format(grandTotal)%>" disabled="true" style="text-align: center;">
                </div>

                <label class="col-lg-4">Enter Item Name :</label>
                <div class="col-lg-8" style="margin-bottom: 10px">
                    <input type="text" class="form-control" id="itemNameMergedInvoice" style="text-align: center;" maxlength="50">
                </div>

            </div>
            <div class="modal-footer">
                <button id="mergedInvoiceBtn" type="button" class="btn btn-success" data-dismiss="modal">Create Merged Bill</button>
            </div>
        </div>
    </div>
</div>





<div class="modal fade" id="makePayment" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Payment Calculator</h4>
            </div>

            <div class="modal-body">
                <label class="col-lg-4">Subtotal (RM):</label>
                <div class="col-lg-8" style="margin-bottom: 10px">
                    <input type="text" class="form-control" id="subtotal" value="<%=df.format(subtotal)%>" readonly="true" style="text-align: center;">
                </div>
                <label class="col-lg-4">Service Charge (RM):</label>
                <div class="col-lg-8" style="margin-bottom: 10px">
                    <input type="text" class="form-control" id="servicetotal" value="<%=df.format(subtotal - grandTotal)%>" readonly="true" style="text-align: center;">
                </div>
                <label class="col-lg-4">Grand Total (RM):</label>
                <div class="col-lg-8" style="margin-bottom: 10px">
                    <input type="text" class="form-control" id="grandTotal" value="<%=df.format(grandTotal)%>" readonly="true" style="text-align: center;">
                </div>
                <label class="col-lg-4">Payment Method</label>
                <div class="dropdown col-lg-8" style="margin-bottom: 10px">
                    <button id="paymentMethod" class="btn btn-primary dropdown-toggle form-control" type="button" data-toggle="dropdown">Cash</button>
                    <ul id="method" class="dropdown-menu">
                        <li><a>Cash</a></li>
                        <li><a>Credit Card</a></li>
                        <li><a>Cheque</a></li>
                    </ul>
                </div>
                <label class="col-lg-4">Amount Received (RM):</label>
                <div class="col-lg-8" style="margin-bottom: 10px">
                    <input type="number" class="form-control" id="amtReceived" max="9999999.99" min="0.01" step="0.01" style="text-align: center;">
                </div>
                <label class="col-lg-4">Change (RM):</label>
                <div class="col-lg-8" style="margin-bottom: 10px">
                    <input type="text" class="form-control" id="change" value="" readonly="true" style="text-align: center;">
                </div>
            </div>
            <div class="modal-footer">
                <button id="payment" type="button" class="btn btn-success" data-dismiss="modal">Make Payment</button>
            </div>
        </div>
    </div>
</div>



<script>


    // Search Misc Function Start
    function searchDrugsItem() {

        // Declare variables
        var input, filter, table, tr, td, i;

        input = document.getElementById("searchDrugsItem");
        filter = input.value.toUpperCase();
        table = document.getElementById("drugsItem");
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows, and hide those who don't match the search query
        for (i = 0; i < tr.length; i++) {

            td = tr[i].getElementsByTagName("td")[1];

            if (td) {

                if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {

                    tr[i].style.display = "";

                } else {

                    tr[i].style.display = "none";

                }

            }
        }

    }
    // Search Misc Function End


    // Search Drug Function Start
    function searchMiscItem() {

        // Declare variables
        var input, filter, table, tr, td, i;

        input = document.getElementById("searchMiscItem");
        filter = input.value.toUpperCase();
        table = document.getElementById("miscItem");
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows, and hide those who don't match the search query
        for (i = 0; i < tr.length; i++) {

            td = tr[i].getElementsByTagName("td")[1];

            if (td) {

                if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {

                    tr[i].style.display = "";

                } else {

                    tr[i].style.display = "none";

                }

            }
        }
    }
    // Search Drug Function End


    // Search RIS Procedure Function Start
    function searchRISProcItem() {

        // Declare variables
        var input, filter, table, tr, td, i;

        input = document.getElementById("searchRISProcItem");
        filter = input.value.toUpperCase();
        table = document.getElementById("RISProcItem");
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows, and hide those who don't match the search query
        for (i = 0; i < tr.length; i++) {

            td = tr[i].getElementsByTagName("td")[1];

            if (td) {

                if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {

                    tr[i].style.display = "";

                } else {

                    tr[i].style.display = "none";

                }

            }
        }
    }
    // Search RIS Procedure Function End


    // Search POS Procedure Function Start
    function searchPOSProcItem() {

        // Declare variables
        var input, filter, table, tr, td, i;

        input = document.getElementById("searchPOSProcItem");
        filter = input.value.toUpperCase();
        table = document.getElementById("POSProcItem");
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows, and hide those who don't match the search query
        for (i = 0; i < tr.length; i++) {

            td = tr[i].getElementsByTagName("td")[1];

            if (td) {

                if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {

                    tr[i].style.display = "";

                } else {

                    tr[i].style.display = "none";

                }

            }
        }
    }
    // Search POS Procedure Function End


    // Search LIS Procedure Function Start
    function searchLISProcItem() {

        // Declare variables
        var input, filter, table, tr, td, i;

        input = document.getElementById("searchLISProcItem");
        filter = input.value.toUpperCase();
        table = document.getElementById("LISProcItem");
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows, and hide those who don't match the search query
        for (i = 0; i < tr.length; i++) {

            td = tr[i].getElementsByTagName("td")[1];

            if (td) {

                if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {

                    tr[i].style.display = "";

                } else {

                    tr[i].style.display = "none";

                }

            }
        }
    }
    // Search LIS Procedure Function End


    // Search OPT Procedure Function Start
    function searchOPTProcItem() {

        // Declare variables
        var input, filter, table, tr, td, i;

        input = document.getElementById("searchOPTProcItem");
        filter = input.value.toUpperCase();
        table = document.getElementById("OPTProcItem");
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows, and hide those who don't match the search query
        for (i = 0; i < tr.length; i++) {

            td = tr[i].getElementsByTagName("td")[1];

            if (td) {

                if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {

                    tr[i].style.display = "";

                } else {

                    tr[i].style.display = "none";

                }

            }
        }
    }
    // Search OPT Procedure Function End



    $(document).ready(function () {



        // --------------------------------------------------------------- View Bill Method Clicking Function --------------------------------------------------------------- //


        // Payment Method Selection Function Start
        $('#method li a').click(function () {

            $('#paymentMethod').text($(this).text());

        });
        // Payment Method Selection Function End


        // --------------------------------------------------------------- View Bill Method Clicking Function --------------------------------------------------------------- //





        // --------------------------------------------------------------- View Bill Change Calculation Function --------------------------------------------------------------- //


        // Key Up Event For Change Calculation Start
        $('#amtReceived').keyup(function () {


            var amtReceived = $(this).val();
            var amtReceivedValid = document.getElementById('amtReceived').checkValidity();

            var grandTotal = document.getElementById('grandTotal').value;

            var change = 0;

            if (amtReceived === '.') {

                amtReceived = 0;

            } else if (amtReceivedValid === false) {

                bootbox.alert("Please Insert Amount That Is Between 0.01 To 9999999.99 !!!");

                $('#amtReceived').val('');

            }

            change = amtReceived - grandTotal;

            $('#change').val(change.toFixed(2));


        });
        // Key Up Event For Change Calculation End


        // --------------------------------------------------------------- View Bill Change Calculation Function --------------------------------------------------------------- //





        // --------------------------------------------------------------- View Bill Payment Function --------------------------------------------------------------- //


        // Key Up Event For Change Calculation Start
        $('#payment').click(function () {


            var subTotal = document.getElementById('subtotal').value;
            var grandTotal = document.getElementById('grandTotal').value;
            var amtReceived = document.getElementById('amtReceived').value;
            var paymentMethod = document.getElementById('paymentMethod').innerHTML;
            var custID = document.getElementById('custID').value;
            var billNo = document.getElementById('billNo').value;
            var change = document.getElementById('change').value;
            var txnDate = document.getElementById('txnDate').value;


            if (amtReceived === '0' || amtReceived === '.' || amtReceived === '') {

                bootbox.alert("Please insert an amount first !!!");

            } else {


                var data = {
                    subTotal: subTotal,
                    grandTotal: grandTotal,
                    amtReceived: amtReceived,
                    paymentMethod: paymentMethod,
                    custID: custID,
                    billNo: billNo,
                    txnDate: txnDate,
                    change: change
                };


                bootbox.confirm({
                    message: "Are you sure want to confirm payment this item ?",
                    title: "Confirm Payment ?",
                    buttons: {
                        confirm: {
                            label: 'Yes',
                            className: 'btn-success'
                        },
                        cancel: {
                            label: 'No',
                            className: 'btn-danger'
                        }
                    },
                    callback: function (result) {

                        if (result === true) {

                            $('<div class="loading">Loading</div>').appendTo('body');

                            $.ajax({
                                url: "controllerProcessManageBill/manageBillGenerateBillDetailUnpaidPaidMakePayment.jsp",
                                type: "post",
                                data: data,
                                timeout: 10000,
                                success: function (datas) {

                                    console.log(datas);

                                    var aD = datas.trim();
                                    var d = aD.split("|");

                                    if (d[1] === "1") {


                                        document.getElementById('messageHeader').innerHTML = "Success!";
                                        document.getElementById('messageContent').innerHTML = d[2];

                                        $("#alertMessage").modal();

                                        dissableButtonForPage();

                                        $('.loading').hide();

                                        $('.nav-tabs a[href="#tab_default_1"]').tab('show');

                                        sendToEmailForBillTransaction();
                                        generateRecieptForBillTransaction();


                                    } else {

                                        document.getElementById('messageHeader').innerHTML = "Failed!";
                                        document.getElementById('messageContent').innerHTML = d[2];

                                        $("#alertMessage").modal();

                                        $('.loading').hide();

                                    }

                                },
                                error: function (err) {

                                    document.getElementById('messageHeader').innerHTML = "Error!";
                                    document.getElementById('messageContent').innerHTML = "Failed to make payment.\nPlease try again.";

                                    $("#alertMessage").modal();

                                    $('.loading').hide();

                                }
                            });
                        } else {

                            console.log("Process Is Canceled");

                        }

                    }
                });
            }

        });
        // Key Up Event For Change Calculation End


        // --------------------------------------------------------------- View Bill Payment Function --------------------------------------------------------------- //





        // --------------------------------------------------------------- Merge Bill Payment Function --------------------------------------------------------------- //



        $('#manageBillViewBillDetailsInvoiceMergeBtn').click(function () {

            $('#itemNameMergedInvoice').val('');

        });


        // Merge Bill Function Start
        $('#mergedInvoiceBtn').click(function () {


            var itemName = document.getElementById('itemNameMergedInvoice').value;
            var grandTotal = document.getElementById('grandTotalMergedInvoice').value;
            var custID = document.getElementById('custID').value;
            var billNo = document.getElementById('billNo').value;
            var pName = $('#patientName').val();
            var address = $('#address').val();
            var icNo = $('#ic').val();


            if (itemName === '' || itemName === null) {

                bootbox.alert("Please insert Item Name first !!!");

            } else {


                $('<div class="loading">Loading</div>').appendTo('body');

                $.ajax({
                    url: "controllerProcessManageBill/manageBillGenerateBillDetailUnpaidPaidGetInvoiceNoN.jsp",
                    type: "get",
                    timeout: 10000,
                    success: function (dataInvoiceNo) {

                        var dataRefresh = {
                            billNo: billNo,
                            grandTotal: grandTotal,
                            custID: custID,
                            icNo: icNo,
                            pName: pName,
                            address: address,
                            itemName: itemName,
                            invoive: dataInvoiceNo.trim()
                        };

                        console.log(dataRefresh);

                        $.ajax({
                            url: "controllerProcessManageBill/manageBillGenerateBillDetailUnpaidPaidGetRecieptForMerge.jsp",
                            type: "post",
                            data: dataRefresh,
                            timeout: 10000,
                            success: function (data) {


                                $('#manageBillViewBillDetailsGenerateMergedInvoiceForPrint').html(data);


                                setTimeout(function () {


                                    var printDiv = $("#manageBillViewBillDetailsGenerateMergedInvoiceForPrint").html().trim();

                                    var printWindow = window.open('', 'Print Reciept');

                                    printWindow.document.write('<html><head><title>Reciept</title>');
                                    printWindow.document.write('</head><body >');
                                    printWindow.document.write(printDiv);
                                    printWindow.document.write('</body></html>');
                                    printWindow.document.close();
                                    printWindow.focus();
                                    printWindow.print();
                                    printWindow.close();


                                    resetTableBillMasterOrderList();

                                    $('.loading').hide();

                                }, 1500);




                            },
                            error: function (err) {

                            }
                        });


                    },
                    error: function (err) {

                    }
                });


            }

        });
        // Key Up Event For Change Calculation End


        // --------------------------------------------------------------- Merge Bill Payment Function --------------------------------------------------------------- //






        // --------------------------------------------------------------- View Bill Add Function --------------------------------------------------------------- //



        // Add Function Add Item Button Initialize Start
        $('#manageBillViewBillDetailsAddBtn').click(function (e) {

            e.preventDefault();


            $('#miscItem').load('controllerProcessManageBill/manageBillGenerateBillDetailUnpaidPaidMiscList.jsp');

            $('#manageBillViewBillDetailsTabIDHiddenForUse').val('tableMisc');

        });
        // Add Function Add Item Button Initialize End


        // Add Function Initialize Misc Start
        $('#addItemList').off('click', '#tabMiscItemHead').on('click', '#tabMiscItemHead', function (e) {

            e.preventDefault();

            $('<div class="loading">Loading</div>').appendTo('body');

            console.log("Load Misc");

            $('#miscItem').load('controllerProcessManageBill/manageBillGenerateBillDetailUnpaidPaidMiscList.jsp');

            $('#manageBillViewBillDetailsTabIDHiddenForUse').val('tableMisc');

            $('#searchMiscItem').val('');

            $('#drugsItem').html('');
            $('#RISProcItem').html('');
            $('#POSProcItem').html('');
            $('#LISProcItem').html('');
            $('#OPTProcItem').html('');


        });
        // Add Function Initialize Misc End


        // Add Function Initialize Drug Start
        $('#addItemList').off('click', '#tabDrugsItemHead').on('click', '#tabDrugsItemHead', function (e) {

            e.preventDefault();

            $('<div class="loading">Loading</div>').appendTo('body');

            console.log("Load Drug");

            $('#miscItem').html('');
            $('#RISProcItem').html('');
            $('#POSProcItem').html('');
            $('#LISProcItem').html('');
            $('#OPTProcItem').html('');

            $('#searchDrugsItem').val('');

            $('#drugsItem').load('controllerProcessManageBill/manageBillGenerateBillDetailUnpaidPaidDrugList.jsp');

            $('#manageBillViewBillDetailsTabIDHiddenForUse').val('tableDrugsItem');


        });
        // Add Function Initialize Drug End


        // Add Function Initialize RIS Proc Start
        $('#addItemList').off('click', '#tabRISProcsItemHead').on('click', '#tabRISProcsItemHead', function (e) {

            e.preventDefault();

            $('<div class="loading">Loading</div>').appendTo('body');

            console.log("Load RIS Proc");

            $('#miscItem').html('');
            $('#drugsItem').html('');
            $('#POSProcItem').html('');
            $('#LISProcItem').html('');
            $('#OPTProcItem').html('');

            $('#searchRISProcItem').val('');

            $('#RISProcItem').load('controllerProcessManageBill/manageBillGenerateBillDetailUnpaidPaidRadioProList.jsp');

            $('#manageBillViewBillDetailsTabIDHiddenForUse').val('tableRISProc');


        });
        // Add Function Initialize RIS Proc End


        // Add Function Initialize POS Proc Start
        $('#addItemList').off('click', '#tabPOSProcsItemHead').on('click', '#tabPOSProcsItemHead', function (e) {

            e.preventDefault();

            $('<div class="loading">Loading</div>').appendTo('body');

            console.log("Load POS Proc");

            $('#miscItem').html('');
            $('#drugsItem').html('');
            $('#RISProcItem').html('');
            $('#LISProcItem').html('');
            $('#OPTProcItem').html('');

            $('#searchPOSProcItem').val('');

            $('#POSProcItem').load('controllerProcessManageBill/manageBillGenerateBillDetailUnpaidPaidPOSProList.jsp');

            $('#manageBillViewBillDetailsTabIDHiddenForUse').val('tablePOSProc');


        });
        // Add Function Initialize POS Proc End


        // Add Function Initialize LIS Proc Start
        $('#addItemList').off('click', '#tabLISProcsItemHead').on('click', '#tabLISProcsItemHead', function (e) {

            e.preventDefault();

            $('<div class="loading">Loading</div>').appendTo('body');

            console.log("Load LIS Proc");

            $('#miscItem').html('');
            $('#drugsItem').html('');
            $('#RISProcItem').html('');
            $('#POSProcItem').html('');
            $('#OPTProcItem').html('');

            $('#searchLISProcItem').val('');

            $('#LISProcItem').load('controllerProcessManageBill/manageBillGenerateBillDetailUnpaidPaidLabProList.jsp');

            $('#manageBillViewBillDetailsTabIDHiddenForUse').val('tableLISProc');


        });
        // Add Function Initialize LIS Proc End


        // Add Function Initialize OPT Proc Start
        $('#addItemList').off('click', '#tabOPTProcsItemHead').on('click', '#tabOPTProcsItemHead', function (e) {

            e.preventDefault();

            //$('<div class="loading">Loading</div>').appendTo('body');


            console.log("Load OPT Proc");

            $('#miscItem').html('');
            $('#drugsItem').html('');
            $('#RISProcItem').html('');
            $('#POSProcItem').html('');
            $('#LISProcItem').html('');

            $('#searchOPTProcItem').val('');

            //$('#OPTProcItem').load('controllerProcessManageBill/manageBillGenerateBillDetailUnpaidPaidOperationProList.jsp');

            $('#manageBillViewBillDetailsTabIDHiddenForUse').val('tableOPTProc');


        });
        // Add Function Initialize OPT Proc End


        // Add Item To Detail M Category Start
        $('#addItemList').off('click', '#addMiscItem').on('click', '#addMiscItem', function (e) {

            e.preventDefault();


            var selected = $('.modal-body').find('.row_selected').text();
            var activeTab = $('ul#tabs').find('li.active').text();
            var activeTabName = $('#manageBillViewBillDetailsTabIDHiddenForUse').val();


            if (selected === '') {

                bootbox.alert("Please Select An Item To Be Added To The Bill Details List !!!");

            } else {

                $('<div class="loading">Loading</div>').appendTo('body');

                var itemCode = $('#' + activeTabName).find(".row_selected td:nth-child(1)").text();
                var itemName = $('#' + activeTabName).find(".row_selected td:nth-child(2)").text();
                var unitPrice = $('#' + activeTabName).find(".row_selected td:nth-child(3)").text();
                var custID = document.getElementById('custID').value;
                var billNo = document.getElementById('billNo').value;
                var txn_date = document.getElementById('txnDate').value;
                var ref_order_no = document.getElementById('billNo').value;
                var billNo = $('#billNo').val();
                var txtDate = $('#txnDate').val();
                var custID = $('#custID').val();
                var pName = $('#patientName').val();
                var address = $('#address').val();
                var icNo = $('#ic').val();
                var otherID = $('#otherID').val();
                var phoneNo = $('#phone').val();
                var status = $('#dataManageBillMasterOrderListhiddenStatus').val();
                var overallItmAmnt = $('#manageBillDetailOrderDetailGrandTotal').val();


                var dataRefresh = {
                    billNo: billNo,
                    txtDate: txtDate,
                    custID: custID,
                    pName: pName,
                    address: address,
                    icNo: icNo,
                    otherID: otherID,
                    phoneNo: phoneNo,
                    status: status
                };


                if (activeTab === 'Miscellaneous Item' || activeTab === 'RIS Procedure' || activeTab === 'POS Procedure' || activeTab === 'LIS Procedure' || activeTab === 'OPT Procedure') {


                    var dataAdd = {
                        itemCode: itemCode,
                        itemName: itemName,
                        unitPrice: unitPrice,
                        custID: custID,
                        billNo: billNo,
                        txn_date: txn_date,
                        ref_order_no: ref_order_no,
                        overallItmAmnt: overallItmAmnt,
                        itemType: 'M'
                    };


                    console.log(dataAdd);
                    console.log(dataRefresh);


                    $.ajax({
                        url: "controllerProcessManageBill/manageBillGenerateBillDetailUnpaidPaidInsert.jsp",
                        type: "post",
                        data: dataAdd,
                        timeout: 10000,
                        success: function (data) {

                            console.log(data);

                            var d = data.split("|");


                            if (d[1] === '1') {


                                document.getElementById('messageHeader').innerHTML = "Success!";
                                document.getElementById('messageContent').innerHTML = d[2];


                                $.ajax({
                                    url: "controllerProcessManageBill/manageBillGenerateBillDetailUnpaidPaid.jsp",
                                    type: "post",
                                    data: dataRefresh,
                                    timeout: 10000,
                                    success: function (data) {

                                        $('#manageBillDetailOrderDetailContent').html(data);

                                        $('.nav-tabs a[href="#tab_default_2"]').tab('show');

                                        $('.loading').hide();

                                    },
                                    error: function (err) {
                                    }
                                });

                                $("#alertMessage").modal();

                            } else {

                                document.getElementById('messageHeader').innerHTML = "Failed!";
                                document.getElementById('messageContent').innerHTML = d[2];

                                $("#alertMessage").modal();

                            }


                        },
                        error: function (err) {

                            document.getElementById('messageHeader').innerHTML = "Error!";
                            document.getElementById('messageContent').innerHTML = "Failed to add item.\nPlease try again.";

                            $("#alertMessage").modal();

                        }
                    });


                } else if (activeTab === 'Drugs Item') {

                    $('.loading').hide();

                    $('#addQuantityModal').modal('show');

                }
            }

        });
        // Add Item To Detail M Category End


        // Add Item To Detail D Category Start
        $('#addQuantityModal').off('click', '#addDrugsItem').on('click', '#addDrugsItem', function (e) {

            e.preventDefault();


            var quantity = document.getElementById('quantity').value;


            if (quantity === '' || quantity === '0') {

                bootbox.alert("Please enter a quantity.");

            } else {


                $('#addQuantityModal').modal('hide');

                $('<div class="loading">Loading</div>').appendTo('body');

                var itemCode = $('#tableDrugsItem').find(".row_selected td:nth-child(1)").text();
                var itemName = $('#tableDrugsItem').find(".row_selected td:nth-child(2)").text();
                var unitPrice = $('#tableDrugsItem').find(".row_selected td:nth-child(4)").text();
                var custID = document.getElementById('custID').value;
                var billNo = document.getElementById('billNo').value;
                var txn_date = document.getElementById('txnDate').value;
                var ref_order_no = document.getElementById('billNo').value;

                var billNo = $('#billNo').val();
                var txtDate = $('#txnDate').val();
                var custID = $('#custID').val();
                var pName = $('#patientName').val();
                var address = $('#address').val();
                var icNo = $('#ic').val();
                var otherID = $('#otherID').val();
                var phoneNo = $('#phone').val();
                var status = $('#dataManageBillMasterOrderListhiddenStatus').val();
                var overallItmAmnt = $('#manageBillDetailOrderDetailGrandTotal').val();


                var dataRefresh = {
                    billNo: billNo,
                    txtDate: txtDate,
                    custID: custID,
                    pName: pName,
                    address: address,
                    icNo: icNo,
                    otherID: otherID,
                    phoneNo: phoneNo,
                    status: status
                };


                var dataAdd = {
                    itemCode: itemCode,
                    itemName: itemName,
                    unitPrice: unitPrice,
                    custID: custID,
                    billNo: billNo,
                    txn_date: txn_date,
                    ref_order_no: ref_order_no,
                    overallItmAmnt: overallItmAmnt,
                    quantity: quantity,
                    itemType: 'D'
                };


                console.log(dataAdd);
                console.log(dataRefresh);


                $.ajax({
                    url: "controllerProcessManageBill/manageBillGenerateBillDetailUnpaidPaidInsert.jsp",
                    type: "post",
                    data: dataAdd,
                    timeout: 10000,
                    success: function (data) {

                        console.log(data);

                        var d = data.split("|");


                        if (d[1] === '1') {

                            document.getElementById('messageHeader').innerHTML = "Success!";
                            document.getElementById('messageContent').innerHTML = d[2];


                            $.ajax({
                                url: "controllerProcessManageBill/manageBillGenerateBillDetailUnpaidPaid.jsp",
                                type: "post",
                                data: dataRefresh,
                                timeout: 10000,
                                success: function (data) {

                                    $('#manageBillDetailOrderDetailContent').html(data);

                                    $('.nav-tabs a[href="#tab_default_2"]').tab('show');

                                    $('.loading').hide();

                                    $("#alertMessage").modal();

                                },
                                error: function (err) {
                                }
                            });

                            $('.modal-backdrop').hide();

                        } else {

                            document.getElementById('messageHeader').innerHTML = "Failed!";
                            document.getElementById('messageContent').innerHTML = d[2];

                            $("#alertMessage").modal();

                        }

                    },
                    error: function (err) {

                        document.getElementById('messageHeader').innerHTML = "Error!";
                        document.getElementById('messageContent').innerHTML = "Failed to add item.\nPlease try again.";

                        $("#alertMessage").modal();

                    }
                });
            }
        });
        // Add Item To Detail D Category End





        // --------------------------------------------------------------- View Bill Add Function --------------------------------------------------------------- //






        // --------------------------------------------------------------- View Bill Generate Reciept Function --------------------------------------------------------------- //




        // Print DIV Invoice Button Start
        $('#manageBillViewBillDetailsButtonRightDiv').on('click', '#manageBillViewBillDetailsInvoicePrintBtn', function () {


            console.log("Printing Invoice Button");

            generateInvoiceForBillTransaction();


        });
        // Print DIV Invoice Button End


        // Print DIV Reciept Function Start
        function generateInvoiceForBillTransaction() {

            console.log("Printing Invoice");


            $('<div class="loading">Loading</div>').appendTo('body');


            var billNo = $('#billNo').val();
            var txtDate = $('#txnDate').val();
            var custID = $('#custID').val();
            var pName = $('#patientName').val();
            var address = $('#address').val();
            var icNo = $('#ic').val();
            var otherID = $('#otherID').val();
            var phoneNo = $('#phone').val();
            var status = $('#dataManageBillMasterOrderListhiddenStatus').val();

            $.ajax({
                url: "controllerProcessManageBill/manageBillGenerateBillDetailUnpaidPaidGetInvoiceNoN.jsp",
                type: "get",
                timeout: 10000,
                success: function (dataInvoiceNo) {

                    var dataRefresh = {
                        billNo: billNo,
                        txtDate: txtDate,
                        custID: custID,
                        pName: pName,
                        address: address,
                        icNo: icNo,
                        otherID: otherID,
                        phoneNo: phoneNo,
                        status: status,
                        invoive: dataInvoiceNo.trim()
                    };


                    $.ajax({
                        url: "controllerProcessManageBill/manageBillGenerateBillDetailUnpaidPaidGetInvoiceForItem.jsp",
                        type: "post",
                        data: dataRefresh,
                        timeout: 10000,
                        success: function (data) {


                            $('#manageBillViewBillDetailsGenerateInvoiceForPrint').html(data);


                            setTimeout(function () {


                                var printDiv = $("#manageBillViewBillDetailsGenerateInvoiceForPrint").html().trim();

                                var printWindow = window.open('', 'Print Reciept');

                                printWindow.document.write('<html><head><title>Reciept</title>');
                                printWindow.document.write('</head><body >');
                                printWindow.document.write(printDiv);
                                printWindow.document.write('</body></html>');
                                printWindow.document.close();
                                printWindow.focus();
                                printWindow.print();
                                printWindow.close();


                                resetTableBillMasterOrderList();

                                $('.loading').hide();

                            }, 1500);




                        },
                        error: function (err) {

                        }
                    });


                },
                error: function (err) {

                }
            });

        }
        // Print DIV Invoice Function End



        // Print DIV Reciept Button Start
        $('#manageBillViewBillDetailsButtonRightDiv').on('click', '#manageBillViewBillDetailsPrintBtn', function () {


            console.log("Printing Reciept Button");

            generateRecieptForBillTransaction();


        });
        // Print DIV Reciept Button End



        // Print DIV Reciept Function Start
        function generateRecieptForBillTransaction() {


            console.log("Printing Reciept");


            $('<div class="loading">Loading</div>').appendTo('body');


            var billNo = $('#billNo').val();
            var txtDate = $('#txnDate').val();
            var custID = $('#custID').val();
            var pName = $('#patientName').val();
            var address = $('#address').val();
            var icNo = $('#ic').val();
            var otherID = $('#otherID').val();
            var phoneNo = $('#phone').val();
            var status = $('#dataManageBillMasterOrderListhiddenStatus').val();


            $.ajax({
                url: "controllerProcessManageBill/manageBillGenerateBillDetailUnpaidPaidGetRecieptNoN.jsp",
                type: "get",
                timeout: 10000,
                success: function (dataRecieptNo) {

                    var dataRefresh = {
                        billNo: billNo,
                        txtDate: txtDate,
                        custID: custID,
                        pName: pName,
                        address: address,
                        icNo: icNo,
                        otherID: otherID,
                        phoneNo: phoneNo,
                        status: status,
                        reciept: dataRecieptNo.trim()
                    };


                    $.ajax({
                        url: "controllerProcessManageBill/manageBillGenerateBillDetailUnpaidPaidGetRecieptForItem.jsp",
                        type: "post",
                        data: dataRefresh,
                        timeout: 10000,
                        success: function (data) {


                            $('#manageBillViewBillDetailsGenerateRecieptForPrint').html(data);


                            setTimeout(function () {


                                var printDiv = $("#manageBillViewBillDetailsGenerateRecieptForPrint").html().trim();

                                var printWindow = window.open('', 'Print Reciept');

                                printWindow.document.write('<html><head><title>Reciept</title>');
                                printWindow.document.write('</head><body >');
                                printWindow.document.write(printDiv);
                                printWindow.document.write('</body></html>');
                                printWindow.document.close();
                                printWindow.focus();
                                printWindow.print();
                                printWindow.close();


                                resetTableBillMasterOrderList();

                                $('.loading').hide();

                            }, 1500);




                        },
                        error: function (err) {

                        }
                    });


                },
                error: function (err) {

                }
            });


        }
        // Print DIV Reciept Function End




        // --------------------------------------------------------------- View Bill Generate Reciept Function --------------------------------------------------------------- //





        // --------------------------------------------------------------- Send Detail To Email Function --------------------------------------------------------------- //



        function sendToEmailForBillTransaction() {


            console.log("In Email Function...");


            var billNo = $('#billNo').val();
            var customerNo = $('#custID').val();

            var data = {
                billNo: billNo,
                customerNo: customerNo
            };

            $.ajax({
                url: "controllerProcessManageBill/manageBillGenerateBillDetailUnpaidPaidMakePaymentEmailer.jsp",
                type: "post",
                data: data,
                timeout: 10000,
                success: function (datas) {

                    console.log(datas.trim());

                },
                error: function (err) {

                }
            });
        }




        // --------------------------------------------------------------- Send Detail To Email Function --------------------------------------------------------------- //





        // --------------------------------------------------------------- View Bill Reset Table Function --------------------------------------------------------------- //



        // Reset Function for Table Start
        function resetTableBillMasterOrderList() {

            $("#manageBillMasterOrderListContent").html('<table class="table table-bordered" id="manageBillMasterOrderListTable" style="width: 100%">\n\
                        <thead>\n\
                             <th>Transaction Date</th>\n\
                            <th>Bill No.</th>\n\
                            <th>Customer ID</th>\n\
                            <th>Name</th>\n\
                            <th>IC No.</th>\n\
                            <th>Other ID</th>\n\
                            <th>Phone No.</th>\n\
                            <th>Outstanding (RM)</th>\n\
                            <th>Action</th>\n\
                        </thead>\n\
                        <tbody>\n\
                            <tr>\n\
                                <td colspan="9" align="center">No Record To Show<br>Please Select Correct Filter And Press Refresh Button</td>\n\
                            </tr>\n\
                        </tbody>\n\
                </table>');

            $('#freqObservationChartSelectAssessment').prop('selectedIndex', 0);

        }
        // Reset Function for Table End



        // --------------------------------------------------------------- View Bill Reset Table Function --------------------------------------------------------------- //




        // --------------------------------------------------------------- Disable Button Function --------------------------------------------------------------- //



        // Reset Button Function Start
        function dissableButtonForPage() {

            $('#manageBillViewBillDetailsCancelBtn').prop('disabled', true);
            $('#manageBillViewBillDetailsAddBtn').prop('disabled', true);
            $('#manageBillViewBillDetailsPrintBtn').prop('disabled', true);
            $('#manageBillViewBillDetailsPaymentBtn').prop('disabled', true);
            $("#tableItems").find("button").attr("disabled", "disabled");

        }
        // Reset Button Function End


        // --------------------------------------------------------------- Disable Button Function --------------------------------------------------------------- //




    });




</script>