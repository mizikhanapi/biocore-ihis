
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
    String ccode = request.getParameter("testCat");
    String cname = request.getParameter("testCatName");
    String cstatus = request.getParameter("status");
    DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
    Date dateobj = new Date();
    df.format(dateobj);
    String createdby = "Ahmed Shiekh";

    // out.println(ccode);
    // out.println(cname);
    // out.println(cstatus);
    // out.println(dateobj);
    // out.println(createdby);
    RMIConnector rmic = new RMIConnector();
    //Statement st = con.createStatement();
    // st.executeUpdate("INSERT INTO lis_item_category(category_code,category_name,status,hfc_cd,discipline_cd,subdiscipline_cd,created_by,created_date) VALUES ('"+ccode+"','"+cname+"','"+cstatus+"','25','52','1','"+createdby+"','0000-00-00')");
    Conn conn = new Conn();
    String sqlInsert = "UPDATE lis_item_category SET category_name = '" + cname + "', status = '" + cstatus + "' WHERE category_code = '" + ccode + "' ";
    //  + "VALUES ('"+ccode+"','"+cname+"','"+cstatus+"','25','52','1','33','"+createdby+"','-')";
    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);
    //out.println(isInsert);
    if (isUpdate) {
        out.print("-|1");
        return;
    } else {
        out.print("-|-1");
        return;
    }

%>