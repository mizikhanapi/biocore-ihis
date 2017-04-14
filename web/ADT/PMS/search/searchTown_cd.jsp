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
    String searchProblem = "select detail_reference_code from adm_lookup_detail where master_reference_code = '0003' and description = '"+ id +"';";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {

            out.print(String.join("|", search.get(i)));
        }
    }
%>            
