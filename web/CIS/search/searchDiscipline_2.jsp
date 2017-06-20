
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
//    String input = request.getParameter("keyword");
//    String hfc = request.getParameter("hfc");

    String input = "out";
    String hfc = "04010101";

         String searchDispline = "select a.discipline_name,a.discipline_cd,b.subdiscipline_cd,c.subdiscipline_name  "
                     + "from adm_discipline a"
                     + " inner join adm_hfc_discipline b on a.discipline_cd = b.discipline_cd  and a.discipline_hfc_cd = b.hfc_cd and b.hfc_cd = '" + hfc + "' "
                     + " left join adm_subdiscipline c  on b.subdiscipline_cd = c.subdiscipline_cd and b.discipline_cd = c.discipline_cd and b.hfc_cd = c.subdiscipline_hfc_cd "
                     + "where CONCAT(UPPER(a.discipline_name),LOWER(a.discipline_name)) like '%" + input + "%' ";
     ArrayList<ArrayList<String>> search = Conn.getData(searchDispline); 
     String data = "[";
      if (search.size() > 0) 
             {
                 out.print("[");
                 for(int i =0; i < search.size(); i++){

                    if(i == search.size() -1){
                        data += "{ \"name\" : \""+search.get(i).get(1)+"|"+search.get(i).get(0)+"|"+search.get(i).get(3)+ "\"}"  ;
                      out.print(
                             "{ \"name\" : \""+search.get(i).get(1)+"|"+search.get(i).get(0)+"|"+search.get(i).get(3)+ "\"}"  
                     );
                    }else{
                           data +=  "{ \"name\" : \""+search.get(i).get(1)+"|"+search.get(i).get(0)+"|"+search.get(i).get(3)+ "\"}," ;
                     out.print(
                             "{ \"name\" : \""+search.get(i).get(1)+"|"+search.get(i).get(0)+"|"+search.get(i).get(3)+ "\"},"  
                     );
                    }
                 }
                  data +="]";
                 out.print("]");
             }
                                                                        
%>
