<%-- 
    Document   : SearchDiscipline
    Created on : 17-Feb-2017, 11:26:49
    Author     : ahmed
--%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%--<%@page import=""%>--%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
   // String key = request.getParameter("input");
   Conn conn = new Conn();

    String id =request.getParameter("id");
    String searchProblem = "select d.discipline_name from adm_discipline d,adm_hfc_discipline hfcd where d.discipline_cd = hfcd.discipline_cd and hfcd.hfc_cd='"+id+"';";
    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);

%>
  <div class="form-group">
                    <select name="hhh" id="hfcDisciplineMON" class="form-control input-lg">
                        <option value="1" selected="" disabled="">Discipline</option>
                        <option value="2">Discipline2</option>
                        <% if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {
                         //out.print(String.join("|", search.get(i).get(1)));
                        %>
                        <option value="<%=search.get(i).get(0)%>"><%=search.get(i).get(0)%></option>
                        <%}}%>
                    </select>
</div>
