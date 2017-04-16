
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
  
    String BedN, WardNameN, WardClassN, Dis, Deposit,pmino,hfc;
    
    BedN = request.getParameter("BedN");
    hfc = request.getParameter("hfc");
    WardNameN = request.getParameter("WardNameN");
    WardClassN = request.getParameter("WardClassN");
    Dis = request.getParameter("Dis");
    pmino = request.getParameter("pmino");
    Deposit = request.getParameter("Deposit");
   
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlUpdate = "UPDATE wis_inpatient_episode SET ward_class_code = '" + WardNameN + "',ward_id = '" + WardClassN + "',bed_id = '" + BedN + "',"
            + "discipline_cd = '" + Dis + "',"
            + "DEPOSIT_INPATIENT = '" + Deposit + "' WHERE pmi_no = '" + pmino + "' ";
    String updateBed = "UPDATE wis_bed_id SET bed_status = 'Occupied' where hfc_cd ='"+hfc+"' and discipline_cd ='"+Dis+"' and bed_id ='"+BedN+"' ";
         
    boolean isUpdateBed = rmic.setQuerySQL(conn.HOST, conn.PORT, updateBed);
    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);
    
    if (isUpdate == true && isUpdateBed == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>