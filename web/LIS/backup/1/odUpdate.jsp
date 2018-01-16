
<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%           
    String tcode = request.getParameter("tcode");
    String fcomment = request.getParameter("fcomment");
    String order_no = request.getParameter("order_no");
    DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
    String collectionDate = request.getParameter("collectionDate");
    
    Date dateobj = new Date();
    df.format(dateobj);

    // out.println(ccode);
    // out.println(cname);
    // out.println(cstatus);
    // out.println(dateobj);
    // out.println(createdby);
    RMIConnector rmic = new RMIConnector();
    //Statement st = con.createStatement();
    // st.executeUpdate("INSERT INTO lis_item_category(category_code,category_name,status,hfc_cd,discipline_cd,subdiscipline_cd,created_by,created_date) VALUES ('"+ccode+"','"+cname+"','"+cstatus+"','25','52','1','"+createdby+"','0000-00-00')");
    Conn conn = new Conn();
    String sqlInsert = "UPDATE lis_order_detail SET comment = '" + fcomment + "', collectionDate = '"+collectionDate+"' WHERE order_no='"+order_no+"' AND item_cd = '" + tcode + "'";
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