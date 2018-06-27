<%-- 
    Document   : yearEndProcessingStartYearEndProcessing
    Created on : Nov 22, 2017, 9:30:15 PM
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

        status = yep.doStartYearEndProcessUpdated();

        if (status == 0) {

            String infoMessage = "The year end process of selected year already have been done.\n Please go to customer account report section to view year end report.";

            out.print("-|1|" + infoMessage + "|" + status);

        } else if (status == 50) {

            String infoMessage = "There is an error during processing.\n"
                    + " Please restore the customer data and repeat the year end processing. Please go to report section to view year end report.";

            out.print("-|-1|" + infoMessage + "|" + status);

        } else if (status == 100) {

            String infoMessage = "The year end processing is completed. Report can be view in the customer account report section. ";

            out.print("-|1|" + infoMessage + "|" + status);

        }

    } else {

        String infoMessage = "Invalid Operation Access.\n"
                + "You are not authorised to run year end processing !!!";

        out.print("-|-2|" + infoMessage + "|0");

    }

%>