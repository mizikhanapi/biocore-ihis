<%-- 
    Document   : getDisWard
    Created on : 13-Apr-2017, 17:17:55
    Author     : shay
--%>

<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn conn = new Conn();
     String key = request.getParameter("input");
     String hfc = request.getParameter("hfc");
    String searchProblem = "SELECT w.discipline_cd,a.discipline_name from wis_ward_class w inner join adm_discipline a on w.discipline_cd = a.discipline_cd  where w.ward_class_code ='"+key+"' and w.hfc_cd='"+hfc+"'";
    ArrayList<ArrayList<String>> search = conn.getData(searchProblem);
    ArrayList<String> search3 = search.get(0);
    String newVal = StringUtils.join(search3, "|");
    out.print(newVal);
%>
