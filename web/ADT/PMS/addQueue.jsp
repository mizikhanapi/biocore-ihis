<%-- 
    Document   : saveQueueName
    Created on : Feb 8, 2017, 12:01:51 PM
    Author     : shay
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page import="Config.Config"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
    Date dateobj = new Date();
    df.format(dateobj);
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();

    //String name = "wname";
    String code = "FY";
    String name = request.getParameter("wnamequeue");
    String desc = "1";
    String userid = request.getParameter("createdBy");
    String category = "003";
    String status = "0";
    String createdBy = request.getParameter("createdBy");
    String hfc = request.getParameter("hfc");
    String dis = request.getParameter("Dis");
    String sub = request.getParameter("sub");
    String pmino = request.getParameter("pmino");

    // String createdBy = "Dr002";
    //   String hfc ="04010101";
    // String dis = "002";
    //   String sub = "1";
    // String checkData = "select queue_type from pms_queue_name where queue_type='" + code + "' and queue_name='" + name + "' and hfc_cd='" + hfc + "' and discipline_code='" + dis + "'";
    //String sql = "";
    //  Boolean operation = false;
//    ArrayList<ArrayList<String>> resultCheck;
    String sql = "insert into pms_patient_queue( queue_type,queue_name,queue_no,user_id,patient_category,status,created_by,created_date,hfc_cd,episode_date,pmi_no, discipline_cd, subdiscipline_cd) values"
            + "('" + code + "','" + name + "','" + desc + "', NULL,'" + category + "','" + status + "','" + createdBy + "',NOW(),'" + hfc + "',NOW(),'" + pmino + "', '"+dis+"', '"+sub+"' );";

    boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
    if (isInsert == true) {
        out.print("Success");
    } else {
        out.print("Failed: "+sql);
    }

%>
