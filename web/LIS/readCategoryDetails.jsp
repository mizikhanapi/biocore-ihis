<%-- 
    Document   : tDetailInsert
    Created on : Dec 6, 2016, 11:46:19 AM
    Author     : Ahmed
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.connect"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@include file="connectDB.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%           
    try{
    
    String pmino = request.getParameter("pmino");
    String orderno = request.getParameter("orderno");
    String  ordate = request.getParameter("ordate");
    String epdate = request.getParameter("epdate");
    String itemcode = request.getParameter("itemcode");
    String itemname = request.getParameter("itemname");
    String s_source = request.getParameter("s_source");
    String s_container = request.getParameter("s_container");
    String v_req = request.getParameter("v_req");
    String s_inst = request.getParameter("s_inst");
    String createdby = "Ahmed Shiekh";

    // out.println(ccode);
    // out.println(cname);
    // out.println(cstatus);
    // out.println(dateobj);
    // out.println(createdby);
   // RMIConnector rmic = new RMIConnector();
   Statement st = con.createStatement();
    //st.executeUpdate("INSERT INTO lis_order_detail(order_no,item_cd,episode_date,encounter_date,requestor_comments,filler_comments,order_status,verify_by,verify_date,created_by,created_date,pmi_no,spe_source,item_name,volume,spe_container,comment,special_inst,order_date) VALUES ('" + orderno + "','" + itemcode + "','" + epdate + "','','','','','"+createdby+"','','"+createdby+"','','"+pmino+"','"+s_source+"','" + itemname + "','" + v_req + "','" + s_container + "','','" + s_inst + "','" + orderdate ')");
        //String sqlInsert = "INSERT INTO lis_order_detail(order_no,item_cd,episode_date,encounter_date,requestor_comments,filler_comments,order_status,verify_by,verify_date,created_by,created_date,pmi_no,spe_source,item_name,volume,spe_container,comment,special_inst,order_date "
                //+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
   
   String sqlInsert = "INSERT INTO lis_order_detail(order_no,item_cd,episode_date,encounter_date,requestor_comments,filler_comments,order_status,verify_by,verify_date,created_by,created_date,pmi_no,spe_source,item_name,volume,spe_container,comment,special_inst,order_date) VALUES ('" + orderno + "','" + itemcode + "','" + epdate + "','0000-00-00','MMM','AAA','E','"+createdby+"','0000-00-00','"+createdby+"','0000-00-00','"+pmino+"','"+s_source+"','" + itemname + "','" + v_req + "','" + s_container + "','sdds','" + s_inst + "','" + ordate + "')";
   st.executeLargeUpdate(sqlInsert);
       // st.executeUpdate(sqlInsert);
       /* PreparedStatement prep = con.prepareStatement(sqlInsert);
        prep.setString(1, orderno);
        prep.setString(2, itemcode);
        prep.setString(3, epdate);
        prep.setString(4, "0000-00-00");
        prep.setString(5, "ffdd");
        prep.setString(6, "hh");
        prep.setString(7, "Active");
        prep.setString(8, createdby);
        prep.setString(9, "0000-00-00");
        prep.setString(10, createdby);
        prep.setString(11, "0000-00-00");
        prep.setString(12, pmino);
        prep.setString(13, s_source);
        prep.setString(14, itemname);
        prep.setString(15, v_req);
        prep.setString(16, s_container);
        prep.setString(17, "Compulsory");
        prep.setString(18, s_inst);
        prep.setString(19, orderdate);*/
        out.println("Done!");
    }catch(Exception e){
         out.println(e);
    }

  // String sqlInsert = "INSERT INTO lis_order_detail(order_no,item_cd,episode_date,encounter_date,requestor_comments,filler_comments,order_status,verify_by,verify_date,created_by,created_date,pmi_no,spe_source,item_name,volume,spe_container,comment,special_inst,order_date) VALUES ('" + orderno + "','" + itemcode + "','" + epdate + "','','','','','"+createdby+"','','"+createdby+"','','"+pmino+"','"+s_source+"','" + itemname + "','" + v_req + "','" + s_container + "','','" + s_inst + "','" + orderdate + "')";
    //  + "VALUES ('"+ccode+"','"+cname+"','"+cstatus+"','25','52','1','33','"+createdby+"','-')";
    //boolean isInsert = rmic.setQuerySQL(connect.HOST, connect.PORT, sqlInsert);
    //out.println(isInsert);
   // if (isInsert) {
      //  out.print("-|1");
        //return;
    //} else {
    //    out.print("-|-1");
    //    return;
   // }
   // }catch(Exception e){
   //     out.println(e.getMessage());
   // }
%>
