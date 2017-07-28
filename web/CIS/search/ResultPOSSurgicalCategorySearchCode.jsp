
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
     Conn Conn = new Conn();
    //String key = request.getParameter("input");
    String name = request.getParameter("name");

    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();

    String searchProblem = "SELECT category_cd FROM opt_procedure_category WHERE hfc_cd = '"+hfc_cd+"' AND category_name = '"+name+"' ";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    if (search.size() > 0) {
         out.print(search.get(0).get(0));
//        for (int i = 0; i < search.size(); i++) {
//            out.print(String.join("|", search.get(i)));
//        }
    }
    

%>        

