<%-- 
    Document   : manageTestCodeDetailCloneDrugList
    Created on : Jan 12, 2018, 11:59:46 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();

    String superUserHFC = "99_iHIS_99";
    String superUserDIS = "99_iHIS_99";

    String code = request.getParameter("code");

    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();

    String searchProblem = "SELECT item_cd,item_name FROM lis_item_detail WHERE hfc_cd = '" + superUserHFC + "' AND test_cat = '" + code + "' "
            + " AND item_cd NOT IN (SELECT item_cd FROM lis_item_detail WHERE hfc_cd = '" + hfc + "' AND test_cat = '" + code + "'  );";

    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {
%>
<option value="<%= search.get(i).get(0)%>">(<%= search.get(i).get(0)%>) <%= search.get(i).get(1)%></option>
<%
    }

} else {
%>
<option disabled>No Test Detail Found!</option>
<%}%>
