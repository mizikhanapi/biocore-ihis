
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
  
    String BedN, WardNameN, WardClassN, Dis, Deposit,pmino;
    
    BedN = request.getParameter("BedO");
    WardNameN = request.getParameter("WardNameO");
    WardClassN = request.getParameter("WardClassO");
    Dis = request.getParameter("Dis");
    pmino = request.getParameter("pmino");
    Deposit = request.getParameter("Deposit");
    
     DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
    Date dateobj = new Date();
    df.format(dateobj);
    String createdby = "Izzlyn Izzaty";
   
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlInsert = "INSERT INTO wis_inpatient_episode_history (ward_class_code,ward_id,bed_id,discipline_cd,DEPOSIT_INPATIENT, pmi_no"
            + "episode_date,hfc_cd,subdiscipline_cd,order_by,inpatient_status, created_by,created_date) "
            + "VALUES ('" + WardNameN + "', '" + WardClassN + "',  '" + BedN + "', '" + Dis + "','" + Deposit + "' , '" + pmino + "'"
            + "now(), 'hfc','sub','order by','status','" + createdby + "',now() ) ";

         
            
    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);
    
    if (isUpdate == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>