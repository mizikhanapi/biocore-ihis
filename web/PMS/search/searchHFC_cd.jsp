<%-- 
    Document   : searchTown_cd
    Created on : Mar 13, 2017, 9:08:25 PM
    Author     : shay
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
     Conn Conn = new Conn();
    //String key = request.getParameter("input");
    String id = request.getParameter("id");
    
    id.toLowerCase();
    String searchProblem = "select hfc_cd from adm_health_facility where CONCAT(UPPER(hfc_name),LOWER(hfc_name)) like '%" + id + "%';";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {

            out.print(String.join("|", search.get(i)));
        }
    }
%>            
