

<%@page import="ADM_helper.MySessionKey"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String id = request.getParameter("keyword");
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String disc_cd = (String) session.getAttribute(MySessionKey.DISCIPLINE_CD);
    //id.toLowerCase();
    //                                          1               2           3           4               5             6             7               8               9
    String sql_searchDrugDetail = "select m.ud_mdc_code,m.d_gnr_name,m.d_stock_qty,m.d_packaging, m.`D_STRENGTH`, m.`D_QTY`, m.`D_ROUTE_CODE`,m.D_FORM_CODE,m.D_CAUTION_CODE, "
    //                10          11        12              13          14
            + "m.D_FREQUENCY,m.d_qtyt, m.d_duration,m.d_durationt,df.frequency_value from pis_mdc2 m "
            + "INNER JOIN pis_drug_frequency df on df.frequency_desc = m.d_frequency "
            + "WHERE m.D_TRADE_NAME = '" + id + "' AND m.hfc_cd = '"+hfc_cd+"' AND m.discipline_cd='"+disc_cd+"' GROUP BY m.ud_mdc_code;";
    
    String searchProblem = "select  ud_mdc_code,d_gnr_name,d_stock_qty,d_packaging, `D_STRENGTH`, `D_QTY`, `D_ROUTE_CODE`,D_FORM_CODE,D_CAUTION_CODE, D_FREQUENCY,d_qtyt, d_duration,d_durationt  "
            + "from pis_mdc2 where D_TRADE_NAME = '" + id + "' AND hfc_cd = '"+hfc_cd+"' ";
    ArrayList<ArrayList<String>> search = Conn.getData(sql_searchDrugDetail);

    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {

            out.print(String.join("|", search.get(i))+"|");

        }
    }
%>                


