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
   
    String disciplineName = request.getParameter("name");
    String hfc_cd = request.getParameter("hfc_cd");
    String dis_code = request.getParameter("discipline_cd");

    String searchProblem = "SELECT subdiscipline_cd FROM adm_subdiscipline where subdiscipline_hfc_cd = '"+hfc_cd+"' AND discipline_cd = '"+dis_code+"' AND subdiscipline_name = '"+disciplineName+"' ";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);

    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {

            out.print(String.join("|", search.get(i)));
        }
    }
%>        
