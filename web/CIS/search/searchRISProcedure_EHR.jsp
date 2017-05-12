<%-- 
    Document   : getProcedureCode
    Created on : 02-Feb-2017, 15:00:50
    Author     : ahmed
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
     Conn Conn = new Conn();
    //String key = request.getParameter("input");
    String id = request.getParameter("id");
    String hfc_cd = request.getParameter("hfc_cd");
    String output="";
    
    id.toLowerCase();
        String searchhfc = "SELECT concat(address1,address2,address3) from adm_health_facility where hfc_cd = '"+hfc_cd+"' ";
    ArrayList<ArrayList<String>> searchhfcData = Conn.getData(searchhfc);
    
    String searchProblem ="SELECT master.ris_procedure_cd,master.modality_cd,master.body_system_cd,modality.modality_name,body.body_system_name FROM  ris_procedure_master master "
            + "INNER JOIN ris_body_system body ON master.body_system_cd = body.body_system_cd "
            + "INNER JOIN  ris_modality modality ON master.modality_cd = modality.modality_cd "
            + " WHERE CONCAT(UPPER(master.ris_procedure_name),LOWER(master.ris_procedure_name)) like '%"+id+"%' AND master.hfc_cd = '"+hfc_cd+"' "
            + "GROUP BY master.hfc_cd";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {
            output = String.join("|", search.get(i));
           
        }
         out.print(output + "|"+searchhfcData.get(0).get(0));
    }
%>                           

