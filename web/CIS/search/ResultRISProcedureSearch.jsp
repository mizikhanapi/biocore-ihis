

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
                               String key = request.getParameter("keyword");
                               //String key = "mo";
                               //String hfc_cd = request.getParameter("hfc_cd");
                               String hfc_cd = session.getAttribute("PROVIDER_HFC_ROS").toString();
                               //String hfc_cd = "04010101";
                               //String key ="fever";
                               //String searchProblem = "select ris_procedure_name from ris_procedure_master where CONCAT(UPPER(ris_procedure_name),LOWER(ris_procedure_name)) like '%" +  key + "%' AND hfc_cd = '"+hfc_cd+"' ";
                               String searchProblem = "select pm.ris_procedure_name,m.modality_name,bs.body_system_name from ris_procedure_master pm JOIN ris_body_system bs JOIN ris_modality m where pm.body_system_cd = bs.body_system_cd AND pm.modality_cd = m.modality_cd AND pm.hfc_cd = m.hfc_cd AND m.hfc_cd =  bs.hfc_cd AND bs.hfc_cd=  '"+hfc_cd+"' AND (bs.body_system_name LIKE '%"+key+"%' OR pm.ris_procedure_name LIKE '%"+key+"%' OR m.modality_name LIKE '%"+key+"%'); ";
                                ArrayList<ArrayList<String>> search = Conn.getData(searchProblem); 
                               // out.print(searchProblem);
                                String data = "[";
                                    if (search.size() > 0) {
                                        out.print("[");
                                        for (int i = 0; i < search.size(); i++) {

                                            if (i == search.size() - 1) {

                                                out.print(
                                                        "{ \"name\" : \"" + search.get(i).get(2) +" - " +search.get(i).get(1)+" - "+ search.get(i).get(0)+"\", "

                                                                + "\"value\" : \"" + search.get(i).get(0)+"\"}"
                                                );
                                            } else {

                                                out.print(
                                                        "{ \"name\" : \"" + search.get(i).get(2) +" - " +search.get(i).get(1)+" - "+ search.get(i).get(0)+ "\", "

                                                                + "\"value\" : \"" + search.get(i).get(0)+"\"},"
                                                );
                                            }
                                        }
                                        out.print("]");
                                    }

                                 else{
                                     out.print(hfc_cd);
                                 }
                                                                        
%>
