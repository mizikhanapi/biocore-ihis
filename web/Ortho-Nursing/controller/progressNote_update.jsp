<%-- 
    Document   : progressNote_update
    Created on : Jul 15, 2017, 11:18:45 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Formatter.DateFormatter"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    String pmiNo = (String) session.getAttribute("patientPMINo");
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String epDate = (String) session.getAttribute("episodeDate");
    
    String enDate = request.getParameter("enDate");
    String enTime = request.getParameter("enTime");
    String notes = request.getParameter("notes");
    
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    
    try{
        //"dd/MM/yyyy", "yyyy-MM-dd HH:mm:ss.ms"
        enDate = DateFormatter.formatDate(enDate, "dd/MM/yyyy", "yyyy-MM-dd");
        enDate = enDate.trim() + " "+enTime.trim()+":00.0";
        
        String duplicate = "Select pmi_no from lhr_ort_nur_progressnote where pmi_no ='"+pmiNo+"' and encounter_date='"+enDate+"' limit 1;";
        ArrayList<ArrayList<String>> dataDup = con.getData(duplicate);
        
       
        String query = "UPDATE lhr_ort_nur_progressnote set note = '"+notes+"' WHERE pmi_no='"+pmiNo+"' and encounter_date='"+enDate+"';";

        boolean isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);

        if (isSuccess) {
            out.print("success");
        } else {
            out.print("fail");
        }
        
                
    
    }
    catch(Exception e){
        System.out.println("Updating progress notes: "+e.toString());
        e.printStackTrace();
    }
%>