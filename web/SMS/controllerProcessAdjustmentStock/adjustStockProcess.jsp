<%-- 
    Document   : adjustStockProcess
    Created on : Oct 15, 2018, 10:33:34 AM
    Author     : shay
--%>

<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="Formatter.DateFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    LocalDateTime now = LocalDateTime.now();
    String created_date = format.format(now);
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    String created_by = session.getAttribute("USER_ID").toString();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String store = request.getParameter("store");
    String itemcode = request.getParameter("itemcode");
    String itemtype = request.getParameter("itemtype");
    String mode = request.getParameter("mode");
    String addate = request.getParameter("date");
    String referenceno = request.getParameter("referenceno");
    String account = request.getParameter("account");
    String reason = request.getParameter("reason");
    String description = request.getParameter("description");
    String qtyonhand = request.getParameter("quantityonhand");
    String valonhand = request.getParameter("valueonhand");
    String adjustedqty = request.getParameter("adjustedquantity");
    String adjustval = request.getParameter("adjustedvalue");
    String newqtyonhand = request.getParameter("newonhandquantity");
    String newvalonhand = request.getParameter("newonhandvalue");
    
    String sqlupdate ="";
    String updatecolumn = "";
    if(itemtype.equalsIgnoreCase("drug")){
        if(mode.equalsIgnoreCase("QA")){
            updatecolumn = "set d_stock_qty ='"+newqtyonhand+"'";
        }else if(mode.equalsIgnoreCase("va")){
            updatecolumn = "set d_sell_price ='"+newvalonhand+"'";
        }
        sqlupdate = "UPDATE pis_mdc2 "+updatecolumn+" WHERE ud_mdc_code = '"+itemcode+"' AND hfc_cd = '"+hfc+"' AND discipline_cd = '"+store+"'";
    }else if(itemtype.equalsIgnoreCase("other")){
        if(mode.equalsIgnoreCase("QA")){
            updatecolumn = "set physical_stock ='"+newqtyonhand+"'";
        }else if(mode.equalsIgnoreCase("va")){
            updatecolumn = "set selling_price ='"+newvalonhand+"'";
        }
        sqlupdate = "UPDATE stk_stock_item "+updatecolumn+" WHERE item_cd = '"+itemcode+"' AND hfc_cd = '"+hfc+"' AND discipline_cd = '"+store+"'";
    }
    
    boolean isupdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlupdate);
    if(isupdate){
        String sqlinsert = "INSERT INTO stk_adjustment_txn (txn_date,item_cd,item_type,adjustment_mode,reference_no,"
                + "adjust_by,hfc_cd,discipline_cd,subdiscipline_cd,current_value,stock_on_hand,changed_value,new_qty_on_hand,"
                + "adjustment_reason,description,created_date,created_by) VALUES('"+addate+"','"+itemcode+"','"+itemtype+"','"+mode+"',"
                + "'"+referenceno+"','"+created_by+"','"+hfc+"','"+store+"','','"+valonhand+"','"+qtyonhand+"','"+newvalonhand+"','"+newqtyonhand+"',"
                + "'"+reason+"','"+description+"','"+created_date+"','"+created_by+"')";
        boolean isinsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlinsert);
        if(isinsert){
            out.print("success");
        }else{
            out.print("fail");
        }
    }else{
        out.print("fail");
    }
%>

