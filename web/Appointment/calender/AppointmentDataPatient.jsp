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
<%@page import="org.json.simple.*"%>
<%
    Conn Conn = new Conn();

    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
     String discipline_cd = (String) session.getAttribute("DISCIPLINE_CODE");
    String subdiscipline_cd = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
    String pmi_no = (String) session.getAttribute("PMI_NO");

    //String key ="fever";                     //0             1           2           3         4          
    String searchProblem = "SELECT bio.`PATIENT_NAME`, app.appointment_date , app.`PMI_NO`, app.start_time, app.end_time "
            + "FROM pms_appointment app "
            + "INNER JOIN pms_patient_biodata bio ON app.pmi_no = bio.`PMI_NO`  "
            + "WHERE app.hfc_cd = '" + hfc_cd + "' AND app.discipline = '" + discipline_cd + "' AND app.subdiscipline = '" + subdiscipline_cd + "'  AND app.pmi_no != '" + pmi_no + "';;";

    String sql_patient_appointment = "SELECT bio.`PATIENT_NAME`, app.appointment_date , app.`PMI_NO`, app.start_time,app.status, app.end_time "
            + "FROM pms_appointment app INNER JOIN pms_patient_biodata bio ON app.pmi_no = bio.`PMI_NO` "
            + " WHERE app.hfc_cd = '" + hfc_cd + "' AND app.discipline = '" + discipline_cd + "' AND app.subdiscipline = '" + subdiscipline_cd + "' AND app.pmi_no = '" + pmi_no + "';";

    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    ArrayList<ArrayList<String>> patient_appointment = Conn.getData(sql_patient_appointment);
    // out.print(search);
    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm'Z'");

    String text = "2017-08-23 09:30:00.0";
    DateTimeFormatter format = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss.S");
    JSONArray jsonArray = new JSONArray();

    if (search.size() > 0) {
  
        //create object for other appointment
        for (int i = 0; i < search.size(); i++) {
            JSONObject json = new JSONObject();
            String end_date = null;
            LocalDateTime localDateTime = LocalDateTime.parse(search.get(i).get(1), format);
            LocalDateTime endDateTime = LocalDateTime.parse(search.get(i).get(1), format).plusMinutes(15);
            String str = localDateTime.toString().substring(0, localDateTime.toString().length() - 4);
            String end = endDateTime.toString().substring(0, endDateTime.toString().length() - 4);

            json.put("title","");
            json.put("start", str);
            json.put("end", end);
            json.put("color", "red");
            json.put("id", "-[-|-]-");
            

            jsonArray.add(json);


        }
     
    }

    if (patient_appointment.size() > 0) {


        for (int i = 0; i < patient_appointment.size(); i++) {

            JSONObject json = new JSONObject();
            LocalDateTime localDateTime_P = LocalDateTime.parse(patient_appointment.get(i).get(1), format);
            LocalDateTime endDateTime_P = LocalDateTime.parse(patient_appointment.get(i).get(1), format).plusMinutes(15);
            String str_P = localDateTime_P.toString().substring(0, localDateTime_P.toString().length() - 4);
            String end_P = endDateTime_P.toString().substring(0, endDateTime_P.toString().length() - 4);
            LocalDateTime today_P = LocalDateTime.now();

            if (localDateTime_P.isBefore(today_P)) {
                    json.put("title", patient_appointment.get(i).get(0));
                    json.put("start", str_P);
                    json.put("end", end_P);
                    json.put("color", "red");
                    json.put("id", patient_appointment.get(i).get(1) + "[-|-]" + patient_appointment.get(i).get(2));
                } else {
                    if (patient_appointment.get(i).get(4).equals("inactive")) {
                        json.put("title", patient_appointment.get(i).get(0));
                        json.put("start", str_P);
                        json.put("end", end_P);
                        json.put("color", "#cc9900");
                        json.put("id", patient_appointment.get(i).get(1) + "[-|-]" + patient_appointment.get(i).get(2));
                    } else {
                        json.put("title", patient_appointment.get(i).get(0));
                        json.put("start", str_P);
                        json.put("end", end_P);

                        json.put("id", patient_appointment.get(i).get(1) + "[-|-]" + patient_appointment.get(i).get(2));
                    }

                }
             jsonArray.add(json);

        }

    }
    out.flush();
    out.print(jsonArray);
%>
