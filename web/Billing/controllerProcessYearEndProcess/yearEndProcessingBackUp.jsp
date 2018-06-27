<%-- 
    Document   : yearEndProcessingBackUp
    Created on : Nov 21, 2017, 11:23:32 AM
    Author     : Shammugam
--%>

<%@page import="ADM_helper.MySession"%>
<%@page import="BILLING_helper.YearEndProcessing"%>
<%

    String userID = session.getAttribute("USER_ID").toString();
    String hfcCD = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String disCD = session.getAttribute("DISCIPLINE_CODE").toString();
    String subCD = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    String year = request.getParameter("year");

    String roleCode = session.getAttribute("ROLE_CODE").toString();

    String systemAdmin = "001";

    MySession superUser = new MySession(userID, hfcCD);

    if (roleCode.equalsIgnoreCase(systemAdmin) || superUser.isSuperUser() == true) {

        YearEndProcessing yep = new YearEndProcessing(userID, hfcCD, disCD, subCD, year);

        int status = 0;

        status = yep.doBackUpData();

        if (status == 100) {

            String infoMessage = "Data has been backed up. Please proceed to the next process by pressing the next button.";

            out.print("-|1|" + infoMessage + "|" + status);

        } else {

            String infoMessage = "There is an error during backup process.\n"
                    + "Please contact computer technician for fixing the issue.";

            out.print("-|-1|" + infoMessage + "|" + status);

        }

    } else {

        String infoMessage = "Invalid Operation Access.\n"
                + "You are not authorised to run year end processing !!!";

        out.print("-|-2|" + infoMessage + "|0");

    }


%>