<%-- 
    Document   : labourSummary_insert
    Created on : Sep 29, 2017, 8:31:04 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>

<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
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
    
    Conn con = new Conn();
    String strOut = "";
    
    String theDeliveryDate = FormatTarikh.formatDate(deliveryDate+" "+deliveryTime, "dd/MM/yyyy HH:mm", "yyyy-MM-dd HH:mm:ss");
    
    String queryCheck ="Select pmi_no from lhr_ong_labour_summary where pmi_no='"+pmiNo+"' and summary_date='"+theDeliveryDate+"' limit 1;";
    ArrayList<ArrayList<String>> dataDup = con.getData(queryCheck);
    
    if(dataDup.size()>0){
        strOut="Labour summary for date "+deliveryDate+" "+deliveryTime+" is already existed!";
    }
    else{
        String queryInsert="Insert into lhr_ong_labour_summary(pmi_no, hfc_cd, episode_date, encounter_date, summary_date, delivery_datetime, labour_onset, vaginal, operative, `3stage_blood_lost`, placenta, cord_round, cord_tightness, tear, repaired_by, created_by, created_date) "
                + "VALUES('"+pmiNo+"', '"+hfc_cd+"', '"+epDate+"', now(), '"+theDeliveryDate+"', '"+theDeliveryDate+"', '"+labourOnset+"', '"+vaginal+"', '"+operative+"', '"+bloodLoss+"', '"+placenta+"', '"+cord+"', '"+tightness+"', '"+tear+"', '"+repair+"', '"+creator+"', now());";
        RMIConnector rmi = new RMIConnector();
        boolean isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, queryInsert);
        
        if(isSuccess){
            strOut="success";
        }
        else{
            strOut="fail";
        }
    }
    
    out.print(strOut);
    
    
%>
