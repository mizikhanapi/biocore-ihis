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
   
    String wardClass = request.getParameter("name");
    String hfc_cd = request.getParameter("hfc_code");
    String discipline_cd= request.getParameter("discipline_cd");

    String searchProblem = "SELECT ward_class_code FROM wis_ward_class WHERE hfc_cd = '"+hfc_cd+"' and discipline_cd = '"+discipline_cd+"' AND ward_class_name LIKE '%"+wardClass+"%'";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
   // out.print(searchProblem);

    if (search.size() > 0) {
        out.print(search.get(0).get(0));

//        for (int i = 0; i < search.size(); i++) {
//
//            out.print(String.join("|", search.get(i)));
//        }
    }
%>        
