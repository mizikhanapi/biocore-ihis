<%-- 
    Document   : managePastCompleteOrderGetOrder
    Created on : Feb 1, 2018, 7:32:20 PM
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
    //                          0            1            2               3                  4                5             6                     
    String query = "SELECT sd.order_no, sd.item_cd, sd.item_desc, sd.ordered_quantity, sd.released_quantity, sd.comment, sd.txn_date "
            // FROM RESULT TABLE
            + "FROM stk_order_detail sd "
            // JOIN ITEM TABLE
            + "LEFT JOIN stk_stock_item id ON (id.item_cd = sd.item_cd) "
            // WHERE CONDITION
            + "WHERE id.hfc_cd = '" + hfc_cd + "' AND id.discipline_cd = '" + dis_cd + "' AND sd.order_no = '" + order_no + "';";

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
</tr>
<%
    }//end for

%>
