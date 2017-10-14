<%-- 
    Document   : billGenerateBillDetailGroup
    Created on : Oct 14, 2017, 12:36:46 PM
    Author     : Shammugam
--%>


<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="dbConn1.Conn"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="main.RMIConnector"%>

<%
    // Generate Date Format
    DateFormat dateFormat = new SimpleDateFormat("MMyyyy");
    Date date = new Date();
    String dateString = dateFormat.format(date);

    // Generate Time Format
    DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.0");
    LocalDateTime now = LocalDateTime.now();
    String txtTime = format.format(now);

    // Generate Decimal Format
    DecimalFormat df = new DecimalFormat("0.00");

    // Generate Parameter
    String pmiNo = request.getParameter("pmiNo");
    String icNo = request.getParameter("icNo");
    String detailsLongString = request.getParameter("longString");
    String test = "";

    // Variables
    double grandTotal;
    double rounding;
    double subtotal = 0;
    double gst = 0;
    double serviceCharge = 0;
    double discount = 0;
    double gstAmount = 0;
    double serviceChargeAmount = 0;
    double discountAmount = 0;

    //module name - > 
    //B = Billing
    //R = Receipt
    //I = Invoice
    String sqlSeqSelect = "SELECT last_seq_no "
            + "FROM far_last_seq_no "
            + "WHERE module_name = 'B' "
            + "FOR UPDATE";
    ArrayList<ArrayList<String>> dataSeqBill = Conn.getData(sqlSeqSelect);

    //Get last sequance number
    String seqNo = dataSeqBill.get(0).get(0);
    int seq = Integer.parseInt(seqNo);
    int currSeq = seq + 1;
    String currentSeq = Integer.toString(currSeq);

    //Update last sequance number
    String sqlSeqUpdate = "UPDATE far_last_seq_no "
            + "SET last_seq_no = '" + currentSeq + "' "
            + "WHERE module_name = 'B'";
    Conn.setData(sqlSeqUpdate);

    //Generate bill no
    int length = (int) Math.log10(currSeq) + 1;
    String zero = "0";
    String num = currentSeq;
    int count;
    for (count = length; count < 10; count++) {
        num = zero + num;
    }
    String billNo = num + dateString;

    // Get selected patient info
    //                                                  0               1               2           3           4                   5           6
    String sqlBillGeneratePatientDetails = "SELECT pb.pmi_no,UPPER(pb.patient_name),pb.new_ic_no,pb.id_no,pb.home_address,pb.mobile_phone,pb.id_type "
            // FROM SQL
            + " FROM pms_patient_biodata pb "
            // WHERE CONDITION
            + " WHERE pb.new_ic_no = '" + icNo + "' ";

    ArrayList<ArrayList<String>> dataBillGeneratePatientDetails = Conn.getData(sqlBillGeneratePatientDetails);

    // Get Master Bill Record
    String orders[] = detailsLongString.split("\\|");
    ArrayList<ArrayList<String>> dataBillGenerateMasterDetailsMain = new ArrayList<ArrayList<String>>();

    for (int i = 0; i < orders.length; i++) {

        String ordersDetails[] = orders[i].split("\\^");
        String masterPMINo = ordersDetails[0];
        String masterOrderNo = ordersDetails[1];
        String masterDate = ordersDetails[2];
        String masteric = ordersDetails[3];

        //                                                  0         1        2         3       4          5          
        String sqlBillGenerateMasterDetails = "SELECT customer_id,order_no,txn_date,item_desc,item_amt,quantity"
                // FROM SQL
                + " FROM far_order_master "
                // WHERE CONDITION
                + " WHERE customer_id = '" + masterPMINo + "' AND order_no = '" + masterOrderNo + "' ; ";

        ArrayList<ArrayList<String>> dataBillGenerateMasterDetailsDetails = Conn.getData(sqlBillGenerateMasterDetails);
        dataBillGenerateMasterDetailsMain.addAll(dataBillGenerateMasterDetailsDetails);

    }

    // Get Master Bill Record
    String items[] = detailsLongString.split("\\|");
    ArrayList<ArrayList<String>> dataBillGenerateMasterDetailsItems = new ArrayList<ArrayList<String>>();

    for (int i = 0; i < items.length; i++) {

        String ordersItems[] = items[i].split("\\^");
        String masterPMINo = ordersItems[0];
        String masterOrderNo = ordersItems[1];
        String masterDate = ordersItems[2];
        String masteric = ordersItems[3];

        // Item Details
        //                                          0               1               2           3           4                   5           6
        String sqlBillGenerateMasterDetailsItems = "SELECT pb.pmi_no,UPPER(pb.patient_name),pb.new_ic_no,pb.id_no,pb.home_address,pb.mobile_phone,pb.id_type,"
                //      7             8         9          10               11                      12                          13
                + " fd.order_no,fd.txn_date,fd.item_cd,fd.item_desc,IFNULL(fd.item_amt, 0),IFNULL(fd.quantity, 0),IFNULL(fd.item_amt/fd.quantity, 0) "
                // FROM SQL
                + " FROM far_order_master fm "
                // JOIN PMS SQL
                + " LEFT JOIN pms_patient_biodata pb ON (fm.customer_id = pb.PMI_NO)  "
                // JOIN FAR DETAIL SQL
                + " LEFT JOIN far_order_detail fd ON (fm.order_no = fd.order_no)  "
                // WHERE CONDITION
                + " WHERE pb.new_ic_no = '" + masteric + "' AND fm.order_no = '" + masterOrderNo + "' "
                + " AND fd.order_no = '" + masterOrderNo + "' ORDER BY fm.txn_date DESC;";

        ArrayList<ArrayList<String>> dataBillGenerateMasterDetailsSingle = Conn.getData(sqlBillGenerateMasterDetailsItems);
        dataBillGenerateMasterDetailsItems.addAll(dataBillGenerateMasterDetailsSingle);

    }

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
            <input type="text" class="form-control" name="txnDate" id="txnDate" value="<%=txtTime%>" readonly="true">
        </div>
        <label class="col-lg-2">Order No.</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" name="address" id="orderNo" value="<%=billNo%>" readonly="true">
        </div> 
        <label class="col-lg-2">IC No.</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" name="ic" id="ic" value="<%=dataBillGeneratePatientDetails.get(0).get(2)%>" readonly="true">
        </div>
        <label class="col-lg-2">Name</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" name="patientName" id="patientName" value="<%=dataBillGeneratePatientDetails.get(0).get(1)%>" readonly="true">
        </div>
        <label class="col-lg-2">Address</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" name="address" id="address" value="<%=dataBillGeneratePatientDetails.get(0).get(4)%>" readonly="true">
        </div>
        <label class="col-lg-2">PMI No.</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" name="address" id="pmiNo" value="<%=dataBillGeneratePatientDetails.get(0).get(0)%>" readonly="true">
        </div>  
        <label class="col-lg-2">Other ID</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" name="otherID" id="otherID" value="<%=dataBillGeneratePatientDetails.get(0).get(3)%>" readonly="true">
        </div>
        <label class="col-lg-2">Phone No.</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" name="phone" id="phone" value="<%=dataBillGeneratePatientDetails.get(0).get(5)%>" readonly="true">
        </div>
    </div>
