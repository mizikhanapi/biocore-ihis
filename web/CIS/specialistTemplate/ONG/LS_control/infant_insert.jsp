<%-- 
    Document   : infant_insert
    Created on : Oct 1, 2017, 10:12:21 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>

<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
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
    String alive= request.getParameter("alive");
    String other= request.getParameter("other");
    String tag= request.getParameter("tag");
    String birthDate= request.getParameter("birthDate");
    String birthTime= request.getParameter("birthTime");
    String sex= request.getParameter("sex");
    String weight= request.getParameter("weight");
    String head= request.getParameter("head");
    String apgar1= request.getParameter("apgar1");
    String apgar2= request.getParameter("apgar2");
    String apgar3= request.getParameter("apgar3");
    String length= request.getParameter("length");
    String cord= request.getParameter("cord");
    String vitamin= request.getParameter("vitamin");
    String vaccine= request.getParameter("vaccine");
    String abnormal= request.getParameter("abnormal");
    
    summaryDate = FormatTarikh.formatDate(summaryDate, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss");
    
    Conn con = new Conn();
    
    String queryDup = "SELECT infant_tag_no FROM lhr_ong_infant_birth_record where infant_tag_no='"+tag+"' and hfc_cd='"+hfc_cd+"';";
    ArrayList<ArrayList<String>> dataDup = con.getData(queryDup);
    
    if(dataDup.size()>0){
        out.print("The tag number "+tag+" is already used. Please insert different tag number.");
    }
    else{
        RMIConnector rmi = new RMIConnector();
        
        birthDate = FormatTarikh.formatDate(birthDate+" "+birthTime, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss");
        
        String query="INSERT INTO lhr_ong_infant_birth_record(pmi_no, hfc_cd, episode_date, encounter_date, summary_date, alive, other, infant_tag_no, date_of_birth, d_sex, birth_weight, head_circumference, apgar_score1, apgar_score5, apgar_score10, `length`, cord_blood_collected, vitamin, vaccine, foetal_abnormality, created_by, created_date) "
                + "VALUES('"+pmiNo+"', '"+hfc_cd+"', '"+epDate+"', now(), '"+summaryDate+"', '"+alive+"', '"+other+"', '"+tag+"', '"+birthDate+"', '"+sex+"', '"+weight+"', '"+head+"', '"+apgar1+"', '"+apgar2+"', '"+apgar3+"', '"+length+"', '"+cord+"', '"+vitamin+"', '"+vaccine+"', '"+abnormal+"', '"+creator+"', now());";
        boolean isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);
        
        if(isSuccess)
            out.print("success");
        else 
            out.print("fail");
        
    }
    
%>