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
    String procedure_cd = request.getParameter("procedure_cd");
    String hfcTo = request.getParameter("hfc_to");
    String level = request.getParameter("level");
    String searchProblem = "";

    if (level.equals("2")) {
        searchProblem = "SELECT om.hfc_to,hf.hfc_name, p.`PROCEDURE_CD`,p.`PROCEDURE_NAME`,p1.`PROCEDURE_1_CD`, p1.`PROCEDURE_1_NAME`, p2.`PROCEDURE_2_CD`, p2.`PROCEDURE_2_NAME` "
                + "FROM cis_procedure p "
                + "JOIN cis_procedure_1 p1 "
                + "JOIN cis_procedure_2 p2 "
                + "JOIN pos_order_master om  "
                + "JOIN pos_order_detail od  "
                + "JOIN adm_health_facility hf  "
                + "WHERE p.`PROCEDURE_CD` = p1.`PROCEDURE_CD`  "
                + "AND p1.`PROCEDURE_1_CD` = p2.`PROCEDURE_1_CD`  "
                + "AND p.hfc_cd = p1.hfc_cd "
                + "AND p1.hfc_cd = p2.hfc_cd  "
                + "AND om.order_no = od.order_no  "
                + "AND om.hfc_to = hf.hfc_cd "
                + "AND om.order_no = '"+orderId+"'  "
                + "AND p2.`PROCEDURE_2_CD` = '"+procedure_cd+"'  "
                + "AND p.hfc_cd = '"+hfcTo+"'; ";
    } else if(level.equals("1")){
        searchProblem = "SELECT om.hfc_to,hf.hfc_name, p.`PROCEDURE_CD`,p.`PROCEDURE_NAME`,p1.`PROCEDURE_1_CD`, p1.`PROCEDURE_1_NAME` "
                + "FROM cis_procedure p  "
                + "JOIN cis_procedure_1 p1  "
                + "JOIN pos_order_master om  "
                + "JOIN pos_order_detail od "
                + "JOIN adm_health_facility hf "
                + "WHERE p.`PROCEDURE_CD` = p1.`PROCEDURE_CD` "
                + "AND p.hfc_cd = p1.hfc_cd "
                + "AND om.order_no = od.order_no  "
                + "AND om.hfc_to = hf.hfc_cd "
                + "AND om.order_no = '"+orderId+"'  "
                + "AND p1.`PROCEDURE_1_CD` = '"+procedure_cd+"' "
                + "AND p.hfc_cd = '"+hfcTo+"'; ";

    } else if(level.equals("0")){
        searchProblem = "SELECT om.hfc_to,hf.hfc_name, p.`PROCEDURE_CD`,p.`PROCEDURE_NAME` "
                + "FROM cis_procedure p "
                + "JOIN pos_order_master om "
                + "JOIN pos_order_detail od "
                + "JOIN adm_health_facility hf "
                + "WHERE om.order_no = od.order_no  "
                + "AND om.hfc_to = hf.hfc_cd "
                + "AND om.order_no = '"+orderId+"' "
                + "AND p.`PROCEDURE_CD` = '"+procedure_cd+"' "
                + "AND p.hfc_cd = '"+hfcTo+"'; ";
    }

    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);

    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {

            out.print(String.join("|", search.get(i)));
        }
    }


%>