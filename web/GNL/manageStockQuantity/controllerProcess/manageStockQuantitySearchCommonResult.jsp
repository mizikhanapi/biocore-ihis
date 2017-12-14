<%-- 
    Document   : manageStockQuantitySearchCommonResult
    Created on : Dec 14, 2017, 5:05:40 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%

    String id = request.getParameter("id");
    String moduleCode = request.getParameter("moduleCode");

    String HEALTH_FACILITY_CODE = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String DISCIPLINE_CODE = (String) session.getAttribute("DISCIPLINE_CODE");

    Conn conn = new Conn();

    String searchProblem = "";

    if (moduleCode.equalsIgnoreCase("04")) {

        //                               0           1          2             3              4                           
        searchProblem = "SELECT ud_mdc_code, ud_atc_code, d_trade_name, d_sell_price, d_stock_qty"
                //            FROM CONDITION        
                + " FROM pis_mdc2 "
                //            WHERE CONDITION        
                + " where ud_mdc_code = '" + id + "' "
                + " AND hfc_cd = '" + HEALTH_FACILITY_CODE + "' AND discipline_cd = '" + DISCIPLINE_CODE + "' ";

    } else if (moduleCode.equalsIgnoreCase("22")) {

        //                               0           1          2             3              4                           
        searchProblem = "SELECT item_cd, category_cd, item_name, selling_price, physical_stock"
                //            FROM CONDITION        
                + " FROM stk_stock_item "
                //            WHERE CONDITION        
                + " where item_cd = '" + id + "' "
                + " AND hfc_cd = '" + HEALTH_FACILITY_CODE + "' AND discipline_cd = '" + DISCIPLINE_CODE + "' ";

    }

    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {

            out.print(String.join("|", search.get(i)));

        }
    }
%>                           
