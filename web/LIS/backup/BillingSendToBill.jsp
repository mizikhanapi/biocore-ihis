<%-- 
    Document   : BillingSendToBill
    Created on : Nov 7, 2017, 7:08:21 PM
    Author     : Shammugam
--%>

<%@page import="LIS_helper.EHRMessageSender"%>
<%

    String userID = (String) session.getAttribute("USER_ID");
    String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String dis = (String) session.getAttribute("DISCIPLINE_CODE");
    String subdis = (String) session.getAttribute("SUB_DISCIPLINE_CODE");

    String longString = request.getParameter("longData");

    String[] bigFields = longString.split("\\^");

    EHRMessageSender ems;

    for (int i = 0; i < bigFields.length; i++) {
        String[] smallFields = bigFields[i].split("\\|");
        ems = new EHRMessageSender(userID, hfc, dis, subdis, smallFields[1], smallFields[0], smallFields[2], smallFields[3], smallFields[4]);
        //ems.updateLOMBillingStatus();
        ems.insertIntoEHR_FAR("05");

    }

    out.print("success");


%>
