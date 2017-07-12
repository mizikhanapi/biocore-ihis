<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String pmino = session.getAttribute("patientPMINo").toString();
    String episodeDate = session.getAttribute("episodeDate").toString();
    String sql1 = "SELECT encounter_date FROM lhr_ort_neu_assessment_chart WHERE pmi_no = '" + pmino + "' AND hfc_cd = '" + hfc + "' AND episode_date = '" + episodeDate + "'";
    ArrayList<ArrayList<String>> date = conn.getData(sql1);
%>
Date: <select name="pickup_date" id="pickup_date">
    <option>--</option>
    <%
        if (date.size() > 0) {
            for (int i = 0; i < date.size(); i++) {
    %>
    <option value="<%=date.get(i).get(0)%>"><%=date.get(i).get(0)%></option>
    <%
            }
        }
    %>
</select>
