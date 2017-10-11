<%-- 
    Document   : searchPatientICFlex
    Created on : Oct 10, 2017, 4:44:54 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%
   Conn Conn = new Conn();
   
   String key = request.getParameter("keyword");
   String hfc_cd = (String)session.getAttribute("HEALTH_FACILITY_CODE");
   //String key ="fever";
  
     String searchProblem = "SELECT `NEW_IC_NO` FROM pms_patient_biodata WHERE `NEW_IC_NO` like '%"+key+"%';";
        ArrayList<ArrayList<String>> search = Conn.getData(searchProblem); 
        
        
    if (search.size() > 0) {
            int k = search.size()-1;
            out.print("[");
            for (int i = 0; i < k; i++) {

                out.print(
                        "{ \"name\" : \"" + search.get(i).get(0) + "\", "
                        + "\"value\" : \"" + search.get(i).get(0) + "\"},"
                );

            }
             out.print(
                            "{ \"name\" : \"" + search.get(k).get(0)  + "\", "
                            + "\"value\" : \"" + search.get(k).get(0) + "\"}"
                    );
            out.print("]");
        }                                             
%>

