<%-- 
    Document   : manageStockCodeCateInsert
    Created on : Nov 14, 2017, 6:30:55 PM
    Author     : Shammugam
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
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

    DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    LocalDateTime now = LocalDateTime.now();

    String cateCode = request.getParameter("cateCode");
    String cateName = request.getParameter("cateName");
    String cateGLCode = request.getParameter("cateGLCode");
    String cateStatus = request.getParameter("cateStatus");
    String created_by = session.getAttribute("USER_ID").toString();
    String created_date = format.format(now);
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlCheck = "SELECT category_cd from stk_stock_category WHERE category_cd = '" + cateCode + "' AND hfc_cd  = '" + hfc + "'  AND discipline_cd   = '" + dis + "' LIMIT 1 ";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);

    if (duplicate.size() > 0) {
        out.print("Duplicate");
    } else {

        String sqlInsert = "INSERT INTO stk_stock_category (category_cd, category_name, hfc_cd, discipline_cd, subdiscipline_cd, gl_cd,"
                + " status, created_by, created_date)"
                + " VALUES ('" + cateCode + "','" + cateName + "','" + hfc + "','" + dis + "',"
                + "'" + sub + "','" + cateGLCode + "','" + cateStatus + "','" + created_by + "','" + created_date + "' )";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }

    }

%>