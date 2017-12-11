<%-- 
    Document   : manageStockQuantitySearchItemResult
    Created on : Dec 11, 2017, 12:29:51 PM
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
    String searchProblem = "SELECT ud_mdc_code, ud_atc_code, d_trade_name, d_sell_price, d_stock_qty"
            //            FROM CONDITION        
            + " FROM pis_mdc2 "
            //            WHERE CONDITION        
            + " where ud_mdc_code = '" + id + "' "
            + " AND hfc_cd = '" + HEALTH_FACILITY_CODE + "' AND discipline_cd = '" + DISCIPLINE_CODE + "' ";

    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {

            out.print(String.join("|", search.get(i)));

        }
    }
%>                           
