

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
                               String key = request.getParameter("keyword");
                               String hfc_cd = request.getParameter("hfc_code");
                               //String key ="fever";
                               String searchProblem = "SELECT au.`USER_NAME`,ald.`Description`,d.discipline_name,sub.subdiscipline_name FROM adm_user_access_role ar  "
                                       + "INNER JOIN adm_users au ON au.`USER_ID` = ar.`USER_ID` "
                                       + "INNER JOIN adm_discipline d ON ar.`DISCIPLINE_CODE` = d.discipline_cd "
                                       + "INNER JOIN adm_subdiscipline sub ON ar.`SUBDISCIPLINE_CODE` = sub.subdiscipline_cd "
                                       + "INNER JOIN adm_lookup_detail ald ON  ar.`ROLE_CODE` =  ald.`Detail_Reference_code` AND au.`HEALTH_FACILITY_CODE` = '"+hfc_cd+"'  AND ald.`Master_Reference_code` = '0042'  AND (ald.`Description` = 'DOCTOR' OR ald.`Description` = 'CONSULTANT') GROUP BY au.`USER_ID`";
                                ArrayList<ArrayList<String>> search = Conn.getData(searchProblem); 
                                String data = "[";
    if (search.size() > 0) {
            out.print("[");
            for (int i = 0; i < search.size(); i++) {

                if (i == search.size() - 1) {

                    out.print(
                            "{ \"name\" : \"" + search.get(i).get(0)  + "\", "
                            + "\"role\" : \"" + search.get(i).get(1) + "\","
                            + "\"discipline\" : \"" + search.get(i).get(2) + "\","
                            + "\"subdiscipline\" : \"" + search.get(i).get(3) + "\"}"
                    );
                } else {

                    out.print(
                            "{ \"name\" : \"" + search.get(i).get(0) + "\", "
                            + "\"role\" : \"" + search.get(i).get(1) + "\","
                            + "\"discipline\" : \"" + search.get(i).get(2) + "\","
                            + "\"subdiscipline\" : \"" + search.get(i).get(3) + "\"},"
                    );
                }
            }
            out.print("]");
        }
                                                                        
%>
