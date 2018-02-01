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
    String hfc_cd = (String) session.getAttribute(MySessionKey.HFC_CD);
    String order_no = request.getParameter("orderNo");
    
    Conn con = new Conn();
    //                          0               1                       2               3                       4                       5                   6                   7                   8                   
    String query="SELECT res.category_cd, cat.category_name, res.procedure_cd, pro.`procedure_shortName`, pro.`procedure_longName`, res.comments, res.`startDateTime`, res.`endDateTime`, "
            //          8           9               10                  11
            + "res.minutes, res.ot_room_no ,ifnull(rep.`USER_NAME`, 'unknown'), ifnull(con.`USER_NAME`, 'unknown') "
            + "FROM opt_result res "
            + "LEFT JOIN opt_procedure_category cat ON cat.category_cd=res.category_cd AND cat.hfc_cd=res.hfc_cd "
            + "LEFT JOIN opt_procedure pro ON pro.category_cd=res.category_cd AND pro.procedure_cd=res.procedure_cd AND pro.hfc_cd=res.hfc_cd "
            + "LEFT JOIN adm_users rep ON rep.`USER_ID`=res.created_by "
            + "LEFT JOIN adm_users con ON con.`USER_ID`=res.consultant_id "
            + "WHERE res.hfc_cd='"+hfc_cd+"' AND res.order_no='"+order_no+"';";
    
    ArrayList<ArrayList<String>> dataOrd = con.getData(query);
    
    for(int i=0; i<dataOrd.size(); i++){
        JSONObject obj = new JSONObject();
        obj.put("cat_cd", dataOrd.get(i).get(0));
        obj.put("cat_name", dataOrd.get(i).get(1));
        obj.put("pro_cd", dataOrd.get(i).get(2));
        obj.put("pro_name", dataOrd.get(i).get(4));
        obj.put("comment", dataOrd.get(i).get(5));
        obj.put("start", dataOrd.get(i).get(6));
        obj.put("end", dataOrd.get(i).get(7));
        obj.put("minute", dataOrd.get(i).get(8));
        obj.put("room", dataOrd.get(i).get(9));
        obj.put("consultant", dataOrd.get(i).get(11));
        obj.put("prepare", dataOrd.get(i).get(10));
                
           String evod = (i%2==0)? "even":"odd";
%>
<tr class="clickable_tr <%=evod%>">
    <td><%=dataOrd.get(i).get(1)%></td>
    <td><%=dataOrd.get(i).get(2)%></td>
    <td><%=dataOrd.get(i).get(3)%></td>
    <td><%=dataOrd.get(i).get(5)%></td>
    <td><%=dataOrd.get(i).get(6)%></td>
    <td><%=dataOrd.get(i).get(7)%> <input type="hidden" id="OD_json" value='<%=obj.toString()%>'></td>
</tr>
<%
    }//end for
    
%>
