<%-- 
    Document   : customerManageCardSetupCard
    Created on : Sep 6, 2018, 12:10:48 PM
    Author     : Shammugam
--%>

<%@page import="JOMLOKAHelper.CustomerNotificationSender"%>
<%@page import="ADM_helper.Emailer"%>
<%@page import="org.json.JSONArray"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.json.JSONObject"%>

<%

    // Getting Parameter
    String customer_id = request.getParameter("customer_id");
    String customer_name = request.getParameter("customer_name");
    String customer_card_no = request.getParameter("customer_card_no");
    String customer_card_expire = request.getParameter("customer_card_expire");

    // Connection 
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    boolean isCardJOMLOKA = false;

    // Status To Get As Return
    final String SUCCESS = "Success";
    final String FAILED = "failed";
    String status = "";

    // Return Object With Required Detail
    JSONObject objMain = new JSONObject();

    String cardQuery = "UPDATE far_customer "
            + "SET debit_card_no = '" + customer_card_no + "', debit_card_expire = '" + customer_card_expire + "' "
            + "WHERE customer_id = '" + customer_id + "' ";

    isCardJOMLOKA = rmi.setQuerySQL(con.HOST, con.PORT, cardQuery);

    if (isCardJOMLOKA == true) {

        String subject = "Card Details Updated";

        String sender = "mkagtech@mkagtechnologies.com";

        String messageNotify = "Good Day Dear " + customer_name + ". "
                + "Thank you for updating your card details.\n\n"
                + "Following are your transaction information...\n"
                + "User ID : " + customer_id + "\n"
                + "Card Number : " + customer_card_no + "\n"
                + "Card Expire Time : " + customer_card_expire + "";

        String messageEmail = "<h3>Good Day Dear " + customer_name + "!</h3> "
                + "<br/><p>Thank you for updating your card details.</p>"
                + "<br/><br/><p>Following are your transaction information...</p>"
                + "<p>User ID : " + customer_id + "</p>"
                + "<p>Card Number : " + customer_card_no + "</p>"
                + "<p>Card Expire Time : " + customer_card_expire + "</p><br/>";

        Emailer em = new Emailer(customer_id, subject, messageEmail);
        em.sendTextEmail();

        CustomerNotificationSender notify = new CustomerNotificationSender(sender, customer_id, subject, messageNotify);
        notify.sendCustomerInboxNotification();

        status = SUCCESS;

    } else {
        status = FAILED;
    }

    objMain.put("message", status);

    out.print(objMain);


%>