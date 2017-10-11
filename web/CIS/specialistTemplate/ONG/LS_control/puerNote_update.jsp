<%-- 
    Document   : puerNote_update
    Created on : Oct 4, 2017, 3:01:01 PM
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
    String dateOfMonth= request.getParameter("dateOfMonth");
    String day= request.getParameter("day");
    String time= request.getParameter("time");
    String height= request.getParameter("height");
    String temperature= request.getParameter("temperature");
    String systolic= request.getParameter("systolic");
    String diastolic= request.getParameter("diastolic");
    String pulse= request.getParameter("pulse");
    
    summaryDate = FormatTarikh.formatDate(summaryDate, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss");
    String leDate = FormatTarikh.formatDate(dateOfMonth+" "+time, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss");
    
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    
    int mbp = (Integer.parseInt(systolic) + (2 * Integer.parseInt(diastolic)) ) /3; // mean arterial pressure
    
    String query="UPDATE lhr_ong_puerperium set day_of_puerperium='"+day+"', fundal_height='"+height+"', temperature='"+temperature+"', blood_pressure='"+mbp+"', systolic='"+systolic+"', diastolic='"+diastolic+"', pulse='"+pulse+"' "
            + "WHERE pmi_no='"+pmiNo+"' and hfc_cd='"+hfc_cd+"' and summary_date='"+summaryDate+"' and date_of_month='"+leDate+"';";
    boolean isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);
    
    if(isSuccess)
        out.print("success");
    else 
        out.print("fail");
%>
