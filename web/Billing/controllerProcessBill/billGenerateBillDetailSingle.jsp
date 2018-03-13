<%-- 
    Document   : billGenerateBillDetailSingle
    Created on : Oct 12, 2017, 10:34:17 AM
    Author     : Shammugam
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="main.RMIConnector"%>

<%
    // Conn  
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = (String) session.getAttribute("DISCIPLINE_CODE");

    // Generate Decimal Format
    DecimalFormat df = new DecimalFormat("0.00");
    DecimalFormat dfQuan = new DecimalFormat("0");

    // Generate Parameter
    String orderNo = request.getParameter("orderNo");
    String pmiNo = request.getParameter("pmiNo");
    String icNo = request.getParameter("icNo");
    String pName = request.getParameter("pName");
    String txtDate = request.getParameter("txtDate");
    String address = request.getParameter("address");
    String phoneNo = request.getParameter("phoneNo");
    String otherID = request.getParameter("otherID");
    String billNo = request.getParameter("billNo");

    // Variables
    int subQuantity = 0;
    int grandQuantity;
    double grandTotal;
    double rounding;
    double subtotal = 0;
    double gst = 0;
    double serviceCharge = 0;
    double discount = 0;
    double gstAmount = 0;
    double serviceChargeAmount = 0;
    double discountAmount = 0;

    //Display selected patient bill info
    //                                          0               1               2           3           4                   5           6
    String sqlBillGenerateDetails = "SELECT pb.pmi_no,UPPER(pb.patient_name),pb.new_ic_no,pb.id_no,pb.home_address,pb.mobile_phone,pb.id_type,"
            //      7             8         9          10               11                      12                          13
            + " fd.order_no,fd.txn_date,fd.item_cd,fd.item_desc,IFNULL(fd.item_amt, 0),IFNULL(fd.quantity, 0),IFNULL(fd.item_amt/fd.quantity, 0) "
            // FROM SQL
            + " FROM far_order_master fm "
            // JOIN PMS SQL
            + " LEFT JOIN pms_patient_biodata pb ON (fm.customer_id = pb.PMI_NO)  "
            // JOIN FAR DETAIL SQL
            + " LEFT JOIN far_order_detail fd ON (fm.order_no = fd.order_no)  "
            // WHERE CONDITION
            + " WHERE pb.new_ic_no = '" + icNo + "' AND fm.order_no = '" + orderNo + "' "
            + " AND fd.order_no = '" + orderNo + "' ORDER BY fm.txn_date DESC;";

    ArrayList<ArrayList<String>> dataBillGenerateDetails = conn.getData(sqlBillGenerateDetails);

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
        <label class="col-lg-2">Order No.</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" name="address" id="orderNo" value="<%=orderNo%>" readonly="true">
        </div> 
        <label class="col-lg-2">IC No.</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" name="ic" id="ic" value="<%=icNo%>" readonly="true">
        </div>
        <label class="col-lg-2">Name</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" name="patientName" id="patientName" value="<%=pName%>" readonly="true">
        </div>
        <label class="col-lg-2">Address</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" name="address" id="address" value="<%=address%>" readonly="true">
        </div>
        <label class="col-lg-2">PMI No.</label>
        <div class="col-lg-10" style="margin-bottom: 10px">
            <input type="text" class="form-control" name="address" id="pmiNo" value="<%=pmiNo%>" readonly="true">
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
            <th>Item Code</th>
            <th>Item Description</th>
            <th style="text-align: right;">Item Quantity</th>
            <th style="text-align: right;">Unit Price (RM)</th>
            <th style="text-align: right;">Total Amount (RM)</th>
            </thead>
            <tbody>
                <%

                    for (int i = 0; i < dataBillGenerateDetails.size(); i++) {
                %>
                <tr>
                    <td><%=dataBillGenerateDetails.get(i).get(9)%></td>
                    <td><%=dataBillGenerateDetails.get(i).get(10)%></td>
                    <td style="text-align: right;"><%=dataBillGenerateDetails.get(i).get(12)%></td>
                    <td style="text-align: right;"><%=df.format(Double.parseDouble(dataBillGenerateDetails.get(i).get(13)))%></td>
                    <td style="text-align: right;"><%=df.format(Double.parseDouble(dataBillGenerateDetails.get(i).get(11)))%></td>
                </tr>
                <%
                        subtotal += Double.parseDouble(dataBillGenerateDetails.get(i).get(11));
                        subQuantity += Integer.parseInt(dataBillGenerateDetails.get(i).get(12));
                    }

