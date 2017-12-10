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
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();

%>

<select class="form-control input-lg" id="tCIS_DTODrugDoseUnit" name="tCIS_DTODrugDoseUnit">
    <option value="0">Default (Click here to change) </option>
    <option value="" >-</option>
    <%        String sqlDoc = "SELECT `Detail_Reference_code`, `Description` FROM adm_lookup_detail WHERE `Master_Reference_code` = '0067' AND hfc_cd ='" + hfc_cd + "'";
        ArrayList<ArrayList<String>> dataDoctor = Conn.getData(sqlDoc);

        if (dataDoctor.size() > 0) {
            for (int i = 0; i < dataDoctor.size(); i++) {%>
            
    <option value="<%=dataDoctor.get(i).get(1)%>"><%=dataDoctor.get(i).get(0)%></option>
    <% }
        }%>

</select>