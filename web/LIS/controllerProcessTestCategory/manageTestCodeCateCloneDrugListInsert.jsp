<%-- 
    Document   : manageTestCodeCateCloneDrugListInsert
    Created on : Jan 12, 2018, 12:36:15 PM
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

    String strTESTCATEClone = request.getParameter("strTESTCATEClone");

    String cates[] = strTESTCATEClone.split("\\|");

    RMIConnector rmic = new RMIConnector();

    boolean isInsert = false;

    for (int i = 0; i < cates.length; i++) {

        sqlInsert = "INSERT INTO lis_item_category (category_code, hfc_cd, category_name, status, discipline_cd, subdiscipline_cd, created_by, created_date) "
                + " SELECT category_code, '" + hfc + "', category_name, status, '" + dis + "', '" + sub + "','" + created_by + "', '" + created_date + "' "
                + " FROM lis_item_category WHERE category_code = '" + cates[i] + "' AND hfc_cd = '" + superUserHFC + "' ";

        isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

    }

    if (isInsert == true) {
        out.print("Success");
    } else {
        out.print("Failed");
    }


%>