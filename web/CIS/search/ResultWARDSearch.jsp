

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    
    String key = request.getParameter("keyword");
    String hfc_cd = request.getParameter("hfc_code");
    String discipline_cd = request.getParameter("discipline_cd");
    String wardClass = request.getParameter("class");
    
    //String key ="fever";
    String searchProblem = "SELECT ward_name FROM wis_ward_name "
            + " WHERE hfc_cd = '" + hfc_cd + "' AND discipline_cd = '" + discipline_cd + "' "
            + " AND ward_class_code = '" + wardClass + "' AND "
            + " CONCAT(UPPER(ward_name),LOWER(ward_name)) like '%" + key + "%';";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    
    String data = "[";
    
    if (search.size() > 0) {
        out.print("[");
        for (int i = 0; i < search.size(); i++) {

            if (i == search.size() - 1) {
                data += "{ \"name\" : \"" + search.get(i).get(0) + "\"}";
                out.print(
                        "{ \"name\" : \"" + search.get(i).get(0) + "\"}"
                );
            } else {
                data += "{ \"name\" : \"" + search.get(i).get(0) + "\"},";
                out.print(
                        "{ \"name\" : \"" + search.get(i).get(0) + "\"},"
                );
            }
        }
        data += "]";
        out.print("]");
    }

%>
