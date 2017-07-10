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
    String code = request.getParameter("keyword");
    String procedureLevel = request.getParameter("level");
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    
    String whereCode = "procedure_cd";
    String checkNameLevel = "PROCEDURE_1_NAME";
    String checkTableLevel = "cis_procedure_1";
    
     if(procedureLevel.equals("2")){
        
        whereCode = "procedure_1_cd";
        checkNameLevel = "PROCEDURE_2_NAME";
        checkTableLevel = "cis_procedure_2";
        
    }
   
    String searchProblem = "select "+checkNameLevel+" from "+checkTableLevel+" where "+whereCode+" = '"+code+"' AND hfc_cd = '"+ hfc_cd + "'; ";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
    if (search.size() > 0) {
        out.print("true");
    }else{
        out.print("false");
       
    }
%>                           

