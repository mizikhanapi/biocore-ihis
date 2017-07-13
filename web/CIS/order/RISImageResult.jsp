<%-- 
    Document   : RISImageResult
    Created on : Jul 13, 2017, 4:44:04 PM
    Author     : -D-
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();

    String orderNo = request.getParameter("orderNo");
    String bsCode = request.getParameter("bsCode");
    String modCode = request.getParameter("modCode");
    String proCode = request.getParameter("proCode");

    String query = "Select ifnull(convert(result_image using utf8), '') from ris_result_detail "
            + "where order_no = '" + orderNo + "' AND modality_cd = '" + modCode + "' AND body_system_cd = '" + bsCode + "' AND procedure_cd = '" + proCode + "' ";

    ArrayList<ArrayList<String>> dataLogo = conn.getData(query);

    String gamba = dataLogo.get(0).get(0);

   out.print(gamba);
%>
