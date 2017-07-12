<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String pmino = session.getAttribute("patientPMINo").toString();
    String episodeDate = session.getAttribute("episodeDate").toString();
    
    String date = request.getParameter("dateEntry");
    String  time = request.getParameter("timeEntry");
    String datetime = date+"  "+time;
    
    session.setAttribute("datetime", datetime);
    
    RMIConnector rmic = new RMIConnector();

    Conn conn = new Conn();
    String sqlInsert = "INSERT INTO lhr_ort_neu_assessment_chart (pmi_no,hfc_cd,episode_date,encounter_date) VALUES ('"+pmino+"','"+hfc+"','"+episodeDate+"','"+datetime+"')";
    rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);
    
%>

<%
    
    String sql1 = "SELECT encounter_date FROM lhr_ort_neu_assessment_chart WHERE pmi_no = '" + pmino + "' AND hfc_cd = '" + hfc + "' AND episode_date = '" + episodeDate + "'";
    ArrayList<ArrayList<String>> encounter_date = conn.getData(sql1);
%>
Date: <select name="pickup_date" id="pickup_date">
    <option>--</option>
    <%
        if (encounter_date.size() > 0) {
            for (int i = 0; i < encounter_date.size(); i++) {
    %>
    <option value="<%=encounter_date.get(i).get(0)%>"><%=encounter_date.get(i).get(0)%></option>
    <%
            }
        }
    %>
</select>
