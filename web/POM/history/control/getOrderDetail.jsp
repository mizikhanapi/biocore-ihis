<%-- 
    Document   : getOrderDetail
    Created on : Jan 30, 2018, 9:16:09 AM
    Author     : user
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="ADM_helper.MySessionKey"%>
<%
    
    String order_no = request.getParameter("orderNo");
    
    Conn con = new Conn();
    //                      0               1            2           3                      4
    String query="SELECT procedure_cd, procedure_name, comments, ifnull(outcome, '-'), created_date "
            + "FROM pos_result_detail WHERE order_no='"+order_no+"' ORDER BY created_date DESC;";
    
    ArrayList<ArrayList<String>> dataOrd = con.getData(query);
    
    for(int i=0; i<dataOrd.size(); i++){
        JSONObject obj = new JSONObject();
        obj.put("pro_cd", dataOrd.get(i).get(0));
        obj.put("pro_name", dataOrd.get(i).get(1));
        obj.put("com", dataOrd.get(i).get(2));
        obj.put("out", dataOrd.get(i).get(3));
        obj.put("date", dataOrd.get(i).get(4));
                       
           String evod = (i%2==0)? "even":"odd";
%>
<tr class="clickable_tr <%=evod%>">
    <td><%=dataOrd.get(i).get(0)%></td>
    <td><%=dataOrd.get(i).get(1)%></td>
    <td><%=dataOrd.get(i).get(2)%></td>
    <td><%=dataOrd.get(i).get(3)%></td>
    <td><%=dataOrd.get(i).get(4)%> <input type="hidden" id="OD_json" value='<%=obj.toString()%>'></td>
</tr>
<%
    }//end for
    
%>
