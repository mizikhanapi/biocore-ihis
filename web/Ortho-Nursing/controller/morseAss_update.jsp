<%-- 
    Document   : morseAss_update
    Created on : Jul 12, 2017, 2:02:58 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="Formatter.DateFormatter"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");

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

    try{
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
        int score = 0;

        score = Integer.parseInt(mental) + Integer.parseInt(badan) + Integer.parseInt(venofix) + Integer.parseInt(movement) + Integer.parseInt(diagnosis) + Integer.parseInt(fall);

        RMIConnector rmi = new RMIConnector();

        String query = "UPDATE lhr_ort_nur_morse_fall_scale set falling_status='"+fall+"', diagnosis_status='"+diagnosis+"', "
                + "type_movement='"+movement+"', venofix_syringe_pump='"+venofix+"', body_structure='"+badan+"', mental_status='"+mental+"', total_score='"+score+"' "
                + "WHERE pmi_no='"+pmiNo+"' and encounter_date='"+enDate+"';";

        boolean isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);

        if (isSuccess) {
            out.print("success");
        } else {
            out.print("fail");
        }
    }
    catch(Exception e){
        System.out.println("Update morsefallscale: "+e.toString());
        e.printStackTrace();
        out.print("Oopps!");
    }
   

    
%>

