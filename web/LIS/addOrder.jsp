<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%
    String order = request.getParameter("order");
    String itemCD = request.getParameter("itemCD");
    String pmiNo = request.getParameter("pmiNo");
    String Comment = request.getParameter("Comment");
    SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String user = session.getAttribute("USER_NAME").toString();
    
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    String OrderDetail = "SELECT item_name,spe_source,spe_container,volume,special_inst FROM lis_item_detail WHERE item_cd = '"+itemCD+"'";
    ArrayList<ArrayList<String>> q1 = conn.getData(OrderDetail);
    //                                                  1       2           3               4               5           6       7       8           9       10          11          12          13          14           
    String sqlInsert = "INSERT INTO lis_order_detail(order_no,item_cd,episode_date,requestor_comments,created_by,created_date,pmi_no,spe_source,item_name,volume,spe_container,special_inst,order_date,Verification,comment) VALUES ('"+ order +"','"+ itemCD +"','2017-05-11 22:54:46.000','"+ Comment +"','"+ user +"','2017-05-11 22:54:46.000','"+ pmiNo +"','"+ q1.get(0).get(1) +"','"+ q1.get(0).get(0) +"','"+ q1.get(0).get(3) +"','"+ q1.get(0).get(2) +"','"+ q1.get(0).get(4) +"','2017-05-11 22:54:46.000','-','-')";
    //String sqlInsert = "INSERT INTO lis_order_detail(order_no,item_cd,episode_date,requestor_comments,created_by,created_date,pmi_no,spe_source,item_name,volume,spe_container,special_inst,order_date) VALUES ('"+ order +"','"+ itemCD +"','"+ date +"','"+ Comment +"','"+ user +"','"+ date +"','"+ pmiNo +"','test','set','setse','set','ghtry','rdyt')";

    rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);
    
%>