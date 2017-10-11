<%-- 
    Document   : labourSummary_update
    Created on : Sep 29, 2017, 9:49:00 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>

<%@page import="main.RMIConnector"%>
<%@page import="Formatter.FormatTarikh"%>
<%@page import="dBConn.Conn"%>
<%
    String pmiNo = (String) session.getAttribute("patientPMINo");
    String epDate = (String) session.getAttribute("episodeDate");
    
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
    String sub_cd = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
    String creator = (String) session.getAttribute("USER_ID");
    
    String deliveryDate= request.getParameter("deliveryDate");
    String deliveryTime= request.getParameter("deliveryTime");
    String labourOnset= request.getParameter("labourOnset");
    String vaginal= request.getParameter("vaginal");
    String operative= request.getParameter("operative");
    String bloodLoss= request.getParameter("bloodLoss");
    String placenta = request.getParameter("placenta");
    String cord= request.getParameter("cord");
    String tightness= request.getParameter("tightness");
    String tear= request.getParameter("tear");
    String repair= request.getParameter("repair");
    String summaryDate= request.getParameter("summaryDate");
    
    Conn con = new Conn();
    String strOut = "";
    
    RMIConnector rmi = new RMIConnector();
    
    summaryDate = FormatTarikh.formatDate(summaryDate, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss");
    deliveryDate = FormatTarikh.formatDate(deliveryDate+" "+deliveryTime, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss");
    
    String query="UPDATE lhr_ong_labour_summary set delivery_datetime='"+deliveryDate+"', labour_onset='"+labourOnset+"', vaginal='"+vaginal+"', "
            + "operative='"+operative+"', `3stage_blood_lost`='"+bloodLoss+"', placenta='"+placenta+"', cord_round='"+cord+"', cord_tightness='"+tightness+"', tear='"+tear+"', repaired_by='"+repair+"' "
            + "WHERE pmi_no='"+pmiNo+"' and summary_date='"+summaryDate+"';";
    
    boolean isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);
    
    if(isSuccess)
        strOut="success";
    else
        strOut="fail";
    
    out.print(strOut);
    
%>
