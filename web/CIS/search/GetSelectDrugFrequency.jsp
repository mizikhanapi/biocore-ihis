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
                String discipline_cd = session.getAttribute("DISCIPLINE_CODE").toString();
                String subdiscipline_cd = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
                %>

                <select class="form-control input-lg" id="tCIS_DTODrugFrequency" name="tCIS_DTODrugFrequency" required onchange="calculateQuantity()">
                    <option value="0">Default (Click here to change) </option>
    <%
        String sqlDoc = "select frequency_desc,frequency_value from pis_drug_frequency WHERE hfc_cd = '"+hfc_cd+"' AND discipline_cd = '"+discipline_cd+"' AND subdiscipline_cd = '"+subdiscipline_cd+"';";
        ArrayList<ArrayList<String>> dataDoctor = Conn.getData(sqlDoc);

        if (dataDoctor.size() > 0) {
            for (int i = 0; i < dataDoctor.size(); i++) {%>
    <option value="<%=dataDoctor.get(i).get(1)%>"><%=dataDoctor.get(i).get(0)%></option>
    <% }
                                                        }%>

</select>