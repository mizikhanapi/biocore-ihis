<%-- 
    Document   : pmhList
    Created on : Feb 17, 2017, 3:06:36 PM
    Author     : user
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Config.getBase_url(request);
    Config.getFile_url(session);
    Conn conn = new Conn();
    String pmino = request.getParameter("PMI_NO");
    String episodedate = request.getParameter("episode_date");

    //String idInput = "9509140262901";

%>
<div class="thumbnail">
    <table id="cpatientDiv" class="table table-filter table-striped" style="background: #fff; border: 1px solid #ccc; margin-top: 20px">

        <thead>

        <th> Chief Complaint </th>


        <%  String sql = "select m.symptom_name, m.severity_decs, n.duration, m.comment "
                    + "FROM lhr_signs m"
                    + "INNER JOIN lhr_medication n ON n.PMI_NO = m.PMI_NO AND n.EPISODE_DATE = m.EPISODE_DATE"
                    + "WHERE m.PMI_NO = '" + pmino + "' AND m.episode_date = '" + episodedate + "';";

            ArrayList<ArrayList<String>> cpPmh = conn.getData(sql);

            int size = cpPmh.size();
            for (int i = 0; i < size; i++) {
        %>

        <tr>
            <td><ol><%= cpPmh.get(i).get(0)%></ol></td>


        </tr>

        <%
            }
        %>



        </thead>
