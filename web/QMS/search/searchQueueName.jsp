<%-- 
    Document   : searchQueueName
    Created on : Aug 20, 2017, 9:24:48 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
       String key = request.getParameter("keyword");
       
       String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
       String dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
       //String key ="fever";
       String searchProblem = "Select queue_name "
               + "from pms_queue_list "
               + "where hfc_cd='"+hfc_cd+"' and status='Active' and (queue_name like '%"+key+"%') ; ";
        ArrayList<ArrayList<String>> search = Conn.getData(searchProblem); 
       
        
    if (search.size() > 0) {
            out.print("[");
            for (int i = 0; i < search.size(); i++) {

                if (i == search.size() - 1) {

                    out.print(
                            "{ \"name\" : \""+ search.get(i).get(0)+"\", "
                            + "\"value\" : \"" + search.get(i).get(0) + "\"}"
                    );
                } else {

                    out.print(
                            "{ \"name\" : \""+ search.get(i).get(0)+"\", "
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

