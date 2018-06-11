

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String key = request.getParameter("keyword");
    String hfc = session.getAttribute("PROVIDER_HFC_LOS").toString();
    //String key ="Alb";
    //                                  0          1          2        3           4            5         6         7
    String searchProblem = "select item_name, spe_source, item_cd, test_cat, spe_container, volume, special_inst, item_cd "
            + " from lis_item_detail where hfc_cd = '" + hfc + "' AND (item_name LIKE '%" + key + "%' OR item_cd LIKE '%" + key + "%'); ";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);

    if (search.size() > 0) {
        out.print("[");
        for (int i = 0; i < search.size(); i++) {

            if (i == search.size() - 1) {

                out.print(
                        "{ \"name\" : \"" + search.get(i).get(7) + " - " + search.get(i).get(0) + "\", "
                        + "\"source\" : \"" + search.get(i).get(1) + "\","
                        + "\"value\" : \"" + search.get(i).get(0) + "\","
                        + "\"code\" : \"" + search.get(i).get(7) + "\","
                        + "\"container\" : \"" + search.get(i).get(4) + "\","
                        + "\"volume\" : \"" + search.get(i).get(5) + "\","
                        + "\"instruction\" : \"" + search.get(i).get(6) + "\"}"
                );
            } else {

                out.print(
                        "{ \"name\" : \"" + search.get(i).get(7) + " - " + search.get(i).get(0) + "\", "
                        + "\"source\" : \"" + search.get(i).get(1) + "\","
                        + "\"value\" : \"" + search.get(i).get(0) + "\","
                        + "\"code\" : \"" + search.get(i).get(7) + "\","
                        + "\"container\" : \"" + search.get(i).get(4) + "\","
                        + "\"volume\" : \"" + search.get(i).get(5) + "\","
                        + "\"instruction\" : \"" + search.get(i).get(6) + "\"},"
                );
            }
        }
        out.print("]");
    }

%>
