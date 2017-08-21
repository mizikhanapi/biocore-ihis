<%-- 
    Document   : findSub
    Created on : Aug 21, 2017, 11:17:07 AM
    Author     : shay
--%>
<%@page import="java.util.ArrayList"%>
<%//@page import="models.Query"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    String hfc_cd = request.getParameter("hfc");
    String discipline = request.getParameter("discipline");
    String sql_subDis = "SELECT asd.subdiscipline_cd,asd.subdiscipline_name FROM adm_discipline ad, adm_subdiscipline asd, adm_hfc_discipline ahd WHERE  ahd.discipline_cd = ad.discipline_cd AND ad.discipline_cd = asd.discipline_cd AND ahd.hfc_cd = '" + hfc_cd + "' and asd.discipline_cd ='" + discipline + "' GROUP BY subdiscipline_name";
    ArrayList<ArrayList<String>> sql_Subdiscipline;
    sql_Subdiscipline = rmic.getQuerySQL(conn.HOST, conn.PORT, sql_subDis);
%>
<select id="subdi" class="form-control">
    <option value="">-- Select sub-discipline --</option>
    <%
        if (sql_Subdiscipline.size() > 0) {
            for (int i = 0; i < sql_Subdiscipline.size(); i++) {

    %>
    <option value="<%=sql_Subdiscipline.get(i).get(0)%>"><%=sql_Subdiscipline.get(i).get(1)%></option>
    <%}
                                                }%>
</select>