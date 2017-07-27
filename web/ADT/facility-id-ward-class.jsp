<%-- 
    Document   : listbedname
    Created on : 12-Apr-2017, 15:44:19
    Author     : shay
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%


    String id = session.getAttribute("USER_ID").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
 
%>



<%
    Conn conn = new Conn();
    String key = request.getParameter("input");
    String hfc = request.getParameter("hfc");
    
     

  String sql1 = "SELECT ward_class_code,ward_class_name FROM wis_ward_class WHERE hfc_cd ='" + hfc + "' ";
    
   

  ArrayList<ArrayList<String>> dataClass1 = conn.getData(sql1);

    if (dataClass1.size() > 0)
            {
%>
<ul id="matchListWard" style="width: 300px; height: 200px; overflow: auto">
    <% for (int i = 0; i < dataClass1.size(); i++)
        {
    %>
    <li value="<%=dataClass1.get(i).get(0)%>"><a style="cursor:pointer; color: black;"><%=dataClass1.get(i).get(0)%> | <%=dataClass1.get(i).get(1)%></a></li>
    <%
        }
    %>
</ul>
    
<%}else{%>
<span>No Record Found!</span>
<% 
    }

%>
