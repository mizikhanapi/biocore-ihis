
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

    String dis = request.getParameter("Dis");
    String wclass = request.getParameter("Ward_Class");
    String wid = request.getParameter("Ward_ID");
    String wbedid = request.getParameter("BedID");
    String wstatus = request.getParameter("status");
    String hfc = request.getParameter("hfc");
      String sub = request.getParameter("sub");

    String createdBy = request.getParameter("createdBy");
//    
 // String hfcOld = request.getParameter("hfcOld");
//    String disOld = request.getParameter("DisciplineOld");
//    String wclassOld = request.getParameter("Ward_ClassOld");
//    String widOld = request.getParameter("Ward_IDOld");
//    String wbedidOls = request.getParameter("BedIDOld");

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlUpdate = "UPDATE wis_bed_id SET `discipline_cd` = '" + dis + "', `ward_class_code` = '" + wclass + "',"
            + " `ward_id` = '" + wid + "', `bed_id` = '" + wbedid + "', `bed_status` = '" + wstatus + "' ,"
            + " hfc_cd = '" + hfc + "',subdiscipline_cd = '" + sub + "', created_by = '" + createdBy + "' WHERE bed_id = '" + wbedid + "' AND  hfc_cd = '" + hfc + "'  ";

//    String sqlUpdate = "UPDATE wis_bed_id SET discipline_cd = '" + dis + "', ward_class_code = '" + wclass + "',ward_id = '" + wid + "', bed_id = '" + wbedid + "', bed_status = '" + wstatus + "' WHERE ward_class_code = '" + wclass + "' ";
    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);

    if (isUpdate == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }
    out.print(sqlUpdate);

%>