<%-- 
    Document   : SearchDoctor_
    Created on : 17-Feb-2017, 11:27:58
    Author     : shay
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String id =request.getParameter("id");


    String searchProblem = "select `USER_ID` from adm_users where `USER_NAME` like '%"+id+"%'";

    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    if (search.size() > 0) {
        out.print(search.get(0).get(0));
}else{
out.print("|NA|");
}
%>