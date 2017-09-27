<%-- 
    Document   : AppointmentData
    Created on : Aug 16, 2017, 6:07:54 PM
    Author     : -D-
--%>
<%@page import="org.joda.time.*"%>
<%@page import="org.joda.time.format.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn Conn = new Conn();

    String hfc_cd = request.getParameter("h");
    String discipline_cd = request.getParameter("d");
    String subdiscipline_cd = request.getParameter("s");
    String pmi_no = (String) session.getAttribute("PMI_NO");

    //String key ="fever";                     //0             1           2           3         4          
    String searchProblem = "SELECT bio.`PATIENT_NAME`, app.appointment_date , app.`PMI_NO`, app.start_time, app.end_time "
            + "FROM pms_appointment app "
            + "INNER JOIN pms_patient_biodata bio ON app.pmi_no = bio.`PMI_NO`  "
            + "WHERE app.hfc_cd = '" + hfc_cd + "' AND app.discipline = '" + discipline_cd + "' AND app.subdiscipline = '" + subdiscipline_cd + "'  AND app.pmi_no != '" + pmi_no + "';;";

    String sql_patient_appointment = "SELECT bio.`PATIENT_NAME`, app.appointment_date , app.`PMI_NO`, app.start_time, app.end_time "
            + "FROM pms_appointment app INNER JOIN pms_patient_biodata bio ON app.pmi_no = bio.`PMI_NO` "
            + " WHERE app.hfc_cd = '" + hfc_cd + "' AND app.discipline = '" + discipline_cd + "' AND app.subdiscipline = '" + subdiscipline_cd + "' AND app.pmi_no = '" + pmi_no + "';";

    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    ArrayList<ArrayList<String>> patient_appointment = Conn.getData(sql_patient_appointment);
    // out.print(search);
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm'Z'");

    String text = "2017-08-23 09:30:00.0";
    DateTimeFormatter format = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss.S");

    if (search.size() > 0) {
        out.print("[");
        for (int i = 0; i < search.size(); i++) {

            String end_date = null;
            LocalDateTime localDateTime = LocalDateTime.parse(search.get(i).get(1), format);
            LocalDateTime endDateTime = LocalDateTime.parse(search.get(i).get(1), format).plusMinutes(15);
            String str = localDateTime.toString().substring(0, localDateTime.toString().length() - 4);
            String end = endDateTime.toString().substring(0, endDateTime.toString().length() - 4);

            if (i == search.size() - 1) {

                out.print(
                        "{ \"title\" : \""+ "\", "
                        + "\"start\" : \"" + str + "\","
                        + "\"end\" : \"" + end + "\","
                                + "\"color\" : \"red\","
                        + "\"id\" : \"-[-|-]-\"}"
                );
            } else {

                out.print(
                        "{ \"title\" : \"" + "\", "
                        + "\"start\" : \"" + str + "\","
                        + "\"end\" : \"" + end + "\","
                                + "\"color\" : \"red\","
                        + "\"id\" : \"-[-|-]-\"},"
                );
            }

        }
        if (patient_appointment.size() > 0) {
            for (int i = 0; i < patient_appointment.size(); i++) {
                LocalDateTime localDateTime_P = LocalDateTime.parse(patient_appointment.get(i).get(1), format);
                LocalDateTime endDateTime_P = LocalDateTime.parse(patient_appointment.get(i).get(1), format).plusMinutes(15);
                String str_P = localDateTime_P.toString().substring(0, localDateTime_P.toString().length() - 4);
                String end_P = endDateTime_P.toString().substring(0, endDateTime_P.toString().length() - 4);
                
                  if (i == patient_appointment.size() - 1) {

                out.print(
                        ",{ \"title\" : \"" + patient_appointment.get(i).get(0) + "\", "
                        + "\"start\" : \"" + str_P + "\","
                        + "\"end\" : \"" + end_P + "\","
                                
                        + "\"id\" : \"" + patient_appointment.get(i).get(1) + "[-|-]" + patient_appointment.get(i).get(2) + "\"}"
                );
            } else {

                out.print(
                        ",{ \"title\" : \"" + patient_appointment.get(i).get(0) + "\", "
                        + "\"start\" : \"" + str_P + "\","
                        + "\"end\" : \"" + end_P + "\","
                               
                        + "\"id\" : \"" + patient_appointment.get(i).get(1) + "[-|-]" + patient_appointment.get(i).get(2) + "\"}"
                );
            }
//                out.print(
//                        "{ \"title\" : \"" + patient_appointment.get(i).get(0) + "\", "
//                        + "\"start\" : \"" + str_P + "\","
//                        + "\"end\" : \"" + end_P + "\","
////                        + "\"color\" : \"red\","
//                        + "\"id\" : \"" + patient_appointment.get(i).get(1) + "[-|-]" + patient_appointment.get(i).get(2) + "\"},"
//                );
            }

        }
        out.print("] ");
    }

%>
