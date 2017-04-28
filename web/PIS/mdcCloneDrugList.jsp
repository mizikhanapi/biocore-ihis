<%-- 
    Document   : mdcCloneDrugList
    Created on : Apr 26, 2017, 10:34:46 AM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();

    String superUserHFC = "99_iHIS_99";
    String superUserDIS = "BIT1010";

    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();

    String searchProblem = "SELECT UD_MDC_CODE,D_TRADE_NAME FROM pis_mdc2 WHERE hfc_cd = '"+superUserHFC+"' AND discipline_cd = '"+superUserDIS+"' "
            + " AND UD_MDC_CODE NOT IN (SELECT UD_MDC_CODE FROM pis_mdc2 WHERE hfc_cd = '"+hfc+"' AND discipline_cd = '"+dis+"');";

    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {
%>
<option value="<%= search.get(i).get(0)%>">(<%= search.get(i).get(0)%>) <%= search.get(i).get(1)%></option>
<%
    }

} else {
%>
<option disabled>No MDC Drug Found!</option>
<%}%>
