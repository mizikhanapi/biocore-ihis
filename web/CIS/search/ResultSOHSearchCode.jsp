
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
     Conn Conn = new Conn();
    //String key = request.getParameter("input");
    String id = request.getParameter("id");

    String searchProblem = "SELECT rsh_code FROM readcode_social_history where rsh_desc = '" + id + "' ";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
   // out.print(searchProblem);
    if (search.size() > 0) {
 out.print(search.get(0).get(0));
//        for (int i = 0; i < search.size(); i++) {
//
////            out.println(search.get(i).get(0));
////            out.println(search.get(i).get(1));
////            out.println(search.get(i).get(2));
//            out.print(String.join("|", search.get(i)));
//        }
    }
%>        

