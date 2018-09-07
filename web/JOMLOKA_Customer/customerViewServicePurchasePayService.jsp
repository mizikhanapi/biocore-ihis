<%-- 
    Document   : customerViewServicePurchasePayService
    Created on : Sep 5, 2018, 2:42:23 PM
    Author     : Shammugam
--%>

<%@page import="JOMLOKAHelper.CustomerNotificationSender"%>
<%@page import="ADM_helper.Emailer"%>
<%@page import="BILLING_helper.MonthCreditDebitController"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="org.json.JSONArray"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONObject"%>

<%

    // Getting Parameter
    String customer_id = request.getParameter("customer_id");
    String customer_name = request.getParameter("customer_name");
    String account_no = request.getParameter("account_no");
    String tenant_code = request.getParameter("tenant_code");
    String tenant_service = request.getParameter("tenant_service");
    String service_code = request.getParameter("service_code");
    String service_name = request.getParameter("service_name");
    String service_fee = request.getParameter("service_fee");
    String payment_cd = request.getParameter("payment_cd");
    String payment_expire = request.getParameter("payment_expire");
    String payment_cvv = request.getParameter("payment_cvv");

    // Connection 
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    boolean isSucribePayJOMLOKA = false;
    LocalDateTime now = LocalDateTime.now();
    DateTimeFormatter formatOrderTime = DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS");
    DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    // Status To Get As Return
    final String SUCCESS = "Success";
    final String FAILED = "failed";
    String status = "";

    // Return Object With Required Detail
    JSONObject objMain = new JSONObject();
    JSONArray purchaseDetails = new JSONArray();

    // Curremt Time Generation 
    String currDateTime = format.format(now);

    // Bill No Generation
    String billNoHead = "JLKC";
    String billNoDate = formatOrderTime.format(now);
    String billNo = billNoHead + billNoDate;

    //Get customer_ledger current month credit and artribute name
    MonthCreditDebitController mcdcc = new MonthCreditDebitController();
    mcdcc.determineCreditMonth();
    String creditMonth = mcdcc.getCreditMonth();

    //Get customer_ledger current month debit and artribute name
    MonthCreditDebitController mcdcd = new MonthCreditDebitController();
    mcdcd.determineDebitMonth();
    String debitMonth = mcdcd.getDebitMonth();

    String sqlGetCurCreditDebit = "SELECT cl." + creditMonth + ",cl." + debitMonth + " "
            + " FROM far_customer_ledger cl "
            + " JOIN far_customer fc ON (fc.customer_account_no = cl.customer_id) "
            + " WHERE cl.customer_id  = '" + account_no + "' AND cl.hfc_cd = '" + customer_id + "' ";

    ArrayList<ArrayList<String>> dataCreditDebit = con.getData(sqlGetCurCreditDebit);

    String debitQuery = "";
    String creditQuery = "";

    if (dataCreditDebit.get(0).get(0) == null) {

        creditQuery = "UPDATE far_customer_ledger "
                + "SET " + creditMonth + " = '" + service_fee + "' "
                + "WHERE customer_id = '" + account_no + "' AND hfc_cd = '" + customer_id + "'";

    } else {

        //When current month debit exist update
        double credit = Double.parseDouble(dataCreditDebit.get(0).get(0)) + Double.parseDouble(service_fee);

        creditQuery = "UPDATE far_customer_ledger "
                + "SET " + creditMonth + " = '" + credit + "' "
                + "WHERE customer_id = '" + account_no + "' AND hfc_cd = '" + customer_id + "'";

    }

    if (dataCreditDebit.get(0).get(1) == null) {

        debitQuery = "UPDATE far_customer_ledger "
                + "SET " + debitMonth + " = '" + service_fee + "' "
                + "WHERE customer_id = '" + account_no + "' AND hfc_cd = '" + customer_id + "'";

    } else {

        //When current month debit exist update
        double credit = Double.parseDouble(dataCreditDebit.get(0).get(1)) + Double.parseDouble(service_fee);

        debitQuery = "UPDATE far_customer_ledger "
                + "SET " + debitMonth + " = '" + credit + "' "
                + "WHERE customer_id = '" + account_no + "' AND hfc_cd = '" + customer_id + "'";

    }

    String sqlInsertDetails = "INSERT into far_customer_dtl(bill_no, txn_date, ref_order_no, item_cd, item_desc, item_amt, quantity,  "
            + " location, customer_id, status, created_by, created_date) "
            + "VALUES('" + billNo + "','" + currDateTime + "','" + tenant_code + "','" + service_code + "','" + service_name + "','" + service_fee + "',"
            + " '1','0','" + account_no + "','0','" + customer_id + "', '" + currDateTime + "' )";

    //Insert to far_customer_hdr
    String sqlInsertHeader = "INSERT into far_customer_hdr(customer_id, bill_no, txn_date, item_desc, item_amt, quantity, location, order_no, "
            + " payment, amt_paid, hfc_cd, discipline_cd, subdiscipline_cd, status, created_by, created_date, txn_type, amt_given, amt_change) "
            + " VALUES('" + account_no + "', '" + billNo + "', '" + currDateTime + "', '" + tenant_service + "', '" + service_fee + "', '1', '0', "
            + " '" + tenant_code + "', 'Paid', '" + service_fee + "', '" + tenant_code + "', '" + tenant_code + "', '" + tenant_code + "', '0', "
            + " '" + customer_id + "', '" + currDateTime + "','-','" + service_fee + "','0') ";

    isSucribePayJOMLOKA = rmi.setQuerySQL(con.HOST, con.PORT, sqlInsertHeader);
    isSucribePayJOMLOKA = rmi.setQuerySQL(con.HOST, con.PORT, sqlInsertDetails);
    isSucribePayJOMLOKA = rmi.setQuerySQL(con.HOST, con.PORT, debitQuery);
    isSucribePayJOMLOKA = rmi.setQuerySQL(con.HOST, con.PORT, creditQuery);

    if (isSucribePayJOMLOKA == true) {

        String subject = "Service Is Subscribed";

        String sender = "mkagtech@mkagtechnologies.com";

        String messageNotify = "Good Day Dear " + customer_name + ". "
                + "Thank you for purchasing our service.\n\n"
                + "Following are your transaction information...\n"
                + "User ID : " + customer_id + "\n"
                + "Service Type : " + tenant_service + "\n"
                + "Service Provider : " + tenant_code + "\n"
                + "Service Name : " + service_name + "\n"
                + "Service Price : RM " + service_fee + "";

        String messageEmail = "<h3>Good Day Dear " + customer_name + "!</h3> "
                + "<br/><p>Thank you for purchasing our service.</p>"
                + "<br/><br/><p>Following are your transaction information...</p>"
                + "<p>User ID : " + customer_id + "</p>"
                + "<p>Service Type : " + tenant_service + "</p>"
                + "<p>Service Provider : " + tenant_code + "</p>"
                + "<p>Service Name : " + service_name + "</p>"
                + "<p>Service Price : RM " + service_fee + "</p><br/>";

        Emailer em = new Emailer(customer_id, subject, messageEmail);
        em.sendTextEmail();

        CustomerNotificationSender notify = new CustomerNotificationSender(sender, customer_id, subject, messageNotify);
        notify.sendCustomerInboxNotification();

        status = SUCCESS;

    } else {
        status = FAILED;
    }

    objMain.put("message", status);
    objMain.put("dataJSONPurchase", purchaseDetails);

    out.print(objMain);


%>