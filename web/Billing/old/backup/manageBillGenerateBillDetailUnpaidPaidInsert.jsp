<%-- 
    Document   : manageBillGenerateBillDetailUnpaidPaidInsert
    Created on : Oct 27, 2017, 10:34:18 AM
    Author     : Shammugam
--%>

<%@page import="BILLING_helper.BillingParameterCalculator"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="Class.Month"%>
<%@page import="dbConn1.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String itemType = request.getParameter("itemType");
    String custId = request.getParameter("custID");
    String billNo = request.getParameter("billNo");
    String itemCode = request.getParameter("itemCode");
    String name = request.getParameter("itemName");
    String unitPrice = request.getParameter("unitPrice");
    String ref_order_no = request.getParameter("ref_order_no");
    String txnDate = request.getParameter("txn_date");

    DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    LocalDateTime now = LocalDateTime.now();

    String created_date = format.format(now);

    String userId = session.getAttribute("USER_ID").toString();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();

    Date date = new Date();
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    DateFormat dateFormat1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
    String strDate = dateFormat.format(date);

    if (itemType.equalsIgnoreCase("M")) {

        // Add item price to a variable
        double totalPrice = Double.parseDouble(unitPrice);
        double priceBeforeTax = totalPrice;

        //Search and add billing parameters
        String sql1 = "SELECT param_code, param_name, param_value "
                + " FROM far_billing_parameter "
                + " WHERE param_code IN "
                + " (SELECT item_cd FROM far_customer_dtl "
                + " WHERE bill_no = '" + billNo + "') ";
        ArrayList<ArrayList<String>> billingParameters = Conn.getData(sql1);

        // Calculating Amount For Futher Process
        BillingParameterCalculator calculateAmt = new BillingParameterCalculator();
        double[] amount = calculateAmt.calculateAmount(billingParameters, totalPrice);
        totalPrice = amount[0];

        // Get bill's month debit and add the item price
        Month month = new Month();
        month.setMonth(billNo.substring(10, 12));
        month.determineDebitMonth();

        // Get Customer Current Debit
        String sql2 = "SELECT cl." + month.getDebitMonth() + " "
                + " FROM far_customer_ledger cl "
                + " LEFT JOIN pms_patient_biodata pb ON (cl.customer_id = pb.PMI_NO) "
                + " WHERE cl.customer_id = '" + custId + "' "
                + " AND pb.pmi_no = '" + custId + "' ";
        ArrayList<ArrayList<String>> data1 = Conn.getData(sql2);
        String currentDebit = data1.get(0).get(0);

        // Generate New Debit
        currentDebit = String.valueOf(Double.parseDouble(currentDebit) + totalPrice);

        // Update customer ledger
        String sql3 = "UPDATE far_customer_ledger "
                + " SET " + month.getDebitMonth() + " = '" + currentDebit + "', txn_date = '" + txnDate + "' "
                + " WHERE customer_id = '" + custId + "' ";
        Conn.setData(sql3);

        // Update customer dtl
        String sql4 = "INSERT INTO far_customer_dtl (bill_no, txn_date, ref_order_no, item_cd, item_desc, item_amt, quantity, "
                + " location, customer_id, status, created_by, created_date) "
                + " VALUES('" + billNo + "', '" + txnDate + "','" + ref_order_no + "','" + itemCode + "','" + name + "',"
                + " '" + priceBeforeTax + "','1','" + hfc + "','" + custId + "','0','" + userId + "','" + created_date + "')";
        Conn.setData(sql4);

        // Update Bill Parameter
        BillingParameterCalculator updateBillPar = new BillingParameterCalculator();
        updateBillPar.updateCustomerBillParameter(billingParameters, billNo, amount);

        //Get current bill_amt and add item price;
        String sql5 = "SELECT item_amt, quantity "
                + " FROM far_customer_hdr "
                + " WHERE customer_id = '" + custId + "' "
                + " AND bill_no = '" + billNo + "'";
        ArrayList<ArrayList<String>> data2 = Conn.getData(sql5);
        String itemAmt = data2.get(0).get(0);
        String quantity = data2.get(0).get(1);

        // Get New Item Amount And Quantity
        itemAmt = String.valueOf(Double.parseDouble(itemAmt) + totalPrice);
        quantity = String.valueOf(Integer.parseInt(quantity) + 1);

        // Update customer hdr
        String sql6 = "UPDATE far_customer_hdr "
                + " SET item_amt = '" + itemAmt + "', quantity = '" + quantity + "', payment = 'Unpaid' "
                + " WHERE bill_no = '" + billNo + "' "
                + " AND customer_id = '" + custId + "'";
        Conn.setData(sql6);

        String infoMessage = "Selected item added to bill successfully.";
        out.print("-|1|" + infoMessage);

    } else if (itemType.equalsIgnoreCase("D")) {

        // Add item price to a variable
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double totalPrice = quantity * Double.parseDouble(unitPrice);
        double priceBeforeTax = totalPrice;

        //Search and add billing parameters
        String sql1 = "SELECT param_code, param_name, param_value "
                + " FROM far_billing_parameter "
                + " WHERE param_code IN "
                + " (SELECT item_cd FROM far_customer_dtl "
                + " WHERE bill_no = '" + billNo + "') ";
        ArrayList<ArrayList<String>> billingParameters = Conn.getData(sql1);

        // Calculating Amount For Futher Process
        BillingParameterCalculator calculateAmt = new BillingParameterCalculator();
        double[] amount = calculateAmt.calculateAmount(billingParameters, totalPrice);
        totalPrice = amount[0];

        // Get bill's month debit and add the item price
        Month month = new Month();
        month.setMonth(billNo.substring(10, 12));
        month.determineDebitMonth();

        // Get Customer Current Debit
        String sql2 = "SELECT cl." + month.getDebitMonth() + " "
                + " FROM far_customer_ledger cl "
                + " LEFT JOIN pms_patient_biodata pb ON (cl.customer_id = pb.PMI_NO) "
                + " WHERE cl.customer_id = '" + custId + "' "
                + " AND pb.pmi_no = '" + custId + "' ";
        ArrayList<ArrayList<String>> data1 = Conn.getData(sql2);

        // Assigning Debit
        String currentDebit = "";
        if (data1.get(0).get(0) == null) {
            currentDebit = "0";
        } else {
            currentDebit = data1.get(0).get(0);
        }

        // Generate New Debit
        currentDebit = String.valueOf(Double.parseDouble(currentDebit) + totalPrice);

        // Update customer ledger
        String sql3 = "UPDATE far_customer_ledger "
                + " SET " + month.getDebitMonth() + " = '" + currentDebit + "', txn_date = '" + txnDate + "' "
                + " WHERE customer_id = '" + custId + "' ";
        Conn.setData(sql3);

        // Update customer dtl
        String sql4 = "INSERT INTO far_customer_dtl (bill_no, txn_date, ref_order_no, item_cd, item_desc, item_amt, quantity, "
                + " location, customer_id, status, created_by, created_date) "
                + " VALUES('" + billNo + "', '" + txnDate + "','" + ref_order_no + "','" + itemCode + "','" + name + "',"
                + " '" + priceBeforeTax + "','" + quantity + "','" + hfc + "','" + custId + "','0','" + userId + "','" + created_date + "')";
        Conn.setData(sql4);

        BillingParameterCalculator updateBillPar = new BillingParameterCalculator();
        updateBillPar.updateCustomerBillParameter(billingParameters, billNo, amount);

        // Get current bill_amt and add item price;
        String sql5 = "SELECT item_amt, quantity "
                + "FROM far_customer_hdr "
                + "WHERE customer_id = '" + custId + "' "
                + "AND bill_no = '" + billNo + "'";
        ArrayList<ArrayList<String>> data2 = Conn.getData(sql5);
        String itemAmt = data2.get(0).get(0);
        String qty = data2.get(0).get(1);

        // Get New Item Amount And Quantity
        itemAmt = String.valueOf(Double.parseDouble(itemAmt) + totalPrice);
        qty = String.valueOf(Integer.parseInt(qty) + quantity);

        // Update customer hdr
        String sql6 = "UPDATE far_customer_hdr "
                + "SET item_amt = '" + itemAmt + "', quantity = '" + qty + "', payment = 'Unpaid' "
                + "WHERE bill_no = '" + billNo + "' "
                + "AND customer_id = '" + custId + "'";
        Conn.setData(sql6);

        String infoMessage = "Selected item added to bill successfully.";
        out.print("-|1|" + infoMessage);
    }
