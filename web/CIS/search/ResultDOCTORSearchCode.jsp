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
   
    String doctor = request.getParameter("name");
    String hfc_cd = request.getParameter("hfc_code");
  

    String searchProblem = "SELECT `USER_ID` FROM adm_users WHERE  `OCCUPATION_CODE` = '002' AND `HEALTH_FACILITY_CODE` = '"+hfc_cd+"' AND `USER_NAME` LIKE '%"+doctor+"%' ;";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
   // out.print(searchProblem);

    if (search.size() > 0) {
        out.print(search.get(0).get(0));
    }
%>        
