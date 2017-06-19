
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
                               //String key = request.getParameter("input");
                               //String key ="fever";
                                String searchProblem = "select icd10_desc from icd10_codes";
                                ArrayList<ArrayList<String>> search = Conn.getData(searchProblem); 
                                String data = "[";
                                 if (search.size() > 0) 
                                        {
                                            out.print("[");
                                            for(int i =0; i < search.size(); i++){
                                                
                                               if(i == search.size() -1){
                                                   data += "\""+search.get(i).get(0)+ "\""  ;
                                                 out.print(
                                                        " \""+search.get(i).get(0)+ "\""  
                                                );
                                               }else{
                                                      data +=  " \""+search.get(i).get(0)+ "\"}," ;
                                                out.print(
                                                        " \""+search.get(i).get(0)+ "\","  
                                                );
                                               }
                                            }
                                             data +="]";
                                            out.print("]");
                                        }
                                                                        
%>

<script type="text/javascript">
//    localStorage.setItem("dgsData",<%=data%>);
//    console.log(localStorage.getItem("dgsData"));
    
    </script>

