<%-- 
    Document   : queueValidatorForNew
    Created on : Oct 27, 2018, 9:18:01 AM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();

    String hfcCD = session.getAttribute("HEALTH_FACILITY_CODE").toString();

    String searchProblem = " SELECT pmi_no, episode_date, status, user_id, DATE(episode_date) "
            + " FROM pms_patient_queue "
            + " WHERE hfc_cd = '" + hfcCD + "' AND status = '0' "
            + " AND (DATE(episode_date) = DATE(now()));";

    ArrayList<ArrayList<String>> customerData = conn.getData(searchProblem);

    if (customerData.size() > 0) {
        out.print("Got");
    } else {
        out.print("No");
    }

%>