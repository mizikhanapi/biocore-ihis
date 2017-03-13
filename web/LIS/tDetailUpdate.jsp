
<%@page import="dBConn.Conn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%        
    
    String icd10 = request.getParameter("icd10");
    String analytename = request.getParameter("analytename");
    String s_source = request.getParameter("s_source");
    String s_container = request.getParameter("s_container");
    String v_req = request.getParameter("v_req");
    String s_inst = request.getParameter("s_inst");
    String b_price = request.getParameter("b_price");
    String s_price = request.getParameter("s_price");
    String status = request.getParameter("status");
  //  DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
  //  Date dateobj = new Date();
  //  df.format(dateobj);
    //String createdby = "Ahmed Shiekh";

    // out.println(ccode);
    // out.println(cname);
    // out.println(cstatus);
    // out.println(dateobj);
    // out.println(createdby);
    RMIConnector rmic = new RMIConnector();
    //Statement st = con.createStatement();
    // st.executeUpdate("INSERT INTO lis_item_category(category_code,category_name,status,hfc_cd,discipline_cd,subdiscipline_cd,created_by,created_date) VALUES ('"+ccode+"','"+cname+"','"+cstatus+"','25','52','1','"+createdby+"','0000-00-00')");
  //  String sqlInsert = "UPDATE lis_item_category SET category_name = '" + cname + "', status = '" + cstatus + "' WHERE category_code = '" + ccode + "' ";
   Conn conn = new Conn(); 
   String sqlUpdate = "UPDATE lis_item_detail SET item_name = '" + analytename + "', spe_source = '"+s_source+"', spe_container = '"+s_container+"', volume = '"+v_req+"',special_inst = '"+s_inst+"', buy_price = '"+b_price+"', ser_price = '"+s_price+"', status = '"+status+"' WHERE item_cd = '" + icd10 + "' ";
    //  + "VALUES ('"+ccode+"','"+cname+"','"+cstatus+"','25','52','1','33','"+createdby+"','-')";
     rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);
    //out.println(isInsert);
    
%>
