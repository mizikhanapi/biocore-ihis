<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String specimen_no = request.getParameter("specimen_no");
    String pmi = request.getParameter("pmi");
    String item_cd = request.getParameter("item_cd");
    String testName = request.getParameter("testName");
    String Result = request.getParameter("Result");
    String Remark = request.getParameter("Remark");
    String testDate = request.getParameter("testDate");
    String testTime = request.getParameter("testTime");
    String performBy = request.getParameter("performBy");
    String order_no = request.getParameter("order_no");
    String verification = "Waiting Approval";
  
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    
    String count  = "SELECT MAX(id_result) FROM lis_assign_result";
    //String count = "SELECT CONCAT('LAR',LPAD(SUBSTRING(COALESCE(MAX(id_result),'LAR000'),4,4)+1,4,'0'))FROM lis_assign_result";
    ArrayList<ArrayList<String>> insert = conn.getData(count);
    
    int get1 = Integer.parseInt(insert.get(0).get(0));	
    int idResult = get1+1;       
    String sqlInsert = "INSERT INTO lis_assign_result(item_cd,pmi_no,specimen_no,result,remark,test_name,test_date,testTime,performBy,verification,order_no,id_result) VALUES ('" + item_cd + "','" + pmi + "','" + specimen_no + "','" + Result + "','" + Remark + "','" + testName + "','"+testDate+"','"+testTime+"','"+performBy+"','"+verification+"','"+order_no+"','"+idResult+"')";
    rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);
    
    String sqlUpdate = "UPDATE lis_specimen SET Approval = '" + verification + "' WHERE item_cd = '" + item_cd + "' AND specimen_no = '"+specimen_no+"' ";
    rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);
%>
