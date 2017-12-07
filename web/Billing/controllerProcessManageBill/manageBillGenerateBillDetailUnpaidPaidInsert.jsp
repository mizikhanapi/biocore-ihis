<%-- 
    Document   : manageBillGenerateBillDetailUnpaidPaidInsert
    Created on : Oct 27, 2017, 10:34:18 AM
    Author     : Shammugam
--%>


<%@page import="BILLING_helper.BillParameterCalculatorAddDel"%>
<%@page import="BILLING_helper.MonthCreditDebitController"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Connection And Session Variable
    Conn conn = new Conn();
    DecimalFormat df = new DecimalFormat("0.00");

    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
    String userId = session.getAttribute("USER_ID").toString();

    DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    LocalDateTime now = LocalDateTime.now();
    String created_date = format.format(now);

    // Getting Parameter For OverAll
    String custID = request.getParameter("custID");
    String billNo = request.getParameter("billNo");
    String overallItmAmnt = request.getParameter("overallItmAmnt");

    // Getting Parameter For Item To be Added
    String itemType = request.getParameter("itemType");
    String txnDate = request.getParameter("txn_date");
    String ref_order_no = request.getParameter("ref_order_no");
    String itemCode = request.getParameter("itemCode");
    String name = request.getParameter("itemName");
    String unitPrice = request.getParameter("unitPrice");

    //Get customer_ledger current month credit and artribute name
    MonthCreditDebitController mcdc = new MonthCreditDebitController();
    mcdc.determineCreditMonth();

    // Storing Credit Month Name
    String creditMonth = mcdc.getCreditMonth();

    // Creating Object For Add Process
    BillParameterCalculatorAddDel bill = new BillParameterCalculatorAddDel(billNo, hfc, custID, creditMonth);

    // Get Current Credit In Legger Before Add Process
    String currentCredit = bill.updateGetCurCustomerLeggerCredit();

    // Get Updated Credit Value Before Delete Process
    String leggerCreditToBeMinused = overallItmAmnt;
    currentCredit = String.valueOf(df.format(Double.parseDouble(currentCredit) - Double.parseDouble(leggerCreditToBeMinused)));

    // Update Credit value In The Customer Legger Before Delete Process
    bill.updateCustomerLeggerCredit(currentCredit);

    if (itemType.equalsIgnoreCase("M")) {

        // Add item price to a variable
        double totalPrice = Double.parseDouble(unitPrice);
        int quantity = 1;

        bill.updateAddCustomerItemDetail(txnDate, ref_order_no, itemCode, name, String.valueOf(totalPrice), String.valueOf(quantity), userId, created_date);

        // Get Updated Total Amount And Quantity Before The Delete Process
        String totalAmtQtyBefore[] = bill.updateGetCurrentOrderTotalAmntBefore().split("\\|");

        // Setting Total Amount And Quantity Before The Delete Process
        String totalAmtBefore = totalAmtQtyBefore[0];
        String totalQtyBefore = totalAmtQtyBefore[1];

        // Get Updated Total Amount, Quantity, GST, SC , Discount After The Delete Process
        String totalAmtQtyAfter[] = bill.updateGetCurrentParameterAmntAfter(Double.parseDouble(totalAmtBefore), Integer.parseInt(totalQtyBefore)).split("\\|");

        // Setting Total Amount, Quantity, GST, SC , Discount After The Delete Process
        String totalAmtAfter = totalAmtQtyAfter[0];
        String totalQtyAfter = totalAmtQtyAfter[1];
        String totalGstAfter = totalAmtQtyAfter[2];
        String totalSCAfter = totalAmtQtyAfter[3];
        String totalDisAfter = totalAmtQtyAfter[4];

        // Get Current Credit In Legger After Delete Process
        currentCredit = bill.updateGetCurCustomerLeggerCredit();

        // Get Updated Credit Value After Delete Process
        leggerCreditToBeMinused = totalAmtAfter;
        currentCredit = String.valueOf(df.format(Double.parseDouble(currentCredit) + Double.parseDouble(leggerCreditToBeMinused)));

        // Update Credit value In The Customer Legger After Delete Process
        bill.updateCustomerLeggerCredit(currentCredit);

        // Update Parameter Value In The Customer Detail Table After Delete Process
        bill.updateValueCurrentParameterAmntAfter(Double.parseDouble(totalGstAfter), Double.parseDouble(totalSCAfter), Double.parseDouble(totalDisAfter));

        // Update Total Amnt And Qty In The Customer Header Table After Delete Process
        bill.updateValueHedderTllQtyAfter(Double.parseDouble(totalAmtAfter), Double.parseDouble(totalQtyAfter));

        String infoMessage = "Selected item added to bill successfully.";
        out.print("-|1|" + infoMessage);

    } else if (itemType.equalsIgnoreCase("D")) {

        // Add item price to a variable
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double totalPrice = quantity * Double.parseDouble(unitPrice);

        bill.updateAddCustomerItemDetail(txnDate, ref_order_no, itemCode, name, String.valueOf(totalPrice), String.valueOf(quantity), userId, created_date);

        // Get Updated Total Amount And Quantity Before The Delete Process
        String totalAmtQtyBefore[] = bill.updateGetCurrentOrderTotalAmntBefore().split("\\|");

        // Setting Total Amount And Quantity Before The Delete Process
        String totalAmtBefore = totalAmtQtyBefore[0];
        String totalQtyBefore = totalAmtQtyBefore[1];

        // Get Updated Total Amount, Quantity, GST, SC , Discount After The Delete Process
        String totalAmtQtyAfter[] = bill.updateGetCurrentParameterAmntAfter(Double.parseDouble(totalAmtBefore), Integer.parseInt(totalQtyBefore)).split("\\|");

        // Setting Total Amount, Quantity, GST, SC , Discount After The Delete Process
        String totalAmtAfter = totalAmtQtyAfter[0];
        String totalQtyAfter = totalAmtQtyAfter[1];
        String totalGstAfter = totalAmtQtyAfter[2];
        String totalSCAfter = totalAmtQtyAfter[3];
        String totalDisAfter = totalAmtQtyAfter[4];

        // Get Current Credit In Legger After Delete Process
        currentCredit = bill.updateGetCurCustomerLeggerCredit();

        // Get Updated Credit Value After Delete Process
        leggerCreditToBeMinused = totalAmtAfter;
        currentCredit = String.valueOf(df.format(Double.parseDouble(currentCredit) + Double.parseDouble(leggerCreditToBeMinused)));

        // Update Credit value In The Customer Legger After Delete Process
        bill.updateCustomerLeggerCredit(currentCredit);

        // Update Parameter Value In The Customer Detail Table After Delete Process
        bill.updateValueCurrentParameterAmntAfter(Double.parseDouble(totalGstAfter), Double.parseDouble(totalSCAfter), Double.parseDouble(totalDisAfter));

        // Update Total Amnt And Qty In The Customer Header Table After Delete Process
        bill.updateValueHedderTllQtyAfter(Double.parseDouble(totalAmtAfter), Double.parseDouble(totalQtyAfter));

        String infoMessage = "Selected item added to bill successfully.";
        out.print("-|1|" + infoMessage);

    }
%>