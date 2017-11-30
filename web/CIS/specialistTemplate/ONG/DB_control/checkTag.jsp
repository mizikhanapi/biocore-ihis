<%-- 
    Document   : checkTag.jsp
    Created on : Nov 30, 2017, 11:03:39 PM
    Author     : shay
--%>

<%@page import="OnG_helper.TagGen"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String data = request.getParameter("datas");
    TagGen tg = new TagGen();
    String tagnumber = tg.mainGen(data);
out.print(tagnumber);

%>