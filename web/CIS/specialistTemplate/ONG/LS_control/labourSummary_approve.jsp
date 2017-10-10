<%-- 
    Document   : labourSummary_approve
    Created on : Oct 2, 2017, 6:48:58 PM
    Author     : user
--%>

<%@page import="Formatter.FormatTarikh"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    String pmiNo = (String) session.getAttribute("patientPMINo");
    String epDate = (String) session.getAttribute("episodeDate");
    
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
    String sub_cd = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
    String creator = (String) session.getAttribute("USER_ID");
    
    String summaryDate= request.getParameter("summaryDate");
        
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    
    summaryDate = FormatTarikh.formatDate(summaryDate, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss");
    
    String query="UPDATE lhr_ong_labour_summary set approved_by='"+creator+"' where pmi_no='"+pmiNo+"' and hfc_cd='"+hfc_cd+"' and summary_date='"+summaryDate+"';";
    boolean isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);
    
    if(isSuccess)
        out.print("success");
    else
        out.print("fail");
%>