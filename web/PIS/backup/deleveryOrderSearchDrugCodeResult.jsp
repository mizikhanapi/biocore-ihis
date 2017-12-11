<%-- 
    Document   : deleveryOrderSearchDrugCodeResult
    Created on : May 10, 2017, 4:56:14 AM
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

    String searchProblem = "select mdc.ud_mdc_code,mdc.d_sell_price,mdc.d_stock_qty from pis_mdc2 mdc "
            + " where mdc.d_trade_name = '" + id + "' AND mdc.hfc_cd = '"+HEALTH_FACILITY_CODE+"' "
            + " AND mdc.discipline_cd = '"+DISCIPLINE_CODE+"' ";
    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {
            out.print(String.join("|", search.get(i)));
        }
    }
%>                           

