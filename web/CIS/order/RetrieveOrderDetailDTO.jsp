<%-- 
    Document   : ResultSearchOrderROS
    Created on : Jul 11, 2017, 9:51:38 PM
    Author     : -D-
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();

    String orderId = request.getParameter("orderId");
    String itemCode = request.getParameter("drug_cd");
    String hfcTo = request.getParameter("hfc_to");
    String searchProblem = "";

    searchProblem = "SELECT om.order_no,om.hfc_to,hf.hfc_name,od.drug_item_code,id.d_trade_name  "
            + "FROM pis_order_master om "
            + "JOIN pis_order_detail od "
            + "JOIN pis_mdc2 id "
            + "JOIN adm_health_facility hf "
            + "WHERE om.order_no = od.order_no "
            + "AND od.drug_item_code = id.ud_mdc_code "
            + "AND om.hfc_to = hf.hfc_cd "
            + "AND om.order_no = '" + orderId + "'  "
            + "AND od.drug_item_code = '" + itemCode + "' "
            + "AND om.hfc_to = '" + hfcTo + "' "
            + "GROUP BY od.order_no;";

    //out.print(searchProblem);
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);

    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {

            out.print(String.join("|", search.get(i)));
        }
    }


%>