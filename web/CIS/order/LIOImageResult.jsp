<%-- 
    Document   : RISImageResult
    Created on : Jul 13, 2017, 4:44:04 PM
    Author     : -D-
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();

    String id_result = request.getParameter("id_result");


    String query = "Select ifnull(convert(picture using utf8), '') from lis_result where id_result = "+id_result+"";

    ArrayList<ArrayList<String>> dataLogo = conn.getData(query);

    String gamba = dataLogo.get(0).get(0);

   out.print(gamba);
%>
