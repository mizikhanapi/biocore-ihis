<%-- 
    Document   : puerNote_delete
    Created on : Oct 4, 2017, 3:32:31 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>

<%@page import="Formatter.FormatTarikh"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    String pmiNo = (String) session.getAttribute("patientPMINo");
    String epDate = (String) session.getAttribute("episodeDate");
    
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
    String sub_cd = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
    String creator = (String) session.getAttribute("USER_ID");
    
    String summaryDate= request.getParameter("summaryDate");
    String dateOfMonth= request.getParameter("dateOfMonth");
    String time= request.getParameter("time");
    
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    
    summaryDate = FormatTarikh.formatDate(summaryDate, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss");
    String leDate = FormatTarikh.formatDate(dateOfMonth+" "+time, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss");
    
    String query ="DELETE FROM lhr_ong_puerperium WHERE pmi_no='"+pmiNo+"' and hfc_cd='"+hfc_cd+"' and summary_date='"+summaryDate+"' and date_of_month='"+leDate+"';";
    boolean isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);
    
    if(isSuccess)
        out.print("success");
    else
        out.print("fail");
    
%>
