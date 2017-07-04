

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String key = request.getParameter("keyword");
    //String key ="Alb";
    String searchProblem = "select item_name,spe_source from lis_item_detail where CONCAT(UPPER(item_name),LOWER(item_name)) like '%" +  key + "%' ";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);

    if (search.size() > 0) {
        out.print("[");
        for (int i = 0; i < search.size(); i++) {

            if (i == search.size() - 1) {
               
                out.print(
                        "{ \"name\" : \"" + search.get(i).get(0)+ "\","
                                + "\"source\" : \"" + search.get(i).get(1)+"\"}"
                );
            } else {
                
                out.print(
                        "{ \"name\" : \"" + search.get(i).get(0)+  "\","
                         + "\"source\" : \"" + search.get(i).get(1)+"\"},"
                );
            }
        }
        out.print("]");
    }

%>
