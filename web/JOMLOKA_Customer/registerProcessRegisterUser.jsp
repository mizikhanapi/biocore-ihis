<%-- 
    Document   : registerProcessRegisterUser
    Created on : Aug 7, 2018, 8:20:47 PM
    Author     : Shammugam
--%>

<%@page import="ADM_helper.TenantHelper"%>
<%@page import="JOMLOKAHelper.CustomerNotificationSender"%>
<%@page import="ADM_helper.Emailer"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="org.json.JSONObject"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Getting Parameter
    String user_id = request.getParameter("user_id");
    String user_phone = request.getParameter("user_phone");
    String user_pass = request.getParameter("user_pass");
    String user_question = request.getParameter("user_question");
    String user_answer = request.getParameter("user_answer");
    String user_name = request.getParameter("user_name");
    String user_title = request.getParameter("user_title");
    String user_gender = request.getParameter("user_gender");
    String user_ic = request.getParameter("user_ic");
    String user_birth = request.getParameter("user_birth");

    // Status To Get As Return
    final String SUCCESS = "Registered";
    final String FAILED = "Failed";

    // Variable to Assign Value
    String status = "";

    // Connection 
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();

    //check whether account_no is available in far_customer_ledger
    //loop until available
    TenantHelper th = new TenantHelper(user_id);
    String account_no = "";
    String query = "";

    String acc_prefix = "JOM";

    do {

        String temp_acc = th.getAccountNo();
        account_no = acc_prefix + temp_acc;

    } while (con.getData(query).size() > 0);

    String queryUserTable = "INSERT INTO adm_users "
            + " (user_id,user_name,status,user_type,user_group,id_category_code,new_icno,birth_date,sex_code,mobile_phone,email,password,title, "
            + " question,answer,created_date,created_by,health_facility_code,start_date,end_date,user_status,occupation_code,home_phone, "
            + " office_phone,fax_no,user_classification_code,mother_name,nationality_code,room_no) "
            + "VALUES('" + user_id + "','" + user_name + "','link','JOMLOKA Customer','JOMLOKA','JOMLOKA','" + user_ic + "','" + user_birth + " 00:00:00', "
            + " '" + user_gender + "','" + user_phone + "','" + user_id + "','" + user_pass + "','" + user_title + "','" + user_question + "', "
            + " '" + user_answer + "',now(),'" + user_id + "','',now(),'9999-12-31 00:00:00','','','','','','','','','');";

    String queryCustomerTable = "INSERT INTO far_customer "
            + " ( customer_id, customer_name, address1, address2, address3, town_cd, district_cd, state_cd, country_cd, postcode, telephone_no, fax_no, email, "
            + " customer_account_no, customer_bank_acc_no, customer_bank_name, debit_card_no, debit_card_expire, jomloka_wallet_no, status, created_by, created_date ) "
            + " VALUES('" + user_id + "', '" + user_name + "', '', '', '', '', '', '', '', '', '" + user_phone + "', '', '" + user_id + "', '" + account_no + "',  "
            + " '', '', '', '', '', '0','" + user_id + "', now()); ";

    String queryLeggerTable = "INSERT into far_customer_ledger "
            + " (customer_id, txn_date, hfc_cd, bill_no) "
            + " VALUES ('" + account_no + "', now(), '" + user_id + "', '' );";

    boolean isInsert = false;
    isInsert = rmi.setQuerySQL(con.HOST, con.PORT, queryUserTable);
    isInsert = rmi.setQuerySQL(con.HOST, con.PORT, queryCustomerTable);
    isInsert = rmi.setQuerySQL(con.HOST, con.PORT, queryLeggerTable);

    if (isInsert) {

        String subject = "Account Registration Successful";

        String sender = "mkagtech@mkagtechnologies.com";

        String messageNotify = "Good Day Dear " + user_name + ". "
                + "Thank you for registering with us.\n\n"
                + "Following are your ID information...\n"
                + "User ID : " + user_id + "\n"
                + "IC Number : " + user_ic + "\n"
                + "Password : " + user_pass + "";

        String messageEmail = "<h3>Good Day Dear " + user_name + "!</h3> "
                + "<br/><p>Thank you for registering with us.</p>"
                + "<br/><br/><p>Following are your ID information...</p>"
                + "<p>User ID : " + user_id + "</p>"
                + "<p>IC Number : " + user_ic + "</p>"
                + "<p>Password : " + user_pass + "</p><br/>";

        Emailer em = new Emailer(user_id, subject, messageEmail);
        em.sendTextEmail();

        CustomerNotificationSender notify = new CustomerNotificationSender(sender, user_id, subject, messageNotify);
        notify.sendCustomerInboxNotification();

        status = SUCCESS;

    } else {

        status = FAILED;

    }

    // Return Object With Required Detail
    JSONObject obj = new JSONObject();

    obj.put("message", status);

    out.print(obj);

%>