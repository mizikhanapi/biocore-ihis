
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
    String tcode = request.getParameter("tcode");
    String order_no = request.getParameter("order_no");
    DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
    
    Date dateobj = new Date();
    df.format(dateobj);
    RMIConnector rmic = new RMIConnector();
    
     Conn conn = new Conn();
    String sqlInsert = "UPDATE lis_order_detail SET filler_comments = '-', collectionDate = '-' WHERE order_no='"+order_no+"' AND item_cd = '" + tcode + "'";
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