//                    String type = dataBillGenerateDetails.get(0).get(6);
//                    if (type.equals("004")) {
//                        type = "RG00001";
//                    } else if (type.equals("005")) {
//                        type = "RG00002";
//                    } else if (type.equals("Foreigner")) {
//                        type = "RG00003";
//                    } else {
//                        type = "RG00003";
//                    }
                    // Add enabled miscellaneous item to table.
                    String sqlBillGenerateDetailsMisceItem = "SELECT item_code, hfc_cd, item_desc, buying_price ,selling_price "
                            + " FROM far_miscellaneous_item "
                            + " WHERE hfc_cd = '" + hfc + "' AND enable = 'yes' ";
                    ArrayList<ArrayList<String>> dataBillGenerateDetailsMisceItem = conn.getData(sqlBillGenerateDetailsMisceItem);

                    for (int i = 0; i < dataBillGenerateDetailsMisceItem.size(); i++) {

                %>
                <tr>
                    <td><%=dataBillGenerateDetailsMisceItem.get(i).get(0)%></td>
                    <td><%=dataBillGenerateDetailsMisceItem.get(i).get(2)%></td>
                    <td style="text-align: right;">1</td>
                    <td style="text-align: right;"><%=df.format(Double.parseDouble(dataBillGenerateDetailsMisceItem.get(i).get(4)))%></td>
                    <td style="text-align: right;"><%=df.format(Double.parseDouble(dataBillGenerateDetailsMisceItem.get(i).get(4)))%></td>
                </tr>
                <%
                        subtotal = subtotal + Double.parseDouble(dataBillGenerateDetailsMisceItem.get(i).get(4));
                        subQuantity += 1;
                    }

                    // Add enabled billing parameters to the table
                    String sqlBillGenerateDetailsBillingParameters = "SELECT param_code, param_name, param_value "
                            + " FROM far_billing_parameter "
                            + " WHERE hfc_cd = '" + hfc + "' AND enable = 'yes' ";
                    ArrayList<ArrayList<String>> dataBillGenerateDetailsBillingParameters = conn.getData(sqlBillGenerateDetailsBillingParameters);

                    for (int i = 0; i < dataBillGenerateDetailsBillingParameters.size(); i++) {

                        if (dataBillGenerateDetailsBillingParameters.get(i).get(1).equalsIgnoreCase("gst")) {
                            gst = Double.parseDouble(dataBillGenerateDetailsBillingParameters.get(i).get(2));
                        } else if (dataBillGenerateDetailsBillingParameters.get(i).get(1).equalsIgnoreCase("service charge")) {
                            serviceCharge = Double.parseDouble(dataBillGenerateDetailsBillingParameters.get(i).get(2));
                        } else if (dataBillGenerateDetailsBillingParameters.get(i).get(1).equalsIgnoreCase("discount")) {
                            discount = Double.parseDouble(dataBillGenerateDetailsBillingParameters.get(i).get(2));
                        }

                        subQuantity += 1;

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

                    //Get Sub Quan And Set To Grand Quantity
                    grandQuantity = subQuantity;

                    //Round the grand total
                    grandTotal = subtotal;
                    grandTotal = Math.round(grandTotal * 20) / 20.0;

                    rounding = grandTotal - subtotal;
                    rounding = Double.parseDouble(df.format(rounding));

                    //display to bill details table
                    for (int i = 0; i < dataBillGenerateDetailsBillingParameters.size(); i++) {
                %>
                <tr>
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
                </tr>
            </tbody>
        </table>
    </div>
</div>


<br>


<div class="row">
    <!-- content goes here -->
    <form class="form-horizontal" id="addForm">

        <div class="col-md-8">
        </div>

        <div class="col-md-4">

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-5 control-label" for="textinput">Total Item Quantity :</label>
                <div class="col-md-4">
                    <input id="billDetailOrderDetailSingleTotalQuantity" name="billDetailOrderDetailSingleTotalQuantity" type="text" placeholder="Total Quantity" class="form-control input-md" maxlength="50" value="<%=dfQuan.format(grandQuantity)%>" readonly>
                </div>
            </div>

            <!-- Text input-->
            <div class="form-group">
                <label class="col-md-5 control-label" for="textinput">Grand Total (RM) :</label>
                <div class="col-md-4">
                    <input id="billDetailOrderDetailSingleGrandTotal" name="billDetailOrderDetailSingleGrandTotal" type="text" placeholder="Grand Total (RM)" class="form-control input-md" maxlength="50" value="<%=df.format(grandTotal)%>" readonly>
                </div>
            </div>          

        </div>

    </form>
</div>


<br>
<hr/>


<div id="viewBillGenereteBillDetailsButtonRightDiv">
    <div class="col-lg-4 pull-left" style="margin-bottom: 10px; ">
        <input id="grandTotal" type="hidden" value="<%=df.format(grandTotal)%>">
        <input id="dataBillDetailsOrderListGrandTotalValuehidden" type="hidden" value="">
        <button id="btnViewBillGenereteBillDetailsCancelBtn" class="btn btn-warning" style="float: left;"><i class="fa fa-times-circle-o fa-lg" aria-hidden="true"></i>&nbsp; Cancel Bill &nbsp;</button>
    </div>
    <div class="col-lg-8 pull-right" style="margin-bottom: 10px; ">
        <button id="btnViewBillGenereteBillDetailsConfirmBtn" class="btn btn-success" style="float: right; margin-right: 10px;" > <i class="fa fa-check-square-o fa-lg" aria-hidden="true"></i>&nbsp; Confirm Bill &nbsp;</button>
    </div>
</div>

<hr/>