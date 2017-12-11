

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String key = request.getParameter("keyword");
    //String key ="fever";
        String searchProblem = "SELECT ri_desc FROM readcode_immunization where CONCAT(UPPER(ri_desc),LOWER(ri_desc)) like '%" +  key + "%' order by CHAR_LENGTH(ri_desc), ri_desc  ASC;";
     ArrayList<ArrayList<String>> search = Conn.getData(searchProblem); 
     String data = "[";
      if (search.size() > 0) 
             {
                 out.print("[");
                 for(int i =0; i < search.size(); i++){

                    if(i == search.size() -1){
                        data += "{ \"name\" : \""+search.get(i).get(0)+ "\"}"  ;
                      out.print(
                             "{ \"name\" : \""+search.get(i).get(0)+ "\"}"  
                     );
                    }else{
                           data +=  "{ \"name\" : \""+search.get(i).get(0)+ "\"}," ;
                     out.print(
                             "{ \"name\" : \""+search.get(i).get(0)+ "\"},"  
                     );
                    }
                 }
                  data +="]";
                 out.print("]");
             }

%>
