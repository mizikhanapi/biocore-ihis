<%-- 
    Document   : insertTenant
    Created on : Jul 20, 2018, 9:03:38 AM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="ADM_helper.MySessionKey"%>
<%@page import="org.json.JSONObject"%>
<%@page import="ADM_helper.TenantHelper"%>
<%@page import="Config.Config"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Config.getBase_url(request);
    Config.getFile_url(session);

    String created_by = (String) session.getAttribute(MySessionKey.USER_ID);
    String user_group = (String) session.getAttribute(MySessionKey.USER_GROUP);

    String provider = request.getParameter("provider");
    String buildingNo = request.getParameter("buildingNo");
    String street = request.getParameter("street");
    String postcode = request.getParameter("postcode");
    String town = request.getParameter("town");
    String district = request.getParameter("district");
    String state = request.getParameter("state");
    String country = request.getParameter("country");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String bankName = request.getParameter("bankName");
    String bankAcc = request.getParameter("bankAcc");
    String pack = request.getParameter("package");
    String file1 = request.getParameter("file1");
    String file2 = request.getParameter("file2");

    String tenant_code = "";
    String query = "";
    int intEnd = 0;
    boolean isInsert = false;
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    // get the tenant_code by taking initial from the provider name
    // check in the database whether the code is used or not.
    //if used, append a digit starting from 1. Digit++ until the code is unique.
    //insert into the table to avoid duplication
    String[] arrProv = provider.split(" ");
    for (String arr : arrProv) {
        tenant_code += arr.charAt(0);
    }

    do {
        intEnd++;
        tenant_code += intEnd;
        query = "INSERT into adm_tenant(tnt_cd, tnt_name, package_type, address1, address2, town_cd, district_cd, state_cd, postcode, telephone_no, email, start_date, end_date, created_date, created_by, bank_name, bank_account_no, country_cd) "
                + "VALUES('" + tenant_code + "', '" + provider + "', '" + pack + "', '" + buildingNo + "', '" + street + "', '" + town + "', '" + district + "', '" + state + "', '" + postcode + "', '" + phone + "', '" + email + "', now(), '9999-12-31', now(), '" + created_by + "', '" + bankName + "', '" + bankAcc + "', '" + country + "');";
        isInsert = rmi.setQuerySQL(con.HOST, con.PORT, query);
    } while (!isInsert && intEnd < 100);

    JSONObject json = new JSONObject();
    if (!isInsert) {
        json.put("isValid", isInsert);
        json.put("msg", "<b class='text-danger'>Something went wrong. Please try again later.</b>");
        json.put("sql", query);
        out.print(json.toString());
        return;
    }

    //check whether account_no is available in far_customer_ledger
    //loop until available
    TenantHelper th = new TenantHelper(created_by);
    String account_no = "";

    String acc_prefix = "HIS";
    if ("JOMLOKA".equals(user_group)) {
        acc_prefix = "JOM";
    }

    do {
        String temp_acc = th.getAccountNo();
        account_no = acc_prefix + temp_acc;
        query = "SELECT customer_id FROM far_customer_ledger WHERE customer_id='" + account_no + "' limit 1;";
    } while (con.getData(query).size() > 0);

    query = "INSERT into far_customer_ledger(customer_id, txn_date, hfc_cd, bill_no) "
            + "VALUES ('" + account_no + "', now(), '" + tenant_code + "', '' );";
    isInsert = rmi.setQuerySQL(con.HOST, con.PORT, query);
    if (!isInsert) {
        json.put("isValid", isInsert);
        json.put("msg", "<b class='text-danger'>Something went wrong. Please try again later.</b>");
        json.put("sql", query);
        out.print(json.toString());
        return;
    }

    query = "UPDATE adm_tenant set business_license='" + file2 + "', practicing_certificate='" + file1 + "', account_no='" + account_no + "', user_id='" + created_by + "', tnt_type='" + user_group + "' WHERE tnt_cd='" + tenant_code + "';";
    isInsert = rmi.setQuerySQL(con.HOST, con.PORT, query);
    if (!isInsert) {
        json.put("isValid", isInsert);
        json.put("msg", "<b class='text-danger'>Something went wrong. Please try again later.</b>");
        json.put("sql", query);
        out.print(json.toString());
        return;
    }

    query = "UPDATE adm_users set `HEALTH_FACILITY_CODE`='" + tenant_code + "' WHERE `USER_ID`='" + created_by + "';";
    isInsert = rmi.setQuerySQL(con.HOST, con.PORT, query);
    if (!isInsert) {
        json.put("isValid", isInsert);
        json.put("msg", "<b class='text-danger'>Something went wrong. Please try again later.</b>");
        json.put("sql", query);
        out.print(json.toString());
        return;
    }

    session.setAttribute(MySessionKey.TENANT_CD, tenant_code);
    session.setAttribute(MySessionKey.TENANT_NAME, provider);
    json.put("isValid", isInsert);
    json.put("msg", "Your tenant is successfully created!");
    json.put("url", "home.jsp");
    json.put("sql", query);
    out.print(json.toString());

%>
