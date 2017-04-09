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
    
    String searchProblem = "select ris_procedure_cd,modality_cd,body_system_cd,modality_name,body_system_name from ris_procedure_master where CONCAT(UPPER(ris_procedure_name),LOWER(ris_procedure_name)) like '%" + id + "%' ";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    if (search.size() > 0) {

        for (int i = 0; i < search.size(); i++) {
            output = String.join("|", search.get(i));
           
        }
         out.print(output + "|"+searchhfcData.get(0).get(0));
    }
%>                           

