<%-- 
    Document   : freqCloneDrugList
    Created on : Sep 6, 2017, 11:00:39 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();

    String superUserHFC = "99_iHIS_99";
    String superUserDIS = "99_iHIS_99";

    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();

    String searchProblem = "SELECT frequency_code,frequency_desc FROM pis_drug_frequency WHERE hfc_cd = '"+superUserHFC+"' "
            + " AND frequency_code NOT IN (SELECT frequency_code FROM pis_drug_frequency WHERE hfc_cd = '"+hfc+"'  AND discipline_cd = '"+dis+"');";

    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {
%>
<option value="<%= search.get(i).get(0)%>">(<%= search.get(i).get(0)%>) <%= search.get(i).get(1)%></option>
<%
    }

} else {
%>
<option disabled>No Drug Frequency Found!</option>
<%}%>
