

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String key = request.getParameter("keyword");
    //String key ="Alb";
    String searchProblem = "select item_name,spe_source,item_cd,test_cat,spe_container,volume,special_inst from lis_item_detail where CONCAT(UPPER(item_name),LOWER(item_name)) like '%" +  key + "%' ";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);

    if (search.size() > 0) {
        out.print("[");
        for (int i = 0; i < search.size(); i++) {

            if (i == search.size() - 1) {
               
                out.print(
                        "{ \"name\" : \"" + search.get(i).get(0)+ "\", "
                                + "\"source\" : \"" + search.get(i).get(1)+ "\","
                                + "\"code\" : \"" + search.get(i).get(2)+ "\","
                                + "\"category\" : \"" + search.get(i).get(3)+ "\","
                                + "\"container\" : \"" + search.get(i).get(4)+ "\","
                                + "\"volume\" : \"" + search.get(i).get(5)+ "\","
                                + "\"instruction\" : \"" + search.get(i).get(6)+"\"}"
                );
            } else {
                
                out.print(
                        "{ \"name\" : \"" + search.get(i).get(0)+ "\", "
                                + "\"source\" : \"" + search.get(i).get(1)+ "\","
                                + "\"code\" : \"" + search.get(i).get(2)+ "\","
                                + "\"category\" : \"" + search.get(i).get(3)+ "\","
                                + "\"container\" : \"" + search.get(i).get(4)+ "\","
                                + "\"volume\" : \"" + search.get(i).get(5)+ "\","
                                + "\"instruction\" : \"" + search.get(i).get(6)+"\"},"
                );
            }
        }
        out.print("]");
    }

%>
