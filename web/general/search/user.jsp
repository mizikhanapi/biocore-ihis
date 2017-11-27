<%-- 
    Document   : searchUserFlex
    Created on : Oct 6, 2017, 10:46:23 AM
    Author     : Ardhi Surya; rdsurya147@gmail.com; @rdcfc

    Use this file to search for user using flexdataList
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
   Conn Conn = new Conn();
   
   String key = request.getParameter("keyword");
   String hfc_cd = (String)session.getAttribute("HEALTH_FACILITY_CODE");
   //String key ="fever";
  
     String searchProblem = "Select user_id, user_name "
               + "from adm_users "
               + "where health_facility_code='"+hfc_cd+"' and status='0' and (user_id like '%"+key+"%' OR user_name like '%"+key+"%') and user_id in "
               + "(select user_id from adm_user_access_role where health_facility_code='"+hfc_cd+"');";
        ArrayList<ArrayList<String>> search = Conn.getData(searchProblem); 
        
        
    if (search.size() > 0) {
            int k = search.size()-1;
            out.print("[");
            for (int i = 0; i < k; i++) {

                out.print(
                        "{ \"name\" : \"" + search.get(i).get(1) + "\", "
                        + "\"value\" : \"" + search.get(i).get(0) + "\"},"
                );

            }
             out.print(
                            "{ \"name\" : \"" + search.get(k).get(1)  + "\", "
                            + "\"value\" : \"" + search.get(k).get(0) + "\"}"
                    );
            out.print("]");
        }                                             
%>

