<%-- 
    Document   : orderStockSearchItemResult
    Created on : Dec 13, 2017, 6:22:09 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%

    String id = request.getParameter("id");

    String HEALTH_FACILITY_CODE = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String DISCIPLINE_CODE = (String) session.getAttribute("DISCIPLINE_CODE");

    Conn conn = new Conn();

    //id.toLowerCase();
    //                               0           1          2             3              4                           
    String searchProblem = "SELECT item_cd, category_cd, item_name, selling_price, physical_stock"
            //            FROM CONDITION        
            + " FROM stk_stock_item "
            //            WHERE CONDITION        
            + " where item_cd = '" + id + "' "
            + " AND hfc_cd = '" + HEALTH_FACILITY_CODE + "' AND discipline_cd = '" + DISCIPLINE_CODE + "' ";

    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {

            out.print(String.join("|", search.get(i)));

        }
    }
%>                           
