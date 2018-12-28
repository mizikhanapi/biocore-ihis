<%-- 
    Document   : manageBillGenerateBillDetailUnpaidPaidDelete
    Created on : Oct 26, 2017, 5:13:26 PM
    Author     : Shammugam
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="BILLING_helper.MonthCreditDebitController"%>
<%@page import="BILLING_helper.BillParameterCalculatorAddDel"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Connection And Session Variable
    Conn conn = new Conn();
    DecimalFormat df = new DecimalFormat("0.00");

    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    // Getting Parameter For OverAll
    String billNo = request.getParameter("billNoDel");
    String overallItmAmnt = request.getParameter("overallItmAmnt");
    String overallQtyTtl = request.getParameter("overallQtyTtl");

    // Getting Parameter For Item To be Deleted
    String txnDate = request.getParameter("txtDateDel");
    String ref_order_no = request.getParameter("orderNoDel");
    String itemCode = request.getParameter("itemCDDel");
    String itemQty = request.getParameter("itemQtyDel");
    String itemAmt = request.getParameter("itemAmtDel");
    String custID = request.getParameter("custID");

    //Get customer_ledger current month credit and artribute name
    MonthCreditDebitController mcdc = new MonthCreditDebitController();
    mcdc.determineCreditMonth();

    // Storing Credit Month Name
    String creditMonth = mcdc.getCreditMonth();

    // Creating Object For Delete Process
    BillParameterCalculatorAddDel bill = new BillParameterCalculatorAddDel(billNo, hfc, custID, creditMonth);

    // Get Current Credit In Legger Before Delete Process
    String currentCredit = bill.updateGetCurCustomerLeggerCredit();

    // Get Updated Credit Value Before Delete Process
    String leggerCreditToBeMinused = overallItmAmnt;
    currentCredit = String.valueOf(df.format(Double.parseDouble(currentCredit) - Double.parseDouble(leggerCreditToBeMinused)));

    // Update Credit value In The Customer Legger Before Delete Process
    bill.updateCustomerLeggerCredit(currentCredit);

    // Delete Item Form Customer Detail Table
    bill.updateDeleteCustomerItemDetail(txnDate, ref_order_no, itemCode);

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

    out.print("Success");


%>