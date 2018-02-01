<%-- 
    Document   : managePastCompleteOrderGetOrder
    Created on : Feb 1, 2018, 4:10:43 PM
    Author     : Shammugam
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="ADM_helper.MySessionKey"%>
<%
    String hfc_cd = (String) session.getAttribute(MySessionKey.HFC_CD);
    String order_no = request.getParameter("orderNo");

    Conn con = new Conn();
    //                          0            1          2           3          4            5             6            7             8                  9           10             
    String query = "SELECT rd.result_no, rd.result, rd.remark, rd.item_cd, rd.pmi_no, rd.specimen_no, rd.test_name, rd.order_no, rd.verification, rd.picture, rd.verify_by "
            // FROM RESULT TABLE
            + "FROM lis_result rd "
            // JOIN SPECIMEN DETAILS TABLE
            + "LEFT JOIN lis_specimen_detail sd ON (sd.specimen_no = rd.specimen_no) AND (sd.item_cd = rd.item_cd) AND (sd.result_no = rd.result_no) "
            // JOIN ITEM TABLE
            + "LEFT JOIN lis_item_detail id ON (id.item_cd = rd.item_cd) "
            // WHERE CONDITION
            + "WHERE id.hfc_cd = '" + hfc_cd + "' AND rd.order_no = '" + order_no + "';";

    ArrayList<ArrayList<String>> dataOrd = con.getData(query);

    out.print(query);

    for (int i = 0; i < dataOrd.size(); i++) {
        JSONObject obj = new JSONObject();
        obj.put("result_no", dataOrd.get(i).get(0));
        obj.put("result", dataOrd.get(i).get(1));
        obj.put("remark", dataOrd.get(i).get(2));
        obj.put("item_cd", dataOrd.get(i).get(3));
        obj.put("pmi_no", dataOrd.get(i).get(4));
        obj.put("specimen_no", dataOrd.get(i).get(5));
        obj.put("test_name", dataOrd.get(i).get(6));
        obj.put("order_no", dataOrd.get(i).get(7));
        obj.put("verification", dataOrd.get(i).get(8));
        obj.put("verify_by", dataOrd.get(i).get(8));

        String evod = (i % 2 == 0) ? "even" : "odd";
%>
<tr class="clickable_tr <%=evod%>">
    <td><%=dataOrd.get(i).get(3)%></td>
    <td><%=dataOrd.get(i).get(6)%></td>
    <td><%=dataOrd.get(i).get(1)%></td>
    <td><%=dataOrd.get(i).get(2)%></td>
    <td><%=dataOrd.get(i).get(5)%></td>
    <td><%=dataOrd.get(i).get(8)%> <input type="hidden" id="OD_json" value='<%=obj.toString()%>'></td>
</tr>
<%
    }//end for

%>
