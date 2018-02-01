
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
    String verify = request.getParameter("verify");
    String idresult = request.getParameter("idresult");
    
    String item_cd = (String)session.getAttribute("item_cd");
    String specimen_no = (String)session.getAttribute("specimen_no");
    String order_no = (String)session.getAttribute("order_no");
    
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
  
    String sqlUpdate1 = "UPDATE lis_specimen SET Approval='Already Verified' WHERE item_cd='"+item_cd+"' AND specimen_no = '"+specimen_no+"'";
    rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate1);
       
    String sqlUpdate2 = "UPDATE lis_order_detail SET Verification='Already Verified',detail_status='2' WHERE item_cd='"+item_cd+"' AND order_no = '"+order_no+"'";
    rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate2);
    
   
    String sqlUpdate = "UPDATE lis_result SET Verification = '" + verify + "' WHERE id_result='"+idresult+"'";
    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);
    
     if (isUpdate) {
        out.print("-|1");
        return;
    } else {
        out.print("-|-1");
        return;
    }
     
    
%>