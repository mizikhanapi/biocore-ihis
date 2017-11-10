<%-- 
    Document   : puerNote_insert
    Created on : Oct 4, 2017, 12:27:40 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="Formatter.FormatTarikh"%>
<%
    String pmiNo = (String) session.getAttribute("patientPMINo");
    String epDate = (String) session.getAttribute("episodeDate");
    
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
    String sub_cd = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
    String creator = (String) session.getAttribute("USER_ID");
    
    String summaryDate= request.getParameter("summaryDate");
    String dateOfMonth= request.getParameter("dateOfMonth");
    String day= request.getParameter("day");
    String time= request.getParameter("time");
    String height= request.getParameter("height");
    String temperature= request.getParameter("temperature");
    String systolic= request.getParameter("systolic");
    String diastolic= request.getParameter("diastolic");
    String pulse= request.getParameter("pulse");
    
    time = (time==null)? "09:00":time;
    
    summaryDate = FormatTarikh.formatDate(summaryDate, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss");
    String leDate = FormatTarikh.formatDate(dateOfMonth+" "+time, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss");
    
        
    String waktu="morning";
    
    if(time.equalsIgnoreCase("17:00")){
        waktu="evening";
    }
    
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    
    String queryDup = "Select pmi_no FROM lhr_ong_puerperium WHERE pmi_no='"+pmiNo+"' and summary_date='"+summaryDate+"' and date_of_month='"+leDate+"';";
    ArrayList<ArrayList<String>> dataDup = con.getData(queryDup);
    
    if(dataDup.size()>0){
        out.print("Observation on "+dateOfMonth+" in the "+waktu+" is already existed. Please choose different date or time.");
    }
    else{
        
        int mbp = (Integer.parseInt(systolic) + (2 * Integer.parseInt(diastolic)) ) /3; // mean arterial pressure
        
        String query="INSERT INTO lhr_ong_puerperium(pmi_no, hfc_cd, episode_date, encounter_date, summary_date, date_of_month, day_of_puerperium, fundal_height, temperature, blood_pressure, systolic, diastolic, pulse, created_by, created_date) "
                + "VALUES('"+pmiNo+"', '"+hfc_cd+"', '"+epDate+"', now(), '"+summaryDate+"', '"+leDate+"', '"+day+"', '"+height+"', '"+temperature+"', '"+mbp+"', '"+systolic+"', '"+diastolic+"', '"+pulse+"', '"+creator+"', now() ); ";
        boolean isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);
        
        if(isSuccess)
            out.print("success");
        else
            out.print("fail");
    }
    
    
%>