%>
<%--<%!
    public double[] calculateAmount(ArrayList<ArrayList<String>> billingParameters, double totalPrice) {

        // Library Object Creation
        DecimalFormat df = new DecimalFormat("0.00");

        // Variable Creation
        double gst = 0;
        double serviceCharge = 0;
        double discount = 0;
        double discountAmount = 0;
        double serviceChargeAmount = 0;
        double gstAmount = 0;

        // For Loop Creation
        for (int i = 0; i < billingParameters.size(); i++) {
            if (billingParameters.get(i).get(1).equalsIgnoreCase("gst")) {
                gst = Double.parseDouble(billingParameters.get(i).get(2));
            } else if (billingParameters.get(i).get(1).equalsIgnoreCase("service charge")) {
                serviceCharge = Double.parseDouble(billingParameters.get(i).get(2));
            } else if (billingParameters.get(i).get(1).equalsIgnoreCase("discount")) {
                discount = Double.parseDouble(billingParameters.get(i).get(2));
            }
        }

        // Calculate grand total
        discountAmount = totalPrice * discount;
        discountAmount = Double.parseDouble(df.format(discountAmount));
        totalPrice = totalPrice - discountAmount;

        serviceChargeAmount = totalPrice * serviceCharge;
        serviceChargeAmount = Double.parseDouble(df.format(serviceChargeAmount));
        totalPrice = totalPrice + serviceChargeAmount;

        gstAmount = totalPrice * gst;
        gstAmount = Double.parseDouble(df.format(gstAmount));
        totalPrice = totalPrice + gstAmount;

        // Round the grand total
        totalPrice = Math.round(totalPrice * 20) / 20.0;

        return new double[]{totalPrice, gst, gstAmount, serviceCharge, serviceChargeAmount, discount, discountAmount};

    }

    private void updateCustomerBillParameter(ArrayList<ArrayList<String>> billingParameters, String billNo, double[] amount) {
        double gstAmount = amount[2];
        double serviceChargeAmount = amount[4];
        double discountAmount = amount[6];

        for (int i = 0; i < billingParameters.size(); i++) {
            if (billingParameters.get(i).get(1).equalsIgnoreCase("gst")) {
                String sql5 = "SELECT item_amt "
                        + "FROM far_customer_dtl "
                        + "WHERE item_desc = 'gst' AND bill_no = '" + billNo + "'";
                ArrayList<ArrayList<String>> itemAmt = Conn.getData(sql5);
                gstAmount = gstAmount + Double.parseDouble(itemAmt.get(0).get(0));

                String sql6 = "UPDATE far_customer_dtl "
                        + "SET item_amt = '" + gstAmount + "' "
                        + "WHERE item_desc = 'gst' "
                        + "AND bill_no = '" + billNo + "'";
                Conn.setData(sql6);

            } else if (billingParameters.get(i).get(1).equalsIgnoreCase("service charge")) {
                String sql5 = "SELECT item_amt "
                        + "FROM far_customer_dtl "
                        + "WHERE item_desc = 'service charge' AND bill_no = '" + billNo + "'";
                ArrayList<ArrayList<String>> itemAmt = Conn.getData(sql5);
                serviceChargeAmount = serviceChargeAmount + Double.parseDouble(itemAmt.get(0).get(0));

                String sql6 = "UPDATE far_customer_dtl "
                        + "SET item_amt = '" + serviceChargeAmount + "' "
                        + "WHERE item_desc = 'service charge' "
                        + "AND bill_no = '" + billNo + "'";
                Conn.setData(sql6);

            } else if (billingParameters.get(i).get(1).equalsIgnoreCase("discount")) {
                String sql5 = "SELECT item_amt "
                        + "FROM far_customer_dtl "
                        + "WHERE item_desc = 'discount' AND bill_no = '" + billNo + "'";
                ArrayList<ArrayList<String>> itemAmt = Conn.getData(sql5);

                discountAmount = discountAmount + Double.parseDouble(itemAmt.get(0).get(0));

                String sql6 = "UPDATE far_customer_dtl "
                        + "SET item_amt = '" + discountAmount + "' "
                        + "WHERE item_desc = 'discount' "
                        + "AND bill_no = '" + billNo + "'";
                Conn.setData(sql6);
            }
        }
    }
%>--%>