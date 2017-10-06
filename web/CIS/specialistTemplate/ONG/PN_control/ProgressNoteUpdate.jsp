<%-- 
    Document   : ProgressNoteAdd
    Created on : Oct 3, 2017, 8:52:58 PM
    Author     : -D-
--%>

<%-- 
    Document   : ProgressNoteRetrieve
    Created on : Oct 3, 2017, 10:29:33 PM
    Author     : -D-
--%>
<%@page import="main.RMIConnector"%>
<%@page import="Formatter.ConvertMasa"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="Formatter.FormatTarikh"%>
<%@page import="OnG_helper.ProgressNote"%>


<%

    Conn con = new Conn();
     RMIConnector rmi = new RMIConnector();
    
    String pmiNo = (String) session.getAttribute("patientPMINo");
    String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String user_id = (String) session.getAttribute("USER_ID");

    String episodeDate = request.getParameter("episodeDate");
    String encounterDate = request.getParameter("encounterDate");
    String createdDate = request.getParameter("createdDate");
    String note = request.getParameter("note");
    


            String sql = "UPDATE lhr_ong_progress_notes SET `Clinical_Notes` = '"+note+"' "
                    + "WHERE pmi_no = '"+pmiNo+"' AND hfc_cd = '"+hfc+"' AND episode_date = '"+episodeDate+"' "
                    + "AND encounter_date = '"+encounterDate+"' AND created_date = '"+createdDate+"';";
            
       
            Boolean state = rmi.setQuerySQL(con.HOST, con.PORT, sql);
            
            
            
        if(state){
            out.print("1");
        }else{
            out.print("0");
            
        }



%>