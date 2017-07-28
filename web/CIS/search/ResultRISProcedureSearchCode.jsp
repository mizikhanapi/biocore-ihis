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
    String hfc_cd = session.getAttribute("PROVIDER_HFC_ROS").toString();
    
    id.toLowerCase();
   // String searchProblem = "select ris_procedure_cd,modality_cd,body_system_cd,modality_name,body_system_name from ris_procedure_master where CONCAT(UPPER(ris_procedure_name),LOWER(ris_procedure_name)) like '%" + id + "%'  AND hfc_cd = '"+hfc_cd+"' ";
    String sqlRISProcedureSearch = "SELECT master.ris_procedure_cd,master.modality_cd,master.body_system_cd,modality.modality_name,body.body_system_name FROM  ris_procedure_master master "
            + "INNER JOIN ris_body_system body ON master.body_system_cd = body.body_system_cd "
            + "INNER JOIN  ris_modality modality ON master.modality_cd = modality.modality_cd "
            + " WHERE CONCAT(UPPER(master.ris_procedure_name),LOWER(master.ris_procedure_name)) like '%"+id+"%' AND master.hfc_cd = '"+hfc_cd+"' "
            + "GROUP BY master.hfc_cd";
    ArrayList<ArrayList<String>> search = Conn.getData(sqlRISProcedureSearch);
    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {

            out.print(String.join("|", search.get(i)));
        }
    }
%>                           

