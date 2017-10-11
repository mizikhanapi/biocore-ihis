<%-- 
    Document   : event_update
    Created on : Oct 1, 2017, 7:01:05 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; @rdcfc
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
    String conductedBy= request.getParameter("conductedBy");
    String witness= request.getParameter("witness");
    
    summaryDate = FormatTarikh.formatDate(summaryDate, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss");
    
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    
    String query="UPDATE lhr_ong_labour_summary set conducted_by='"+conductedBy+"', witnessed_by='"+witness+"' "
            + "WHERE pmi_no='"+pmiNo+"' and summary_date='"+summaryDate+"';";
    
    boolean isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);
    
    if(isSuccess)
        out.print("success");
    else
        out.print("fail");
%>
