<%-- 
    Document   : 4hlyFunction
    Created on : 03-Jul-2017, 17:42:32
    Author     : shay
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="NIW_helper.ThrombophlebitisUtils"%>
<%
    ThrombophlebitisUtils tbU = new ThrombophlebitisUtils();
    String methodName = request.getParameter("methodName");
    String data = request.getParameter("datas");
    Boolean result;
    
    if(methodName.equalsIgnoreCase("add")){
    }else if(methodName.equalsIgnoreCase("view")){
        ArrayList<ArrayList<String>> datas = tbU.get4hly(data); %>
        <table class="table table-bordered table-striped" id="tblNIW_4hly">
    <thead>
        <th>Date</th>
        <th>Time 4hly obs.</th>
        <th>Site of IV Canulation</th>
        <th>Pain Score</th>
        <th>Yes / No</th>
        <th>Additive</th>
        <th>Thrombo Phlebitis</th>
        <th>V.I.P. Score</th>
        <th>Approval</th>
        
    </thead>
    <tbody>
           <%
               for(int i = 0; i < datas.size(); i++){ %>
                   <tr>
                       <td><%=datas.get(i).get(4)%></td>
                       <td><%=datas.get(i).get(5)%></td>
                       <td><%=datas.get(i).get(6)%></td>
                       <td><%=datas.get(i).get(7)%></td>
                       <td>
                           Slight redness: <%=datas.get(i).get(8)%> </br>
                           Swelling: <%=datas.get(i).get(10)%> </br>
                           Palpable venous cord: <%=datas.get(i).get(11)%> </br>
                           Unconscious pl: <%=datas.get(i).get(12)%> </br>
                           Redness: <%=datas.get(i).get(9)%>
                       </td>
                       <td>
                           Medication: <%=datas.get(i).get(15)%></br>
                           Blood tx: <%=datas.get(i).get(16)%></br>
                           Plain i/v drip: <%=datas.get(i).get(17)%> 
                       </td>
                       <td><%=datas.get(i).get(13)%></td>
                       <td><%=datas.get(i).get(14)%></td>
                       <td><%=datas.get(i).get(18)%></td>
                   </tr>
            <%   }
           %>
        </tbody>
</table>
<script>
    $('#tblNIW_4hly').dataTable();
</script>        
        
        
        
    <% }else if(methodName.equalsIgnoreCase("delete")){
    }
%>
