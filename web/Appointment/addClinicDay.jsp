<%-- 
    Document   : addHoliday
    Created on : Apr 6, 2016, 10:41:42 PM
    Author     : asyraf
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn con = new Conn();
    String state_code = request.getParameter("state");
    String hfc_code = request.getParameter("hfc");
    String discipline = request.getParameter("discipline");
    String subdiscipline = request.getParameter("subdiscipline");
    String day = request.getParameter("clinic");
    String starttime = request.getParameter("startTime");
    String endtime = request.getParameter("endTime");
    String status = request.getParameter("status");
    String username = (String) session.getAttribute("username");

    JSONObject json = new JSONObject();
    String msg = "Invalid data";
    json.put("valid", new Boolean(false));
    json.put("msg", msg);

    String sqlCheck = "Select day_cd from pms_clinic_day where hfc_cd='" + hfc_code + "' and day_cd='" + day + "' and discipline_cd='" + discipline + "' and subdiscipline_cd='" + subdiscipline + "' limit 1;";
    int intCheck = con.getData(sqlCheck).size();

    if (intCheck > 0) {
        json.put("valid", false);
        msg = "The clinic day " + day + " is already exist!";
        json.put("msg", msg);
    } else {
        RMIConnector rmic = new RMIConnector();
        String sqlInsert = "INSERT INTO pms_clinic_day (hfc_cd, discipline_cd,subdiscipline_cd, day_cd, start_time, end_time, state_code, status, created_by, created_date) "
                + "VALUES ('" + hfc_code + "' , '" + discipline + "','" + subdiscipline + "','" + day + "','" + starttime + "','" + endtime + "','" + state_code + "','active', '" + username + "', now())";

        boolean isInsert = rmic.setQuerySQL(con.HOST, con.PORT, sqlInsert);

        if (isInsert) {
            json.put("valid", isInsert);
            msg = "New clinic day is successfully added.";
            json.put("msg", msg);
        } else {
            json.put("valid", isInsert);
            msg = "Error: " + sqlInsert;
            json.put("msg", msg);
            //out.print("error :" + sqlInsert);
        }
    }

    out.print(json.toString());


%>
