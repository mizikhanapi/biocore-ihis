<%-- 
    Document   : manageStockCodeCateCloneDrugList
    Created on : Nov 14, 2017, 12:41:46 PM
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

    String searchProblem = "SELECT category_cd,category_name FROM stk_stock_category WHERE hfc_cd = '"+superUserHFC+"' "
            + " AND category_cd NOT IN (SELECT category_cd FROM stk_stock_category WHERE hfc_cd = '"+hfc+"'  AND discipline_cd = '"+dis+"');";

    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {
%>
<option value="<%= search.get(i).get(0)%>">(<%= search.get(i).get(0)%>) <%= search.get(i).get(1)%></option>
<%
    }

} else {
%>
<option disabled>No Stock Category Found!</option>
<%}%>
