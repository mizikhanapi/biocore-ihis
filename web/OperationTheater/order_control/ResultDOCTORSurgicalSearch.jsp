

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
       String key = request.getParameter("keyword");
       
       String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
       //String key ="fever";
       String searchProblem = "Select user_id, user_name "
               + "from adm_users "
               + "where health_facility_code='"+hfc_cd+"' and status='0' and (user_id like '%"+key+"%' OR user_name like '%"+key+"%') and user_id in "
               + "(select user_id from adm_user_access_role where health_facility_code='"+hfc_cd+"');";
        ArrayList<ArrayList<String>> search = Conn.getData(searchProblem); 
       
        
    if (search.size() > 0) {
            out.print("[");
            for (int i = 0; i < search.size(); i++) {

                if (i == search.size() - 1) {

                    out.print(
                            "{ \"name\" : \"( "+ search.get(i).get(0)+" ) " + search.get(i).get(1)  + "\", "
                            + "\"value\" : \"" + search.get(i).get(0) + "\"}"
                    );
                } else {

                    out.print(
                            "{ \"name\" : \"( "+ search.get(i).get(0)+" ) " + search.get(i).get(1) + "\", "
                            + "\"value\" : \"" + search.get(i).get(0) + "\"},"
                    );
                }
            }
            out.print("]");
        }
//    else{
//        out.print("[{\"name\":\"Ardhi\", \"value\":\"Oit!\"}]");
//    }
    
                                                                        
%>
