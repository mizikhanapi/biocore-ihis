
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
     Conn Conn = new Conn();
    //String key = request.getParameter("input");
    String name = request.getParameter("name");
    String cat_cd = request.getParameter("cat_cd");
//    String name = "Destruction of Brain, Percutaneous Endoscopic Approach";
//    String cat_cd = "005";
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();

    String searchProblem = "SELECT procedure_cd  FROM opt_procedure   WHERE `procedure_longName` = '"+name+"'  AND category_cd = '"+cat_cd+"' AND hfc_cd = '"+hfc_cd+"'  ";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    if (search.size() > 0) {
         out.print(search.get(0).get(0));
//        for (int i = 0; i < search.size(); i++) {
//            out.print(String.join("|", search.get(i)));
//        }
    }
    

%>        