</div>



<h5><b>Order Detail</b></h5>
<div>
    <div id="listOfMasterItems">
        <table id="tableMasterItems" class="table table-filter table-striped table-bordered">
            <thead>
            <th>Order No</th>
            <th>Episode Date</th>
            <th>Item Description</th>
            <th style="text-align: right;">Item Amount (RM)</th>
            <th style="text-align: right;">Quantity</th>
            </thead>
            <tbody>
                <%

                    for (int i = 0; i < dataBillGenerateMasterDetailsMain.size(); i++) {
                %>
                <tr>
                    <td><%=dataBillGenerateMasterDetailsMain.get(i).get(1)%></td>
                    <td><%=dataBillGenerateMasterDetailsMain.get(i).get(2)%></td>
                    <td><%=dataBillGenerateMasterDetailsMain.get(i).get(3)%></td>
                    <td style="text-align: right;"><%=df.format(Double.parseDouble(dataBillGenerateMasterDetailsMain.get(i).get(4)))%></td>
                    <td style="text-align: right;"><%=dataBillGenerateMasterDetailsMain.get(i).get(5)%></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

<hr/>

<h5><b>Bill Detail</b></h5>
<div>
    <div id="listOfItems">
        <table id="tableItems" class="table table-filter table-striped table-bordered">
            <thead>
            <th>Order No</th>
            <th>Date</th>
            <th>Item Code</th>
            <th>Item Description</th>
            <th style="text-align: right;">Item Quantity</th>
            <th style="text-align: right;">Unit Price (RM)</th>
            <th style="text-align: right;">Total Amount (RM)</th>
            </thead>
            <tbody>
                <%
                    for (int i = 0; i < dataBillGenerateMasterDetailsItems.size(); i++) {
                %>
                <tr>
                    <td><%=dataBillGenerateMasterDetailsItems.get(i).get(7)%></td>
                    <td><%=dataBillGenerateMasterDetailsItems.get(i).get(8)%></td>
                    <td><%=dataBillGenerateMasterDetailsItems.get(i).get(9)%></td>
                    <td><%=dataBillGenerateMasterDetailsItems.get(i).get(10)%></td>
                    <td style="text-align: right;"><%=dataBillGenerateMasterDetailsItems.get(i).get(12)%></td>
                    <td style="text-align: right;"><%=df.format(Double.parseDouble(dataBillGenerateMasterDetailsItems.get(i).get(13)))%></td>
                    <td style="text-align: right;"><%=df.format(Double.parseDouble(dataBillGenerateMasterDetailsItems.get(i).get(11)))%></td>
                </tr>
                <%
                        subtotal += Double.parseDouble(dataBillGenerateMasterDetailsItems.get(i).get(11));
                    }

                    //Search and add miscellaneous item to table.
                    String type = dataBillGenerateMasterDetailsItems.get(0).get(6);
                    if (type.equals("004")) {
                        type = "RG00001";
                    } else if (type.equals("005")) {
                        type = "RG00002";
                    } else if (type.equals("Foreigner")) {
                        type = "RG00003";
                    }

                    String sqlBillGenerateDetailsMisceItem = "SELECT * FROM far_miscellaneous_item WHERE item_code = '" + type + "'";
                    ArrayList<ArrayList<String>> dataBillGenerateDetailsMisceItem = Conn.getData(sqlBillGenerateDetailsMisceItem);
                    subtotal = subtotal + Double.parseDouble(dataBillGenerateDetailsMisceItem.get(0).get(4));
                %>
                <tr>
                    <td><%=billNo%></td>
                    <td><%=txtTime%></td>
                    <td><%=dataBillGenerateDetailsMisceItem.get(0).get(1)%></td>
                    <td><%=dataBillGenerateDetailsMisceItem.get(0).get(2)%></td>
                    <td style="text-align: right;">1.00</td>
                    <td style="text-align: right;"><%=df.format(Double.parseDouble(dataBillGenerateDetailsMisceItem.get(0).get(4)))%></td>
                    <td style="text-align: right;"><%=df.format(Double.parseDouble(dataBillGenerateDetailsMisceItem.get(0).get(4)))%></td>
                </tr>
                <%

                    //Search and add billing parameters
                    String sqlBillGenerateDetailsBillingParameters = "SELECT param_code, param_name, param_value FROM far_billing_parameter WHERE enable = 'yes'";
                    ArrayList<ArrayList<String>> dataBillGenerateDetailsBillingParameters = Conn.getData(sqlBillGenerateDetailsBillingParameters);

                    for (int i = 0; i < dataBillGenerateDetailsBillingParameters.size(); i++) {

                        if (dataBillGenerateDetailsBillingParameters.get(i).get(1).equalsIgnoreCase("gst")) {
                            gst = Double.parseDouble(dataBillGenerateDetailsBillingParameters.get(i).get(2));
                        } else if (dataBillGenerateDetailsBillingParameters.get(i).get(1).equalsIgnoreCase("service charge")) {
                            serviceCharge = Double.parseDouble(dataBillGenerateDetailsBillingParameters.get(i).get(2));
                        } else if (dataBillGenerateDetailsBillingParameters.get(i).get(1).equalsIgnoreCase("discount")) {
                            discount = Double.parseDouble(dataBillGenerateDetailsBillingParameters.get(i).get(2));
                        }

                    }

                    //Calculate grand total
                    discountAmount = subtotal * discount;
                    discountAmount = Double.parseDouble(df.format(discountAmount));
                    subtotal = subtotal - discountAmount;

                    serviceChargeAmount = subtotal * serviceCharge;
                    serviceChargeAmount = Double.parseDouble(df.format(serviceChargeAmount));
                    subtotal = subtotal + serviceChargeAmount;

                    gstAmount = subtotal * gst;
                    gstAmount = Double.parseDouble(df.format(gstAmount));
                    subtotal = subtotal + gstAmount;

                    //Round the grand total
                    grandTotal = subtotal;
                    grandTotal = Math.round(grandTotal * 20) / 20.0;

                    rounding = grandTotal - subtotal;
                    rounding = Double.parseDouble(df.format(rounding));

                    //display to bill details table
                    for (int i = 0; i < dataBillGenerateDetailsBillingParameters.size(); i++) {
                %>
                <tr>
                    <td><%=billNo%></td>
                    <td><%=txtTime%></td>
                    <td><%=dataBillGenerateDetailsBillingParameters.get(i).get(0)%></td>
                    <td><%=dataBillGenerateDetailsBillingParameters.get(i).get(1)%></td>
                    <td style="text-align: right;">1</td>
                    <%
                        if (dataBillGenerateDetailsBillingParameters.get(i).get(1).equalsIgnoreCase("gst")) {
                    %>
                    <td style="text-align: right;"><%=df.format(gstAmount)%></td>
                    <td style="text-align: right;"><%=df.format(gstAmount)%></td>
                    <%
                    } else if (dataBillGenerateDetailsBillingParameters.get(i).get(1).equalsIgnoreCase("service charge")) {
                    %>
                    <td style="text-align: right;"><%=df.format(serviceChargeAmount)%></td>
                    <td style="text-align: right;"><%=df.format(serviceChargeAmount)%></td>
                    <%
                    } else if (dataBillGenerateDetailsBillingParameters.get(i).get(1).equalsIgnoreCase("discount")) {
                    %>
                    <td style="text-align: right;"><%=df.format(discountAmount)%></td>
                    <td style="text-align: right;"><%=df.format(discountAmount)%></td>
                    <%
                            }
                        }
                    %>
            </tbody>
        </table>
    </div>
</div>

<br>
<hr/>

<div id="viewBillGenereteBillDetailsGroupButtonRightDiv">
    <div class="col-lg-4 pull-left" style="margin-bottom: 10px; ">
        <input id="grandTotal" type="hidden" value="<%=df.format(grandTotal)%>">
        <input id="dataBillDetailsOrderListGrandTotalValuehidden" type="hidden" value="">
        <button id="btnViewBillGenereteBillDetailsGroupCancelBtn" class="btn btn-warning" style="float: left;"><i class="fa fa-times fa-lg" aria-hidden="true"></i>&nbsp; Cancel</button>
    </div>
    <div class="col-lg-8 pull-right" style="margin-bottom: 10px; ">
        <button id="btnViewBillGenereteBillDetailsGroupConfirmBtn" class="btn btn-success" style="float: right; margin-right: 10px;" > <i class="fa fa-check fa-lg" aria-hidden="true"></i>&nbsp; Confirm</button>
    </div>
</div>

<hr/>