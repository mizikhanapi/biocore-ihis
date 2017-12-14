<%-- 
    Document   : orderStockBasicInfo
    Created on : Dec 13, 2017, 3:39:40 PM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Config.Config"%>


<%
    Conn conn = new Conn();
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String dis = session.getAttribute("DISCIPLINE_CODE").toString();
    String sub = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
%>

<h2>
    ORDER STOCK
</h1>

<hr/>

<%@include file = "orderStockModal.jsp" %>

<!-- Add Part Start -->
<!-- Add Button Start -->
<h4 style="padding-top: 30px;padding-bottom: 35px; font-weight: bold">
    <span class="pull-right">
        <button id="addNewOrderStockItemButton" class="btn btn-primary" data-status="pagado" data-toggle="modal" data-id="1" data-target="#orderNewStockOrder" style=" padding-right: 10px;padding-left: 10px;color: white;"><a data-toggle="tooltip" data-placement="top" title="Add Items" id="test"><i class=" fa fa-plus" style=" padding-right: 10px;padding-left: 10px;color: white;"></i></a>ADD STOCK ITEM</button>
    </span>
</h4>
