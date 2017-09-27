<%-- 
    Document   : SelectDoctorAvailability
    Created on : Aug 16, 2017, 5:41:32 PM
    Author     : -D-
--%>
<%@ page import ="java.sql.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
           
                Conn Conn = new Conn();
                //String hfc_cd = "04010101";
                String hfc_cd = request.getParameter("hfc_cd");
                String discipline_cd = request.getParameter("discipline_cd");
                String subdiscipline_cd = request.getParameter("subdiscipline_cd");
%>

<select class="form-control input-lg" id="t_ADD_Appoinment_Time" name="t_ADD_Appoinment_Time" required>
    <option></option>
    <%
        String sqlDoc = "select start_time from pms_appointment_time where hfc_cd = '"+hfc_cd+"' AND discipline_cd = '"+discipline_cd+"' AND subdiscipline_cd = '"+subdiscipline_cd+"'";
        ArrayList<ArrayList<String>> dataDoctor = Conn.getData(sqlDoc);

        if (dataDoctor.size() > 0) {
            for (int i = 0; i < dataDoctor.size(); i++) {%>
    <option value="<%=dataDoctor.get(i).get(0)+":00"%>"><%=dataDoctor.get(i).get(0)+":00"%></option>
    <% }
                                                        }%>

</select>