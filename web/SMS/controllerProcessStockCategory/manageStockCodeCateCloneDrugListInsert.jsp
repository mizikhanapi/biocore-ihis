<%-- 
    Document   : manageStockCodeCateCloneDrugListInsert
    Created on : Nov 14, 2017, 12:50:52 PM
    Author     : Shammugam
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Conn conn = new Conn();
    String superUserHFC = "99_iHIS_99";
    String superUserDIS = "99_iHIS_99";
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    LocalDateTime now = LocalDateTime.now();

    String created_by = session.getAttribute("USER_ID").toString();
    String created_date = format.format(now);

    String sqlInsert = "";

    String strSTOCKCATEClone = request.getParameter("strSTOCKCATEClone");

    String cates[] = strSTOCKCATEClone.split("\\|");

    RMIConnector rmic = new RMIConnector();

    boolean isInsert = false;

    for (int i = 0; i < cates.length; i++) {

        sqlInsert = "INSERT INTO stk_stock_category (category_cd, category_name, hfc_cd, discipline_cd, subdiscipline_cd,"
                + " gl_cd, status, created_by, created_date) "
                + " SELECT category_cd, category_name, '" + hfc + "','" + dis + "', '" + sub + "', gl_cd, status,'" + created_by + "', '" + created_date + "' "
                + " FROM stk_stock_category WHERE category_cd = '" + cates[i] + "' AND hfc_cd = '" + superUserHFC + "' ";

        isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

    }

    if (isInsert == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }


%>