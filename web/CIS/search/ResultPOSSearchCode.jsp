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
    String name = request.getParameter("keyword");
    String procedureLevel = request.getParameter("level");
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    
    String procedureTable = "cis_procedure";
    String procedureCode = "PROCEDURE_CD";
    String procedureName = "PROCEDURE_NAME";
    
    if (procedureLevel.equals("1")){
        
        procedureTable = "cis_procedure_1";
        procedureCode = "PROCEDURE_1_CD";
        procedureName = "PROCEDURE_1_NAME";
        
    } else if(procedureLevel.equals("2")){
        
        procedureTable = "cis_procedure_2";
        procedureCode = "PROCEDURE_2_CD";
        procedureName = "PROCEDURE_2_NAME";
        
    }
    
    name.toLowerCase();
    String searchProblem = "select "+procedureCode+" from "+procedureTable+" where CONCAT(UPPER("+procedureName+"),LOWER("+procedureName+")) like '%" + name + "%' AND hfc_cd = '"+ hfc_cd + "'; ";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    if (search.size() > 0) {
        
        out.print(search.get(0).get(0));
//        for (int i = 0; i < search.size(); i++) {
//
//            out.print(String.join("|", search.get(i)));
//        }
    }
%>                           

