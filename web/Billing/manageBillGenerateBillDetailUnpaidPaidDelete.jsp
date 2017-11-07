<%-- 
    Document   : manageBillGenerateBillDetailUnpaidPaidDelete
    Created on : Oct 26, 2017, 5:13:26 PM
    Author     : Shammugam
--%>

<%@page import="BILLING_helper.BillingParameterCalculator"%>
<%@page import="Class.Month"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="dbConn1.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String billNo = request.getParameter("billNoDel");
    String txnDate = request.getParameter("txtDateDel");
    String ref_order_no = request.getParameter("orderNoDel");
    String itemCode = request.getParameter("itemCDDel");
    String itemQty = request.getParameter("itemQtyDel");
    String itemAmt = request.getParameter("itemAmtDel");
    String custID = request.getParameter("custID");

    //Search and add billing parameters
    String sql6 = "SELECT param_code, param_name, param_value "
            + " FROM far_billing_parameter "
            + " WHERE param_code IN "
            + " (SELECT item_cd FROM far_customer_dtl "
            + " WHERE bill_no = '" + billNo + "') ";
    ArrayList<ArrayList<String>> billingParameters = Conn.getData(sql6);

    // Calculating Amount For Futher Process
    BillingParameterCalculator calculateAmt = new BillingParameterCalculator();
    double[] amount = calculateAmt.calculateAmount(billingParameters, Double.parseDouble(itemAmt));
    double totalPrice = amount[0];

    // Getting Current Month
    String month = new Month().getDebitMonth();

    //Get current credit of customer
    String sql2 = "SELECT  " + month + " "
            + "FROM far_customer_ledger "
            + "WHERE customer_id = '" + custID + "' ";
    ArrayList<ArrayList<String>> data1 = Conn.getData(sql2);
    String currentDebit = data1.get(0).get(0);

    if (currentDebit == null) {
        currentDebit = "0";
    }
    currentDebit = String.valueOf(Double.parseDouble(currentDebit) - totalPrice);

    //Update customer ledger
    String sql3 = "UPDATE far_customer_ledger "
            + "SET " + month + " = '" + currentDebit + "' "
            + "WHERE customer_id = '" + custID + "' ";
    Conn.setData(sql3);

    //Delete from customer dtl
    String sql1 = "DELETE FROM  far_customer_dtl "
            + " WHERE bill_no = '" + billNo + "' AND txn_date = '" + txnDate + "' "
            + " AND ref_order_no = '" + ref_order_no + "' AND item_cd = '" + itemCode + "' ";
    Conn.setData(sql1);

    BillingParameterCalculator updateBillPar = new BillingParameterCalculator();
    updateBillPar.updateCustomerBillParameterDel(billingParameters, billNo, amount);

    //Get current bill_amt and minus item price;
    String sql4 = "SELECT item_amt, quantity "
            + "FROM far_customer_hdr "
            + "WHERE customer_id = '" + custID + "' "
            + "AND bill_no = '" + billNo + "'";
    ArrayList<ArrayList<String>> data2 = Conn.getData(sql4);
    String itemAmt1 = data2.get(0).get(0);
    String quantity = data2.get(0).get(1);

    itemAmt1 = String.valueOf(Double.parseDouble(itemAmt1) - totalPrice);
    quantity = String.valueOf(Integer.parseInt(quantity) - Integer.parseInt(itemQty));

    //Update customer hdr
    String sql5 = "UPDATE far_customer_hdr "
            + "SET txn_date = '" + txnDate + "', item_amt = '" + itemAmt1 + "', quantity = '" + quantity + "' "
            + "WHERE bill_no = '" + billNo + "' "
            + "AND customer_id = '" + custID + "'";
    Conn.setData(sql5);

    out.print("Success");


%>