<%-- 
    Document   : manageBillGenerateBillDetailUnpaidPaidMakePayment
    Created on : Oct 29, 2017, 9:57:43 PM
    Author     : Shammugam
--%>

<%@page import="BILLING_helper.MonthCreditDebitController"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.net.URL"%>
<%@page import="java.util.ArrayList"%>
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

    // Conn  
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = (String) session.getAttribute("DISCIPLINE_CODE");

    // Debit Debit Controller
    MonthCreditDebitController mcdc = new MonthCreditDebitController();
    mcdc.determineDebitMonth();

    String debitMonthName = mcdc.getDebitMonth();

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

    //Get current Debit from customer ledger
    String sqlGetCurDebit = "SELECT cl." + debitMonthName + " "
            + " FROM far_customer_ledger cl "
            + " LEFT JOIN pms_patient_biodata pb ON (cl.customer_id = pb.PMI_NO)  "
            + " WHERE cl.customer_id = '" + custId + "' "
            + " AND pb.pmi_no = '" + custId + "' AND cl.hfc_cd = '" + hfc + "' ";

    ArrayList<ArrayList<String>> dataCurDebit = conn.getData(sqlGetCurDebit);

    String debitMonth = "0";

    if (dataCurDebit.isEmpty()) {

        String infoMessage = "Customer ledger data not found.";

        out.print("|-1|" + infoMessage);

    } else {

        // Assign Debit
        debitMonth = dataCurDebit.get(0).get(0);

        // Check Debit If Null
        if (debitMonth == null) {
            debitMonth = "0";
        }

        // Assign New Debit To The Customer Legger
        if ((Double.parseDouble(amount) - Double.parseDouble(grandTotal)) > 0) {

            debitMonth = String.valueOf(Double.parseDouble(debitMonth) + Double.parseDouble(grandTotal));

        } else {

            debitMonth = String.valueOf(Double.parseDouble(debitMonth) + Double.parseDouble(amount));

        }

        // Boolean And Counter
        int falseCount = 0;
        boolean isMakePayment = false;


        // Update customer ledger debit
        String sqlUpdateDebitLegger = "UPDATE far_customer_ledger "
                + "SET pay_method = '" + method + "', " + debitMonthName + " = '" + debitMonth + "', txn_date = '" + txnDate + "' "
                + "WHERE customer_id = '" + custId + "' AND hfc_cd = '" + hfc + "' ";

         isMakePayment = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateDebitLegger);

        if (isMakePayment == false) {

            falseCount = falseCount + 1;

        }


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
        String sqlGetAmtPaidMaster = "SELECT amt_paid "
                + "FROM far_customer_hdr "
                + "WHERE bill_no = '" + billNo + "'";

        ArrayList<ArrayList<String>> dataAmtPaidMaster = conn.getData(sqlGetAmtPaidMaster);

        double amountPaid = Double.parseDouble(dataAmtPaidMaster.get(0).get(0));

        amtPaid = amountPaid + amtPaid;

        //Update customer hdr bill 
        String sqlUpdateMasterHeaderDetails = "UPDATE far_customer_hdr "
                + "SET payment = '" + payment + "', amt_paid = '" + amtPaid + "', amt_given = '" + givenAmt + "', amt_change = '" + change + "' "
                + "WHERE bill_no = '" + billNo + "'";

        isMakePayment = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdateMasterHeaderDetails);

        if (isMakePayment == false) {

            falseCount = falseCount + 1;

        }

        if (isMakePayment == true && falseCount == 0) {

            String infoMessage = "Payment success.";

            out.print("-|1|" + infoMessage);

        } else {

        }
    }
%>