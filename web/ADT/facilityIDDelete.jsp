<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%

    String id = request.getParameter("wcd");
    String hfc = request.getParameter("hfc");
    String wid = request.getParameter("wid");
    String wname = request.getParameter("wname");
    String wdis = request.getParameter("wdis");
   

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    
    //check whether there are patient in the queue...
    String sqlCheck = "SELECT pmi_no FROM pms_patient_queue "
            + "WHERE patient_category='003' AND status NOT IN ('1', '6') AND queue_name = '"+wname+"' AND hfc_cd='"+hfc+"' AND discipline_cd='"+wdis+"' LIMIT 1;";
    ArrayList<ArrayList<String>> dataCheck = conn.getData(sqlCheck);
    if(dataCheck.size()>0){
        out.print("no");
        return; // abort deletion
    }
    
    String sql = "DELETE FROM wis_ward_name WHERE ward_id = '" + wid + "' and hfc_cd = '"+hfc+"'";
//   ward_class_code = '" + id + "' AND hfc_cd = '" + hfc + "' 

    boolean status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

    if (status == true) {
        out.print("Success");
        String query ="";
        //delete bed...
        query = "DELETE FROM wis_bed_id where hfc_cd='"+hfc+"' AND ward_id='"+wid+"' AND discipline_cd='"+wdis+"';";
        rmic.setQuerySQL(conn.HOST, conn.PORT, query);
        
        //delete hospital_charge
        query="DELETE FROM wis_hospital_charges WHERE hfc_cd='"+hfc+"' AND discipline_cd='"+wdis+"' AND ward_id='"+wid+"';";
        rmic.setQuerySQL(conn.HOST, conn.PORT, query);
        
        //delete queue_name...
        query="DELETE FROM pms_queue_name where queue_type='FY' AND queue_name='"+wname+"' AND hfc_cd='"+hfc+"' AND discipline_code='"+wdis+"';";
        rmic.setQuerySQL(conn.HOST, conn.PORT, query);
        
        //delete queue_list...
        query="DELETE FROM pms_queue_list WHERE queue_type='FY' AND queue_name='"+wname+"' AND hfc_cd='"+hfc+"' AND discipline_cd='"+wdis+"';";
        rmic.setQuerySQL(conn.HOST, conn.PORT, query);
    } else {
        out.print("Failed");
    }
%>
