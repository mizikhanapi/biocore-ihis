<%-- 
    Document   : SearchDTO_cd
    Created on : 07-Feb-2017, 12:46:50
    Author     : ahmed
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
     Conn Conn = new Conn();
    //String key = request.getParameter("input");
    String id = request.getParameter("id");
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    
    //id.toLowerCase();
    String searchProblem = "select ud_mdc_code,d_gnr_name,d_stock_qty,d_packaging, `D_STRENGTH`, `D_QTY`, `D_ROUTE_CODE`,D_FORM_CODE,D_CAUTION_CODE, D_FREQUENCY from pis_mdc2 where d_trade_name = '" + id + "' AND hfc_cd = '"+hfc_cd+"' ";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    if (search.size() > 0) {
        
        for (int i = 0; i < search.size(); i++) {

//            out.println(search.get(i).get(0));
//            out.println(search.get(i).get(1));
//            out.println(search.get(i).get(2));
            out.print(String.join("|", search.get(i)));
        }
    }
%>                           

