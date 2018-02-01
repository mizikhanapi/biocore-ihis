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
    //                          0               1                       2           3                       4                   5                   6                   7                   8                   
    String query="SELECT rd.modality_cd, md.modality_name, rd.body_system_cd, bs.body_system_name, rd.procedure_cd, pm.ris_procedure_name, od.requestor_comments, rd.filler_comments, rd.created_date "
            + "FROM ris_result_detail rd "
            + "LEFT JOIN ris_order_detail od on od.order_no=rd.order_no AND od.procedure_cd=rd.procedure_cd "
            + "LEFT JOIN ris_procedure_master pm ON pm.ris_procedure_cd=rd.procedure_cd "
            + "LEFT JOIN ris_body_system bs ON bs.body_system_cd=rd.body_system_cd AND bs.hfc_cd=pm.hfc_cd "
            + "LEFT JOIN ris_modality md ON md.modality_cd=rd.modality_cd AND md.hfc_cd=pm.hfc_cd "
            + "WHERE pm.hfc_cd='"+hfc_cd+"' AND rd.order_no='"+order_no+"';";
    
    ArrayList<ArrayList<String>> dataOrd = con.getData(query);
    
    for(int i=0; i<dataOrd.size(); i++){
        JSONObject obj = new JSONObject();
        obj.put("mod_cd", dataOrd.get(i).get(0));
        obj.put("mod_name", dataOrd.get(i).get(1));
        obj.put("bs_cd", dataOrd.get(i).get(2));
        obj.put("bs_name", dataOrd.get(i).get(3));
        obj.put("pm_cd", dataOrd.get(i).get(4));
        obj.put("pm_name", dataOrd.get(i).get(5));
        obj.put("req_com", dataOrd.get(i).get(6));
        obj.put("fil_com", dataOrd.get(i).get(7));
        obj.put("date", dataOrd.get(i).get(8));
        
           String evod = (i%2==0)? "even":"odd";
%>
<tr class="clickable_tr <%=evod%>">
    <td><%=dataOrd.get(i).get(3)%></td>
    <td><%=dataOrd.get(i).get(1)%></td>
    <td><%=dataOrd.get(i).get(4)%></td>
    <td><%=dataOrd.get(i).get(5)%></td>
    <td><%=dataOrd.get(i).get(8)%></td>
    <td><%=dataOrd.get(i).get(7)%> <input type="hidden" id="OD_json" value='<%=obj.toString()%>'></td>
</tr>
<%
    }//end for
    
%>
