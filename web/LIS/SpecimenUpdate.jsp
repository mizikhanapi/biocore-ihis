
<%@page import="dbConn1.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%           
    
    String cstatus = request.getParameter("status");
    String specimen_no = request.getParameter("specimen_no");
    String item_code = request.getParameter("item_code");
    String commen1 = request.getParameter("commen");
    String fcomment = request.getParameter("commen");
    // out.println(ccode);
    // out.println(cname);
    // out.println(cstatus);
    // out.println(dateobj);
    // out.println(createdby);
    RMIConnector rmic = new RMIConnector();
    //Statement st = con.createStatement();
    // st.executeUpdate("INSERT INTO lis_item_category(category_code,category_name,status,hfc_cd,discipline_cd,subdiscipline_cd,created_by,created_date) VALUES ('"+ccode+"','"+cname+"','"+cstatus+"','25','52','1','"+createdby+"','0000-00-00')");
    Conn conn = new Conn();
    String sqlInsert = "UPDATE lis_specimen SET Status_specimen = '" + cstatus + "', commen_specimen = '"+fcomment+"' WHERE specimen_no='"+specimen_no+"' AND item_cd='"+item_code+"'";
    //  + "VALUES ('"+ccode+"','"+cname+"','"+cstatus+"','25','52','1','33','"+createdby+"','-')";
    boolean isUpdate = rmic.setQuerySQL(connect.HOST, conn.PORT, sqlInsert);
    //out.println(isInsert);
    if (isUpdate) {
        out.print("-|1");
        return;
    } else {
        out.print("-|-1");
        return;
    }

%>