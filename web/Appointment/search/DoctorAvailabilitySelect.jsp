<%-- 
    Document   : DoctorAvailabilitySelect
    Created on : Nov 21, 2017, 4:25:11 PM
    Author     : -D-
--%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn Conn = new Conn();
    String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String dateAvailibility = request.getParameter("date");
    
//    String sqlDctorAvailability = "SELECT doc.*"
//            + "from pms_duty_roster pdr, "
//            + "(SELECT USER_ID,USER_NAME,OCCUPATION_CODE "
//            + "FROM adm_users "
//            + "WHERE OCCUPATION_CODE = 'DOCTOR' OR  OCCUPATION_CODE = '002')doc "
//            + "where doc.USER_ID=pdr.user_id AND pdr.status='active' AND "
//            + "DATE(now()) BETWEEN DATE(start_date) AND DATE(end_date) AND pdr.hfc_cd = '" + hfc + "'";

    String sqlDctorAvailability = "SELECT doc.*from pms_duty_roster pdr, (SELECT USER_ID,USER_NAME,OCCUPATION_CODE FROM adm_users WHERE OCCUPATION_CODE = '002')doc where doc.USER_ID=pdr.user_id AND pdr.status='active' AND DATE('"+dateAvailibility+"') BETWEEN DATE(start_date) AND DATE(end_date) AND  pdr.hfc_cd = '"+hfc+"'";
    ArrayList<ArrayList<String>> dataDctorAvailability = Conn.getData(sqlDctorAvailability);
 
%>

<select class="form-control" id="selectDoctorAvailibility" placeholder="Search Doctor Name"  name="searchDoctorAvailability" required>
    <option></option>
    <%
        if (dataDctorAvailability.size() > 0) {
            for (int i = 0; i < dataDctorAvailability.size(); i++) {%>
    <option value="<%=dataDctorAvailability.get(i).get(1)%>"><%=dataDctorAvailability.get(i).get(1)%></option>
    <%}
        }
    %>
</select>