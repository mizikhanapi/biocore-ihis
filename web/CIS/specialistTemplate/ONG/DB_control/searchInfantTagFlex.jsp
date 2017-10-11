<%-- 
    Document   : searchInfantTagFlex
    Created on : Oct 10, 2017, 4:52:02 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>

<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%
   Conn Conn = new Conn();
   
   String key = request.getParameter("keyword");
   String pmiNo = (String) session.getAttribute("patientPMINo");
   String hfc_cd = (String)session.getAttribute("HEALTH_FACILITY_CODE");
   //String key ="fever";
  
     String searchProblem = "SELECT infant_tag_no FROM lhr_ong_infant_birth_record WHERE pmi_no='"+pmiNo+"';";
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

