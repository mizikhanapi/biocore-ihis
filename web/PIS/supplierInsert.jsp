<%-- 
    Document   : supplierInsert
    Created on : Jan 25, 2017, 9:43:35 PM
    Author     : Shammugam
--%>


<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    LocalDateTime now = LocalDateTime.now();

    String vendor_id = request.getParameter("vendor_ID");
    String vendor_name = request.getParameter("vendor_Name");
    String vendor_bank_acc_no = request.getParameter("vendor_Bank_Acc");
    String vendor_bank_cd = request.getParameter("vendor_Bank_Code");
    String address1 = request.getParameter("vendor_address1");
    String address2 = request.getParameter("vendor_address2");
    String address3 = request.getParameter("vendor_address3");

    String towncode = request.getParameter("vendor_Towncode");
    String poscode = request.getParameter("vendor_Postcode");
    String district = request.getParameter("vendor_District");
    String state = request.getParameter("vendor_State");
    String country = request.getParameter("vendor_Country");
    String telephone_no = request.getParameter("vendor_telephone_no");
    String fax_no = request.getParameter("vendor_fax_no");
    String email = request.getParameter("vendor_email");
    String gl_code = request.getParameter("vendor_GL_Code");
    String roc_no = request.getParameter("vendor_ROC_No");

    String registration_date = format.format(now);
    String contact_person = request.getParameter("vendor_Contact_Person");
    String payment_term = request.getParameter("vendor_Payment_Term");
    String acc_type = request.getParameter("vendor_Account_Type");
    String credit_limit = request.getParameter("vendor_Credit_Limit");
    String currency = request.getParameter("vendor_Currency");
    String status = request.getParameter("vendor_Status");
    String created_by = session.getAttribute("USER_ID").toString();
    String created_date = format.format(now);
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlCheck = "SELECT vendor_id from fap_vendor WHERE vendor_id = '" + vendor_id + "' AND hfc_cd  = '" + hfc_cd + "' LIMIT 1 ";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);

    if (duplicate.size() > 0) {
        out.print("Duplicate");
    } else {

        String sqlInsert = "INSERT INTO fap_vendor (vendor_id,vendor_name,vendor_bank_acc_no,vendor_bank_cd,address1,address2,address3,"
                + "towncode,poscode,district,state,country,telephone_no,fax_no,email,gl_code,roc_no,registration_date,contact_person,"
                + "payment_term,acc_type,credit_limit,currency,status,created_by,created_date,hfc_cd)"
                + " VALUES ('" + vendor_id + "','" + vendor_name + "','" + vendor_bank_acc_no + "','" + vendor_bank_cd + "','" + address1 + "',"
                + "'" + address2 + "','" + address3 + "','" + towncode + "','" + poscode + "','" + district + "','" + state + "',"
                + "'" + country + "','" + telephone_no + "','" + fax_no + "','" + email + "','" + gl_code + "','" + roc_no + "',"
                + "'" + registration_date + "','" + contact_person + "','" + payment_term + "','" + acc_type + "','" + credit_limit + "',"
                + "'" + currency + "','" + status + "','" + created_by + "','" + created_date + "','" + hfc_cd + "' )";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }

    }

%>