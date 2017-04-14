<%-- 
    Document   : searchTown_cd
    Created on : Mar 13, 2017, 9:08:25 PM
    Author     : shay
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="Formatter.quoteFomatter"%>
<%
     Conn Conn = new Conn();
    //String key = request.getParameter("input");
    String id = request.getParameter("id");
    quoteFomatter quotee = new quoteFomatter();
    id.toLowerCase();
    String newVal = quotee.quote(id);
    //out.print(newVal);
    

    
    String searchProblem = "select detail_reference_code from adm_lookup_detail where master_reference_code = '0026' and description = '"+ newVal +"';";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {

            out.print(String.join("|", search.get(i)));
        }
    }
%>            
