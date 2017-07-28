<%-- 
    Document   : progressNote_insert
    Created on : Jul 15, 2017, 8:17:20 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com ; insta: @rdcfc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Formatter.DateFormatter"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    String pmiNo = (String) session.getAttribute("patientPMINo");
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
    String sub_cd = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
    String creator = (String) session.getAttribute("USER_ID");
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
        
        if(dataDup.size() <= 0 ){
            String query = "INSERT INTO lhr_ort_nur_progressnote(pmi_no, hfc_cd, episode_date, encounter_date, datetime, note, discipline_cd, subdiscipline_cd, created_by, created_date) "
                        + "VALUES('" + pmiNo + "', '" + hfc_cd + "', '" + epDate + "', '" + enDate + "', '" + enDate + "', '" + notes + "', '"+dis_cd+"', '"+sub_cd+"', '"+creator+"', now() );";

            boolean isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);

            if (isSuccess) {
                out.print("success");
            } else {
                out.print("fail");
            }
        }
        else{
            out.print("duplicate");
        }
                
    
    }
    catch(Exception e){
        System.out.println("Inserting progress notes: "+e.toString());
        e.printStackTrace();
    }
%>
