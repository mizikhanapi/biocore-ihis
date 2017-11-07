<%-- 
    Document   : manageBillGenerateBillDetailUnpaidPaid
    Created on : Oct 25, 2017, 8:51:42 PM
    Author     : Shammugam
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="dbConn1.Conn"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="main.RMIConnector"%>

<%

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
                    ArrayList<ArrayList<String>> dataBill = Conn.getData(query2);

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

    String query3 = "SELECT item_cd, item_desc, item_amt, quantity "
            + "FROM far_customer_dtl "
            + "WHERE bill_no = '" + billNo + "' ";
    ArrayList<ArrayList<String>> data1 = Conn.getData(query3);

    for (int i = 0; i < data1.size(); i++) {
        grandTotal += Double.parseDouble(data1.get(i).get(2));
        grandQuantity += Double.parseDouble(data1.get(i).get(3));
        if (data1.get(i).get(0).contains("BP") == true) {
        } else {
            subtotal += Double.parseDouble(data1.get(i).get(2));
        }
    }

    String query4 = "SELECT item_amt, amt_paid "
            + "FROM far_customer_hdr "
            + "WHERE bill_no = '" + billNo + "'";
    ArrayList<ArrayList<String>> data2 = Conn.getData(query4);
    grandTotal = Double.parseDouble(data2.get(0).get(0));
    amtPaid = Double.parseDouble(data2.get(0).get(1));

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
                <label class="col-md-5 control-label" for="textinput">Total Quantity :</label>
                <div class="col-md-4">
                    <input id="manageBillDetailOrderDetailTotalQuantity" name="manageBillDetailOrderDetailTotalQuantity" type="text" placeholder="Total Quantity" class="form-control input-md" maxlength="50" value="<%=dfQuan.format(grandQuantity)%>" readonly>
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
        <button id="manageBillViewBillDetailsCancelBtn" class="btn btn-warning" style="float: left;"><i class="fa fa-times fa-lg" aria-hidden="true"></i>&nbsp; Cancel</button>
    </div>
    <div class="col-lg-8 pull-right" style="margin-bottom: 10px; ">
        <label class="col-lg-8"></label>
        <div class="col-lg-4 pull-right" style="margin-bottom: 10px; ">
            <%
                if (status.equalsIgnoreCase("unpaid")) {
            %>
            <button class="btn btn-success" data-toggle="modal" data-target="#makePayment" style="float: right;" id="manageBillViewBillDetailsPaymentBtn" ><i class="fa fa-money fa-lg" aria-hidden="true"></i>&nbsp; Payment</button>
            <button id="manageBillViewBillDetailsAddBtn" class="btn btn-success modal-toggle" data-toggle="modal" data-target="#addItemList" style="float: right; margin-right: 10px;"><i class="fa fa-plus fa-lg" aria-hidden="true"></i>&nbsp; Add Item</button>
            <%} else {%>
            <button id="manageBillViewBillDetailsPrintBtn" class="btn btn-info" style="float: right;"><i class="fa fa-print fa-lg" aria-hidden="true"></i>&nbsp; Print Receipt</button>
            <%}%>
        </div>
    </div>
</div>

<%
    Conn con = new Conn();

    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");

    String queryLogo = "SELECT logo, hfc_name, CONCAT(address1,' ',address2,' ',address3) FROM adm_health_facility WHERE hfc_cd='" + hfc_cd + "';";
    ArrayList<ArrayList<String>> dataLogo = con.getData(queryLogo);

    LocalDate localDate = LocalDate.now();
    String newdate = DateTimeFormatter.ofPattern("dd/MM/yyyy").format(localDate);
    DateFormat dateFormat1 = new SimpleDateFormat("MMyyyy");
    Date date = new Date();
    String date1 = dateFormat1.format(date);

    String logoHFC = "";
    String nameHFC = "";
    String addressHFC = "";
    String receiptNo = "";
    int num = 1;

    if (dataLogo.size()
            > 0) {
        if (dataLogo.get(0).get(0) != null) {
            logoHFC = dataLogo.get(0).get(0);
            nameHFC = dataLogo.get(0).get(1);
            addressHFC = dataLogo.get(0).get(2);
        }
    }

    //Get the last sequence no of receipt
    String sqlLastSql = "SELECT last_seq_no "
            + "FROM far_last_seq_no "
            + "WHERE module_name = 'R' "
            + "FOR UPDATE";
    ArrayList<ArrayList<String>> dataLastSql = Conn.getData(sqlLastSql);

    String seqNo = dataLastSql.get(0).get(0);
    int seq = Integer.parseInt(seqNo);
    int currSeq = seq + 1;
    String currentSeq = Integer.toString(currSeq);

    //Update last sequance number of receipt
    String sqlUpdateLastSeq = "UPDATE far_last_seq_no "
            + "SET last_seq_no = '" + currentSeq + "' "
            + "WHERE module_name = 'R'";

    Conn.setData(sqlUpdateLastSeq);

    //Generate receipt no
    int length = (int) Math.log10(currSeq) + 1;
    String zero = "0";
    String tmpNum = currentSeq;

    int count;
    for (count = length;
            count < 10; count++) {
        tmpNum = zero + tmpNum;
    }

    receiptNo = tmpNum + date1;

%>


