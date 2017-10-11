<%-- 
    Document   : infant_update
    Created on : Oct 1, 2017, 11:22:04 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>

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
    birthDate = FormatTarikh.formatDate(birthDate+" "+birthTime, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss");
    
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    
    String query = "UPDATE lhr_ong_infant_birth_record set alive='"+alive+"', other='"+other+"', date_of_birth='"+birthDate+"', d_sex='"+sex+"', birth_weight='"+weight+"', head_circumference='"+head+"', "
            + "apgar_score1='"+apgar1+"', apgar_score5='"+apgar2+"', apgar_score10='"+apgar3+"', `length`='"+length+"', cord_blood_collected='"+cord+"', vitamin='"+vitamin+"', vaccine='"+vaccine+"', foetal_abnormality='"+abnormal+"' "
            + "WHERE pmi_no='"+pmiNo+"' and hfc_cd='"+hfc_cd+"' and infant_tag_no='"+tag+"';";
    boolean isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);
    
    if(isSuccess)
        out.print("success");
    else
        out.print("fail");
    
%>
