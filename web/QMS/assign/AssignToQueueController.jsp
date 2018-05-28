<%-- 
    Document   : AssignToQueueController
    Created on : Jul 20, 2017, 6:16:07 PM
    Author     : -D-
--%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%
    Conn Conn = new Conn();
    RMIConnector rmi = new RMIConnector();
    
    String hfc_cd = request.getParameter("hfc_cd");
    String pmiNo = request.getParameter("pmiNo");
    String episodeDate = request.getParameter("episodeDate");
    String comTy = request.getParameter("comTy");
    String queue = request.getParameter("queue");
    String patientCategory = request.getParameter("patientCategory");
    String docID = request.getParameter("docID");
    
    String sql_getPatientCategory = "SELECT `Detail_Reference_code` "
            + "FROM adm_lookup_detail "
            + "WHERE `Master_Reference_code` = '0033' "
            + "AND hfc_cd = '"+hfc_cd+"' "
            + "AND `Description` = '"+patientCategory+"'; ";
    ArrayList<ArrayList<String>> getPatientCategory = Conn.getData(sql_getPatientCategory);
    
    String sql_update_queue = "UPDATE pms_patient_queue SET queue_type = '"+comTy+"', queue_name = '"+queue+"', user_id = null, status='0'  WHERE pmi_no = '"+pmiNo+"' and episode_date = '"+episodeDate+"';";
    boolean updatePatientQueue = rmi.setQuerySQL(Conn.HOST, Conn.PORT, sql_update_queue);
    
    if(updatePatientQueue){
        out.print("|-SUCCESS-|");
    }else {
        out.print("|-ERROR-|");
    }
    
//    if(getPatientCategory.get(0).get(0).equals("001")){
//        
//        
//        
//    } else if(getPatientCategory.get(0).get(0).equals("002")){
//        
//    }
    
%>
