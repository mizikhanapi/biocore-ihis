<%-- 
    Document   : morseAss_insert
    Created on : Jul 5, 2017, 8:07:00 PM
    Author     : Ardhi Surya Ibrahim; rdsurya147@gmail.com; @rdcfc 
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Formatter.DateFormatter"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
    String sub_cd = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
    String creator = (String) session.getAttribute("USER_ID");

    String pmiNo = (String) session.getAttribute("patientPMINo");
    String epDate = (String) session.getAttribute("episodeDate");

    String enDate = request.getParameter("enDate");
    String time = request.getParameter("morseTime");
    String mental = request.getParameter("mental");
    String badan = request.getParameter("badan");
    String venofix = request.getParameter("venofix");
    String movement = request.getParameter("movement");
    String diagnosis = request.getParameter("diagnosis");
    String fall = request.getParameter("fall");

    //epDate = DateFormatter.formatDate(epDate, "dd/MM/yyyy", "yyyy-MM-dd HH:mm:ss.ms");
    enDate = DateFormatter.formatDate(enDate, "dd/MM/yyyy", "yyyy-MM-dd");

    if (time.equalsIgnoreCase("AM")) {
        enDate = enDate + " 04:00:00.0";
    } else if (time.equalsIgnoreCase("PM")) {
        enDate = enDate + " 20:00:00.0";
    } else {
        enDate = enDate + " 12:00:00.0";
    }

    Conn con = new Conn();

    //check whether got duplicate entry
    String duplicate = "Select pmi_no from lhr_ort_nur_morse_fall_scale "
            + "where pmi_no = '" + pmiNo + "' and hfc_cd = '" + hfc_cd + "' and encounter_date = '" + enDate + "' limit 1;";
    ArrayList<ArrayList<String>> dataDuplicate = con.getData(duplicate);

    if (dataDuplicate.size() > 0) {
        out.print("duplicate");
    } else {
        int score = 0;

        score = Integer.parseInt(mental) + Integer.parseInt(badan) + Integer.parseInt(venofix) + Integer.parseInt(movement) + Integer.parseInt(diagnosis) + Integer.parseInt(fall);

        RMIConnector rmi = new RMIConnector();

        String query = "Insert into lhr_ort_nur_morse_fall_scale(pmi_no, hfc_cd, episode_date, encounter_date, datetime, falling_status, diagnosis_status, type_movement, venofix_syringe_pump, body_structure, mental_status, total_score, discipline_cd, subdiscipline_cd, created_by, created_date) "
                + "values('" + pmiNo + "', '" + hfc_cd + "', '" + epDate + "', '" + enDate + "', '" + time + "', '" + fall + "', '" + diagnosis + "', '" + movement + "', '" + venofix + "', '" + badan + "', '" + mental + "', " + score + ", '"+dis_cd+"', '"+sub_cd+"', '"+creator+"', now() )";

        boolean isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);

        if (isSuccess) {
            out.print("success");
        } else {
            out.print("fail");
        }
    }


%>
