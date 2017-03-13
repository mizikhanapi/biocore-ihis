<%@page import="dbConn1.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<div id="count"><% 
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    String sqlRow = "SELECT COUNT(order_no) FROM new";
    rmic.setQuerySQL(connect.HOST, connect.PORT, sqlRow);
    ArrayList<ArrayList<String>> q1 = conn.getData(sqlRow);
    out.print(q1.get(0).get(0));
    %></div>
