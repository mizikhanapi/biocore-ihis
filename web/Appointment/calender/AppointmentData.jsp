<%-- 
    Document   : AppointmentData
    Created on : Aug 16, 2017, 6:07:54 PM
    Author     : -D-
--%>
<%@page import="org.joda.time.*"%>
<%@page import="org.joda.time.format.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="org.json.simple.*"%>

<%
    Conn Conn = new Conn();
    
    String hfc_cd = request.getParameter("h");
    String discipline_cd = request.getParameter("d");
    String subdiscipline_cd = request.getParameter("s");
    String duration = request.getParameter("p");

    //String key ="fever";                     //0             1                 2           3         4             5       
    String searchProblem = "SELECT bio.`PATIENT_NAME`, app.appointment_date , app.`PMI_NO`, app.start_time,app.status, app.end_time FROM pms_appointment app INNER JOIN pms_patient_biodata bio ON app.pmi_no = bio.`PMI_NO`  WHERE app.hfc_cd = '"+hfc_cd+"' AND app.discipline = '"+discipline_cd+"' AND app.subdiscipline = '"+subdiscipline_cd+"';";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
   // out.print(search);
          SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm'Z'");
          
                          String text = "2017-08-23 09:30:00.0";
                          DateTimeFormatter format = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss.S");
                          
                          

         
    if (search.size() > 0) {
                                            JSONArray jsonArray = new JSONArray();

                                                for (int i = 0; i < search.size(); i++) {
                                                    JSONObject json = new JSONObject();
                                                    LocalDateTime localDateTime = LocalDateTime.parse(search.get(i).get(1), format);
                                                        LocalDateTime endDateTime = LocalDateTime.parse(search.get(i).get(1), format).plusMinutes(Integer.parseInt(duration));
                                                        String str = localDateTime.toString().substring(0, localDateTime.toString().length() - 4);
                                                        String end = endDateTime.toString().substring(0, endDateTime.toString().length() - 4);
                                                       LocalDateTime today = LocalDateTime.now();
                                                       if(localDateTime.isBefore(today)){
                                                           json.put("title", search.get(i).get(0));
                                                           json.put("start", str);
                                                           json.put("end", end);
                                                           json.put("color","red");
                                                           json.put("id", search.get(i).get(1) + "[-|-]" + search.get(i).get(2));
                                                       }else{
                                                           if(search.get(i).get(4).equals("inactive")){
                                                               json.put("title", search.get(i).get(0));
                                                                   json.put("start", str);
                                                                   json.put("end", end);
                                                                   json.put("color", "#cc9900");
                                                                   json.put("id", search.get(i).get(1) + "[-|-]" + search.get(i).get(2));
                                                           }else{
                                                               json.put("title", search.get(i).get(0));
                                                               json.put("start", str);
                                                               json.put("end", end);
                                                               
                                                               json.put("id", search.get(i).get(1) + "[-|-]" + search.get(i).get(2));
                                                           }
                                                            
                                                       }

                                                    jsonArray.add(json);
                                                    out.flush();
                                                }
                                                out.print(jsonArray);
                                                              
//        out.print("[");
//        for (int i = 0; i < search.size(); i++) {
//            
//            
//            String end_date = null;
//                                     LocalDateTime localDateTime = LocalDateTime.parse(search.get(i).get(1), format);
//                                     LocalDateTime endDateTime = LocalDateTime.parse(search.get(i).get(1), format).plusMinutes(Integer.parseInt(duration));
//                             String str = localDateTime.toString().substring(0, localDateTime.toString().length() - 4);
//                             String end = endDateTime.toString().substring(0, endDateTime.toString().length() - 4);
//            if (i == search.size() - 1) {
//
//                out.print(
//                        "{ \"title\" : \"" + search.get(i).get(0) +   "\", "
//                        + "\"start\" : \"" + str +"\","
//                        + "\"end\" : \"" + end  +"\","
//                        + "\"id\" : \"" + search.get(i).get(1) +"[-|-]"+search.get(i).get(2)+ "\"}"
//                );
//            } else {
//                
//
//                out.print(
//                        "{ \"title\" : \"" + search.get(i).get(0) + "\", "
//                        + "\"start\" : \"" + str+"\","
//                        + "\"end\" : \"" + end  +"\","
//                        + "\"id\" : \"" + search.get(i).get(1) +"[-|-]"+search.get(i).get(2)+ "\"},"
//                );
//            }
//        }
//        out.print("]");
    }

%>
