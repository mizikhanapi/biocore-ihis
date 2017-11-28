<%-- 
    Document   : yearEndProcessingRestoreCustomerData
    Created on : Nov 27, 2017, 12:13:17 PM
    Author     : Shammugam
--%>

<%@page import="BILLING_helper.YearEndProcessing"%>
<%

    String userID = session.getAttribute("USER_ID").toString();
    String hfcCD = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String disCD = session.getAttribute("DISCIPLINE_CODE").toString();
    String subCD = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    YearEndProcessing yep = new YearEndProcessing(userID, hfcCD, disCD, subCD);

    int status = 0;

    status = yep.doRestoreCustomerData();

    if (status == 100) {

        String infoMessage = "The data has been restored.";

        out.print("-|1|" + infoMessage + "|" + status);

    } else {

        String infoMessage = "There is an error during restoring process.\n"
                + "Please contact computer technician for fixing the issue.";

        out.print("-|-1|" + infoMessage + "|" + status);

    }

%>