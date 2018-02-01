<%-- 
    Document   : tDetailInsert
    Created on : Dec 6, 2016, 11:46:19 AM
    Author     : Ahmed
--%>
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
    
    
    String pmino = request.getParameter("pmino");
    String orderno = request.getParameter("orderno");
    String  ordate = request.getParameter("ordate");
    String epdate = request.getParameter("epdate");
    String itemcode = request.getParameter("itemcode");
    String itemname = request.getParameter("itemname");
    String ssource = request.getParameter("ssource");
    String scontainer = request.getParameter("scontainer");
    String vreq = request.getParameter("vreq");
    String sinst = request.getParameter("sinst");
    String rcomment = request.getParameter("rcomment");
    String createdby = "Ahmed Shiekh";

    // out.println(ccode);
    // out.println(cname);
    // out.println(cstatus);
    // out.println(dateobj);
    // out.println(createdby);
    RMIConnector rmic = new RMIConnector();
    //Statement st = con.createStatement();
    // st.executeUpdate("INSERT INTO lis_item_category(category_code,category_name,status,hfc_cd,discipline_cd,subdiscipline_cd,created_by,created_date) VALUES ('"+ccode+"','"+cname+"','"+cstatus+"','25','52','1','"+createdby+"','0000-00-00')");
        //String sqlInsert = "INSERT INTO lis_item_detail(item_cd,item_name,test_cat,spe_source,spe_container,volume,special_inst,status,buy_price,ser_price,hfc_cd,discipline_cd,subdiscipline_cd,created_by,created_date) "
                //+ "VALUES ('" + icd10 + "','" + item_name + "','" + ccode + "','','','','',"+status+"','','','',','','','','" + createdby + "','0000-00-00')";

    //String sqlInsert = "INSERT INTO lis_order_detail(order_no,item_cd,episode_date,encounter_date,requestor_comments,filler_comments,order_status,verify_by,verify_date,created_by,created_date,pmi_no,spe_source,item_name,volume,spe_container,comment,special_inst,order_date) VALUES ('" + orderno + "','" + itemcode + "','" + epdate + "','0000-00-00','"+rcomment+"','','A','"+createdby+"','0000-00-00','"+createdby+"','0000-00-00','"+pmino+"','"+ssource+"','" + itemname + "','" + vreq + "','" + scontainer + "','sdds','" + sinst + "','" + ordate + "')";
    //  + "VALUES ('"+ccode+"','"+cname+"','"+cstatus+"','25','52','1','33','"+createdby+"','-')";
    Conn conn = new Conn();
    String sqlInsert = "INSERT INTO lis_order_detail (order_no,item_cd,episode_date,encounter_date,requestor_comments,filler_comments,verify_by,verify_date,created_date,pmi_no,item_name,spe_container,order_date) VALUES ('"+orderno+"','"+itemcode+"','"+epdate+"','0000-00-00','"+rcomment+"','A','"+createdby+"','" + epdate + "','0000-00-00','"+pmino+"','"+itemname+"','"+scontainer+"','"+ordate+"')";
    rmic.setQuerySQL(connect.HOST, conn.PORT, sqlInsert);
    //out.println(isInsert);
    
%>
