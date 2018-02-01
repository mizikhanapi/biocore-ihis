<%-- 
    Document   : managePastCompleteOrderGetOrder
    Created on : Feb 1, 2018, 7:00:37 PM
    Author     : Shammugam
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="ADM_helper.MySessionKey"%>
<%
    String hfc_cd = (String) session.getAttribute(MySessionKey.HFC_CD);
    String dis_cd = (String) session.getAttribute(MySessionKey.DISCIPLINE_CD);
    String order_no = request.getParameter("orderNo");

    Conn con = new Conn();
    //                          0            1                      2               3                  4                5             6              7             
    String query = "SELECT pd.ORDER_NO, pd.DRUG_ITEM_CODE, pd.DRUG_ITEM_DESC, pd.DRUG_FREQUENCY, pd.DRUG_ROUTE, pd.QTY_ORDERED, pd.QTY_SUPPLIED, pd.COMMENT "
            // FROM RESULT TABLE
            + "FROM pis_order_detail pd "
            // JOIN ITEM TABLE
            + "LEFT JOIN pis_mdc2 id ON (id.ud_mdc_code = pd.DRUG_ITEM_CODE) "
            // WHERE CONDITION
            + "WHERE id.hfc_cd = '" + hfc_cd + "' AND id.discipline_cd = '" + dis_cd + "' AND pd.order_no = '" + order_no + "';";

    ArrayList<ArrayList<String>> dataOrd = con.getData(query);

    out.print(query);

    for (int i = 0; i < dataOrd.size(); i++) {

        String evod = (i % 2 == 0) ? "even" : "odd";
%>
<tr class="clickable_tr <%=evod%>">
    <td><%=dataOrd.get(i).get(1)%></td>
    <td><%=dataOrd.get(i).get(2)%></td>
    <td><%=dataOrd.get(i).get(3)%></td>
    <td><%=dataOrd.get(i).get(4)%></td>
    <td><%=dataOrd.get(i).get(5)%></td>
    <td><%=dataOrd.get(i).get(6)%></td>
    <td><%=dataOrd.get(i).get(7)%></td>
</tr>
<%
    }//end for

%>
