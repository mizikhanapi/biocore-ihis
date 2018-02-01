
<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%           
    String Result = request.getParameter("Result");
    String Remark = request.getParameter("Remark");
    String testDate = request.getParameter("testDate");
    String testTime = request.getParameter("testTime");
    String performBy = request.getParameter("performBy");
    String idResult = request.getParameter("idResult");
    String picture = request.getParameter("pic");
    
    RMIConnector rmic = new RMIConnector();
    //Statement st = con.createStatement();
    // st.executeUpdate("INSERT INTO lis_item_category(category_code,category_name,status,hfc_cd,discipline_cd,subdiscipline_cd,created_by,created_date) VALUES ('"+ccode+"','"+cname+"','"+cstatus+"','25','52','1','"+createdby+"','0000-00-00')");
    Conn conn = new Conn();
    String sqlUpdate = "UPDATE lis_result SET result = '" + Result + "', remark = '" + Remark + "', test_date = '" + testDate + "', test_time = '" + testTime + "', performBy = '" + performBy + "', picture = '"+picture+"' WHERE id_result = '"+idResult+"'";
    //  + "VALUES ('"+ccode+"','"+cname+"','"+cstatus+"','25','52','1','33','"+createdby+"','-')";
    rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);
   
%>