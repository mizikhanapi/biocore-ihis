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

    String id = request.getParameter("cditem");
    String idcat = request.getParameter("idcat");

    // out.println(ccode);
    // out.println(cname);
    // out.println(cstatus);
    // out.println(dateobj);
    // out.println(createdby);
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    String sql = "DELETE FROM lis_item_detail WHERE item_cd = '" + id + "' and test_cat = '" + idcat + "' ";

    boolean status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

    if (status) {
        out.print("-|1");
        return;
    } else {
        out.print("-|-1");
        return;
    }
%>