<%-- 
    Document   : morseAss_delete
    Created on : Jul 12, 2017, 2:32:28 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta:@rdcfc; github:rdsurya
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Formatter.DateFormatter"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    
    String pmiNo = (String) session.getAttribute("patientPMINo");
    
    String enDate = request.getParameter("enDate");
    String time = request.getParameter("morseTime");
    

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
    
    RMIConnector rmi = new RMIConnector();

    String query = "DELETE FROM lhr_ort_nur_morse_fall_scale where pmi_no='"+pmiNo+"' and encounter_date='"+enDate+"';";

    boolean isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);

    if (isSuccess) {
        out.print("success");
    } else {
        out.print("fail");
    }

    
%>

