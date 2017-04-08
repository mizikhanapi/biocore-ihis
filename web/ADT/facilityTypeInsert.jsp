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
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String wclass, wclassid, wstatus;

    wclass = request.getParameter("MWClass");
    wclassid = request.getParameter("MWID");
    wstatus = request.getParameter("status");
    String hfc = request.getParameter("hfc");
    String dis = request.getParameter("dis");
    String sub = request.getParameter("sub");

    String createdBy = request.getParameter("id");
    DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
    Date dateobj = new Date();
    df.format(dateobj);
    String sqlCheck = "SELECT ward_class_code from wis_ward_class WHERE ward_class_code = '" + wclassid + "'AND hfc_cd='"+hfc+"' LIMIT 1 ";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);

    if (duplicate.size() > 0) {
        out.print("Duplicate");
    } else {

        String sqlInsert = "INSERT INTO wis_ward_class(ward_class_name,ward_class_code,ward_class_status,hfc_cd,discipline_cd,subdiscipline_cd,created_by,created_date) VALUES"
                + " ('" + wclass + "','" + wclassid + "','" + wstatus + "','" + hfc + "','" + dis + "','" + sub + "','" + createdBy + "',now())";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }
    }

%>