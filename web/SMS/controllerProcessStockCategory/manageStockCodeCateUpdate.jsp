<%-- 
    Document   : manageStockCodeCateUpdate
    Created on : Nov 14, 2017, 6:48:41 PM
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
    String cateCode = request.getParameter("cateCode");
    String cateName = request.getParameter("cateName");
    String cateGLCode = request.getParameter("cateGLCode");
    String cateStatus = request.getParameter("cateStatus");

    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();

    String sqlUpdate = "UPDATE stk_stock_category SET category_name = '" + cateName + "',gl_cd = '" + cateGLCode + "',status = '" + cateStatus + "' "
            + " WHERE category_cd = '" + cateCode + "' AND hfc_cd  = '" + hfc + "' AND discipline_cd   = '" + dis + "' ";

    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);

    if (isUpdate == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }

%>