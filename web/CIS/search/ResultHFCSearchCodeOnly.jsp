<%-- 
    Document   : SearchCCN_cd
    Created on : 03-Feb-2017, 15:12:03
    Author     : ahmed
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
   
    String id = request.getParameter("id");

    String searchProblem = "SELECT hfc_cd FROM adm_health_facility WHERE hfc_name LIKE '%"+id+"%';";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
   // out.print(searchProblem);
    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {

            out.print(String.join("|", search.get(i)));
        }
    }
%>        
