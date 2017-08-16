<%-- 
    Document   : atcCloneDrugList
    Created on : May 4, 2017, 9:55:01 PM
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

    String searchProblem = "SELECT UD_ATC_Code,UD_ATC_Desc FROM pis_atc WHERE hfc_cd = '"+superUserHFC+"' "
            + " AND UD_ATC_Code NOT IN (SELECT UD_ATC_Code FROM pis_atc WHERE hfc_cd = '"+hfc+"'  AND discipline_cd = '"+dis+"');";

    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {
%>
<option value="<%= search.get(i).get(0)%>">(<%= search.get(i).get(0)%>) <%= search.get(i).get(1)%></option>
<%
    }

} else {
%>
<option disabled>No ATC Drug Found!</option>
<%}%>
