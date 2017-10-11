<%-- 
    Document   : perNote_save
    Created on : Oct 3, 2017, 10:53:12 PM
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
    String note= request.getParameter("note");
    String treatment= request.getParameter("treatment");
    String perDate= request.getParameter("perDate");
    
    summaryDate = FormatTarikh.formatDate(summaryDate, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss");
    perDate = FormatTarikh.formatDate(perDate, "dd/MM/yyyy", "yyyy-MM-dd HH:mm:ss");
    
    Conn con = new Conn();
    RMIConnector  rmi = new RMIConnector();
    
    String query="SELECT pmi_no "
                + "FROM lhr_ong_puerperium_note "
                + "WHERE pmi_no='"+pmiNo+"' and summary_date='"+summaryDate+"' limit 1; ";
    ArrayList<ArrayList<String>> dataCheck = con.getData(query);
    
    if(dataCheck.size()>0){//update query
        query="UPDATE lhr_ong_puerperium_note set encounter_date='"+perDate+"', notes='"+note+"', treatment='"+treatment+"' "
                + "WHERE pmi_no='"+pmiNo+"' and hfc_code='"+hfc_cd+"' and summary_date='"+summaryDate+"';";
    }
    else{
        query="INSERT INTO lhr_ong_puerperium_note(pmi_no, hfc_code, episode_date, encounter_date, summary_date, notes, treatment, created_by, created_date) "
                + "values('"+pmiNo+"', '"+hfc_cd+"', '"+epDate+"', '"+perDate+"', '"+summaryDate+"', '"+note+"', '"+treatment+"', '"+creator+"', now() );";
    }
    boolean isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);
    
    if(isSuccess)
        out.print("success");
    else
        out.print("fail");
%>
