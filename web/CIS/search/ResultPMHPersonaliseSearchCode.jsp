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
    //String key = request.getParameter("input");
    String id = request.getParameter("id");
    String user_id = (String)session.getAttribute("USER_ID");

    String searchProblem = "SELECT clinical_term_code FROM cis_personalised_clinical_term WHERE code_type = 'PMH' AND user_id = '"+user_id+"' AND UPPER(clinical_term_name) LIKE '%"+id+"%'; ";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    //out.print(searchProblem);
    if (search.size() > 0) {
        
        out.print(search.get(0).get(0));

//        for (int i = 0; i < search.size(); i++) {
//
//            out.print(String.join("|", search.get(i)));
//        }
    }
%>        
