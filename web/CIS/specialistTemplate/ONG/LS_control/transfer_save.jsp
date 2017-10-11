<%-- 
    Document   : transfer_save
    Created on : Oct 2, 2017, 1:48:14 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>

<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Formatter.FormatTarikh"%>
<%
    String pmiNo = (String) session.getAttribute("patientPMINo");
    String epDate = (String) session.getAttribute("episodeDate");
    
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
    String sub_cd = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
    String creator = (String) session.getAttribute("USER_ID");
    
    String summaryDate= request.getParameter("summaryDate");
    String pulse= request.getParameter("pulse");
    String systol= request.getParameter("systol");
    String diastol= request.getParameter("diastol");
    String uterus= request.getParameter("uterus");
    String time= request.getParameter("time");
    String perineum= request.getParameter("perineum");
    String doctor= request.getParameter("doctor");
    
    summaryDate = FormatTarikh.formatDate(summaryDate, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss");
    time = FormatTarikh.formatDate(time, "HH:mm", "HH:mm:ss");
    
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    
    String sqlCheck ="Select standing_pulse FROM lhr_ong_mother_transfer_observation where pmi_no='"+pmiNo+"' and summary_date='"+summaryDate+"' and hfc_cd='"+hfc_cd+"' limit 1;";
    ArrayList<ArrayList<String>> dataCheck = con.getData(sqlCheck);
    
    String query="";
    
    if(dataCheck.size()>0){ // data existed, so we update
        query = "UPDATE lhr_ong_mother_transfer_observation set standing_pulse='"+pulse+"', systolic_supine='"+systol+"', "
                + "diastolic_supine='"+diastol+"', uterus='"+uterus+"', `time`='"+time+"', perineum='"+perineum+"', doctor_nurse_name='"+doctor+"' "
                + "WHERE pmi_no='"+pmiNo+"' and hfc_cd='"+hfc_cd+"' and summary_date='"+summaryDate+"';";
    }
    else{
        query="INSERT INTO lhr_ong_mother_transfer_observation(pmi_no, hfc_cd, episode_date, encounter_date, summary_date, standing_pulse, systolic_supine, diastolic_supine, uterus, `time`, perineum, doctor_nurse_name, created_by, created_date) "
                + "VALUES('"+pmiNo+"', '"+hfc_cd+"', '"+epDate+"', now(), '"+summaryDate+"', '"+pulse+"', '"+systol+"', '"+diastol+"', '"+uterus+"', '"+time+"', '"+perineum+"', '"+doctor+"', '"+creator+"', now() );";
    }
    
    boolean isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);
    
    if(isSuccess)
        out.print("success");
    else
        out.print("fail");
%>