<div id="manageBillViewBillDetailsGenerateRecieptForPrint" class="hidden">

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
                    <input type="text" class="form-control" id="servicetotal" value="<%=df.format(grandTotal - subtotal)%>" readonly="true" style="text-align: center;">
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
    // Search RIS Procedure Function End



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
                                url: "manageBillGenerateBillDetailUnpaidPaidMakePayment.jsp",
                                type: "post",
                                data: data,
                                timeout: 10000,
                                success: function (data) {

                                    var aD = data.trim();
                                    var d = aD.split("|");

                                    if (d[1] === "1") {


                                        document.getElementById('messageHeader').innerHTML = "Success!";
                                        document.getElementById('messageContent').innerHTML = d[2];

                                        $("#alertMessage").modal();

                                        dissableButtonForPage();

                                        $('.loading').hide();

                                        $('.nav-tabs a[href="#tab_default_1"]').tab('show');

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





        // --------------------------------------------------------------- View Bill Add Function --------------------------------------------------------------- //



        // Add Function Add Item Button Initialize Start
        $('#manageBillViewBillDetailsAddBtn').click(function (e) {

            e.preventDefault();


            $('#miscItem').load('manageBillGenerateBillDetailUnpaidPaidMiscList.jsp');

            $('#manageBillViewBillDetailsTabIDHiddenForUse').val('tableMisc');

        });
        // Add Function Add Item Button Initialize End


        // Add Function Initialize Misc Start
        $('#addItemList').off('click', '#tabMiscItemHead').on('click', '#tabMiscItemHead', function (e) {

            e.preventDefault();


            console.log("Load Misc");

            $('#miscItem').load('manageBillGenerateBillDetailUnpaidPaidMiscList.jsp');

            $('#manageBillViewBillDetailsTabIDHiddenForUse').val('tableMisc');

            $('#searchMiscItem').val('');
            $('#drugsItem').html('');
            $('#RISProcItem').html('');
            $('#POSProcItem').html('');


        });
        // Add Function Initialize Misc End


        // Add Function Initialize Drug Start
        $('#addItemList').off('click', '#tabDrugsItemHead').on('click', '#tabDrugsItemHead', function (e) {

            e.preventDefault();


            console.log("Load Drug");

            $('#miscItem').html('');
            $('#RISProcItem').html('');
            $('#POSProcItem').html('');
            $('#searchDrugsItem').val('');

            $('#drugsItem').load('manageBillGenerateBillDetailUnpaidPaidDrugList.jsp');

            $('#manageBillViewBillDetailsTabIDHiddenForUse').val('tableDrugsItem');


        });
        // Add Function Initialize Drug End


        // Add Function Initialize RIS Proc Start
        $('#addItemList').off('click', '#tabRISProcsItemHead').on('click', '#tabRISProcsItemHead', function (e) {

            e.preventDefault();


            console.log("Load RIS Proc");

            $('#miscItem').html('');
            $('#drugsItem').html('');
            $('#POSProcItem').html('');
            $('#searchRISProcItem').val('');

            $('#RISProcItem').load('manageBillGenerateBillDetailUnpaidPaidRadioProList.jsp');

            $('#manageBillViewBillDetailsTabIDHiddenForUse').val('tableRISProc');


        });
        // Add Function Initialize RIS Proc End


        // Add Function Initialize POS Proc Start
        $('#addItemList').off('click', '#tabPOSProcsItemHead').on('click', '#tabPOSProcsItemHead', function (e) {

            e.preventDefault();


            console.log("Load POS Proc");

            $('#miscItem').html('');
            $('#drugsItem').html('');
            $('#RISProcItem').html('');
            $('#searchRISProcItem').val('');

            $('#POSProcItem').load('manageBillGenerateBillDetailUnpaidPaidPOSProList.jsp');

            $('#manageBillViewBillDetailsTabIDHiddenForUse').val('tablePOSProc');


        });
        // Add Function Initialize POS Proc End


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


                if (activeTab === 'Miscellaneous Item' || activeTab === 'RIS Procedure' || activeTab === 'POS Procedure') {


                    var dataAdd = {
                        itemCode: itemCode,
                        itemName: itemName,
                        unitPrice: unitPrice,
                        custID: custID,
                        billNo: billNo,
                        txn_date: txn_date,
                        ref_order_no: ref_order_no,
                        itemType: 'M'
                    };


                    console.log(dataAdd);
                    console.log(dataRefresh);


                    $.ajax({
                        url: "manageBillGenerateBillDetailUnpaidPaidInsert.jsp",
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
                                    url: "manageBillGenerateBillDetailUnpaidPaid.jsp",
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
                    quantity: quantity,
                    itemType: 'D'
                };


                console.log(dataAdd);
                console.log(dataRefresh);


                $.ajax({
                    url: "manageBillGenerateBillDetailUnpaidPaidInsert.jsp",
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
                                url: "manageBillGenerateBillDetailUnpaidPaid.jsp",
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



        // Print DIV Button Start
        $('#manageBillViewBillDetailsButtonRightDiv').on('click', '#manageBillViewBillDetailsPrintBtn', function () {


            console.log("Printing Button");

            generateRecieptForBillTransaction();


        });
        // Print DIV Button End


        // Print DIV Function Start
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


            $.ajax({
                url: "manageBillGenerateBillDetailUnpaidPaidGetRecieptForItem.jsp",
                type: "post",
                data: dataRefresh,
                timeout: 10000,
                success: function (data) {


                    $('#manageBillViewBillDetailsGenerateRecieptForPrint').html(data);


                    setTimeout(function () {


                        var printDiv = $("#manageBillViewBillDetailsGenerateRecieptForPrint").html().trim();

                        var printWindow = window.open('', 'Print Discahrge Letter');

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


        }
        // Print DIV Function End



        // --------------------------------------------------------------- View Bill Generate Reciept Function --------------------------------------------------------------- //






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