<%-- 
    Document   : manageBillGenerateBillDetailUnpaidPaidMakePayment
    Created on : Oct 29, 2017, 9:57:43 PM
    Author     : Shammugam
--%>

<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="dbConn1.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Class.Month"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    // Get Parameter
    String subtotal = request.getParameter("subTotal");
    String grandTotal = request.getParameter("grandTotal");
    String amount = request.getParameter("amtReceived");
    String method = request.getParameter("paymentMethod");
    String custId = request.getParameter("custID");
    String billNo = request.getParameter("billNo");
    String txnDate = request.getParameter("txnDate");
    String change = request.getParameter("change");

    String givenAmt = amount;

    // Payment Method
    // cash = csh
    // credit card = crc
    // cheque = chq
    if (method.equalsIgnoreCase("Cash")) {
        method = "csh";
    } else if (method.equalsIgnoreCase("Credit Card")) {
        method = "crc";
    } else if (method.equalsIgnoreCase("Cheque")) {
        method = "chq";
    }

    Month month = new Month();
    month.setMonth(billNo.substring(10, 12));
    month.determineCreditMonth();

    //Get current credit from customer ledger
    String sql = "SELECT cl.cr_amt_10 "
            + " FROM far_customer_ledger cl "
            + " LEFT JOIN pms_patient_biodata pb ON (cl.customer_id = pb.PMI_NO)  "
            + " WHERE cl.customer_id = '" + custId + "' "
            + " AND pb.pmi_no = '" + custId + "' ";
    ArrayList<ArrayList<String>> data = Conn.getData(sql);
    String creditMonth = "0";

    if (data.isEmpty()) {

        String infoMessage = "Customer ledger data not found.";

        out.print("|-1|" + infoMessage);

    } else {

        // Assign Credit
        creditMonth = data.get(0).get(0);

        // Check Credit If Null
        if (creditMonth == null) {
            creditMonth = "0";
        }

        // Assign New Credit To The Customer Legger
        if ((Double.parseDouble(amount) - Double.parseDouble(grandTotal)) > 1) {

            creditMonth = String.valueOf(Double.parseDouble(creditMonth) + Double.parseDouble(grandTotal));

        } else {

            creditMonth = String.valueOf(Double.parseDouble(creditMonth) + Double.parseDouble(amount));

        }

        // Update customer ledger credit
        String sql1 = "UPDATE far_customer_ledger "
                + "SET pay_method = '" + method + "', " + month.getCreditMonth() + " = '" + creditMonth + "', txn_date = '" + txnDate + "' "
                + "WHERE customer_id = '" + custId + "' ";
        Conn.setData(sql1);

        double cash = Double.parseDouble(amount);
        double amtPaid = 0;
        String payment;

        if ((cash - Double.parseDouble(grandTotal)) >= 0) {

            amtPaid = Double.parseDouble(grandTotal);
            payment = "Paid";

        } else {

            amtPaid = cash;
            payment = "Unpaid";

        }

        //Get amt_paid from customer
        String sql2 = "SELECT amt_paid "
                + "FROM far_customer_hdr "
                + "WHERE bill_no = '" + billNo + "'";
        ArrayList<ArrayList<String>> data1 = Conn.getData(sql2);
        double amountPaid = Double.parseDouble(data1.get(0).get(0));

        amtPaid = amountPaid + amtPaid;

        //Update customer hdr bill 
        String sql3 = "UPDATE far_customer_hdr "
                + "SET payment = '" + payment + "', amt_paid = '" + amtPaid + "', amt_given = '" + givenAmt + "', amt_change = '" + change + "' "
                + "WHERE bill_no = '" + billNo + "'";
        Conn.setData(sql3);

        String infoMessage = "Payment success.";
        out.print("-|1|" + infoMessage);

    }
%>