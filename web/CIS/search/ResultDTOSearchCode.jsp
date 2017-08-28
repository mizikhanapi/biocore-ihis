

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String id = request.getParameter("keyword");
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    //id.toLowerCase();
    String searchProblem = "select  ud_mdc_code,d_gnr_name,d_stock_qty,d_packaging, `D_STRENGTH`, `D_QTY`, `D_ROUTE_CODE`,D_FORM_CODE,D_CAUTION_CODE, D_FREQUENCY,d_qtyt, d_duration,d_durationt  "
            + "from pis_mdc2 where D_TRADE_NAME = '" + id + "' AND hfc_cd = '"+hfc_cd+"' ";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);

    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {

            out.print(String.join("|", search.get(i))+"|");

        }
    }
%>                


