<%-- 
    Document   : hfc_insert
    Created on : Apr 15, 2018, 6:41:46 PM
    Author     : user
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="ADM_helper.MySessionKey"%>
<%@page import="dBConn.Conn"%>
<%@page import="Formatter.FormatTarikh"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conn conn = new Conn();
    String hfcName = request.getParameter("hfcName");
    String hfcCode = request.getParameter("hfcCode");
    String address1 = request.getParameter("address1");
    String address2 = request.getParameter("address2");
    String address3 = request.getParameter("address3");
    String state = request.getParameter("state");
    String district = request.getParameter("district");
    String town = request.getParameter("town");
    String postcode = request.getParameter("postcode");
    String faxNo = request.getParameter("faxNo");
    String telNo = request.getParameter("telNo");
    String email = request.getParameter("email");
    String contactPerson = request.getParameter("contactPerson");
    String ipNo = request.getParameter("IP_NO");
    String server = request.getParameter("server");
    String category = request.getParameter("category");
    String type = request.getParameter("type");
    String subtype = request.getParameter("subtype");
    String director = request.getParameter("director");
    String establishDate = request.getParameter("establishDate");
    String logo = request.getParameter("logo");
    
    String tenant_cd = (String) session.getAttribute(MySessionKey.TENANT_CD);
    String status = "2"; // 2 means waiting to be approved

    String sqlCheck = "SELECT hfc_cd from adm_health_facility WHERE hfc_cd = '" + hfcCode + "' LIMIT 1 ";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);

    RMIConnector rmic = new RMIConnector();
    boolean isInsert = false;
    JSONObject json = new JSONObject();
    String msg="";

    if (duplicate.size() > 0) {
        msg = "Sorry, the code " + hfcCode + " is already used. Please enter different code.";
    } else if (!establishDate.equalsIgnoreCase("")) {

        establishDate = FormatTarikh.formatDate(establishDate, "dd/MM/yyyy", "yyyy-MM-dd HH:mm:ss.ms");

        String sqlInsert = "INSERT INTO adm_health_facility(hfc_cd, hfc_type, hfc_name, address1, address2, address3, state_cd, district_cd, town_cd, country_cd, postcode, telephone_no, fax_no, email, hfc_server, hfc_report, established_date, director_name, hfc_category_cd, hfc_sub_type, contact_person, hfc_status, hfc_ip, logo) "
                + "VALUES('" + hfcCode + "', '" + type + "', '" + hfcName + "', '" + address1 + "', '" + address2 + "', '" + address3 + "', '" + state + "', '" + district + "', '" + town + "', '001', '" + postcode + "', '" + telNo + "', '" + faxNo + "', '" + email + "', '" + server + "', '" + tenant_cd + "', '" + establishDate + "', '" + director + "', '" + category + "', '" + subtype + "', '" + contactPerson + "', '" + status + "', '" + ipNo + "', '" + logo + "')";

        isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            msg="Health facility is registered successfully. We will notify you via email once the registration is approved.";
        } else {
            msg="Opps! Something went wrong. Try again later.";
        }
    } else if (establishDate.equalsIgnoreCase("")) {

        String sqlInsert = "INSERT INTO adm_health_facility(hfc_cd, hfc_type, hfc_name, address1, address2, address3, state_cd, district_cd, town_cd, country_cd, postcode, telephone_no, fax_no, email, hfc_server, hfc_report, director_name, hfc_category_cd, hfc_sub_type, contact_person, hfc_status, hfc_ip, logo) "
                + "VALUES('" + hfcCode + "', '" + type + "', '" + hfcName + "', '" + address1 + "', '" + address2 + "', '" + address3 + "', '" + state + "', '" + district + "', '" + town + "', '001', '" + postcode + "', '" + telNo + "', '" + faxNo + "', '" + email + "', '" + server + "', '" + tenant_cd + "', '" + director + "', '" + category + "', '" + subtype + "', '" + contactPerson + "', '" + status + "', '" + ipNo + "', '" + logo + "')";

        isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            msg="Health facility is registered successfully. We will notify you via email once the registration is approved.";
        } else {
            msg="Opps! Something went wrong. Try again later.";
        }     
    

    }
    
    json.put("msg", msg);
    json.put("isValid", isInsert);
    out.print(json.toString());
%>
