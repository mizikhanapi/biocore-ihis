<%-- 
    Document   : manageMiscCloneCodeList
    Created on : Nov 29, 2017, 12:56:17 PM
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

    String searchProblem = "SELECT item_code,item_desc FROM far_miscellaneous_item WHERE hfc_cd = '" + superUserHFC + "' "
            + " AND item_code NOT IN (SELECT item_code FROM far_miscellaneous_item WHERE hfc_cd = '" + hfc + "' );";

    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {
%>
<option value="<%= search.get(i).get(0)%>">(<%= search.get(i).get(0)%>) <%= search.get(i).get(1)%></option>
<%
    }

} else {
%>
<option disabled>No Miscellaneous Item Found!</option>
<%}%>
