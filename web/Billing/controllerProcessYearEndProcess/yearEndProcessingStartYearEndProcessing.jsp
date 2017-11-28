<%-- 
    Document   : yearEndProcessingStartYearEndProcessing
    Created on : Nov 22, 2017, 9:30:15 PM
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

    status = yep.doStartYearEndProcess();

    if (status == 0) {

        String infoMessage = "The year end process of current year have been done.\nPlease go to report section to view year end report.";

        out.print("-|1|" + infoMessage + "|" + status);

    } else if (status == 50) {

        String infoMessage = "There is an error during processing.\n"
                + "Please restore the customer data and repeat the year end processing.";

        out.print("-|-1|" + infoMessage + "|" + status);

    } else if (status == 100) {

        String infoMessage = "The year end processing is completed.";

        out.print("-|1|" + infoMessage + "|" + status);

    }

%>