<%-- 
    Document   : bodySystem_delete
    Created on : Mar 29, 2017, 8:16:55 PM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();    
    String bs_code = request.getParameter("bs_code");
    
    Conn conn = new Conn();
    
    String query = "Select ris_procedure_cd from ris_procedure_master where body_system_cd = '"+bs_code+"' AND hfc_cd = '"+hfc_cd+"' LIMIT 1";
    
    ArrayList<ArrayList<String>> dataRefered = conn.getData(query);
    
    if(dataRefered.size()>0){
        out.print("Sorry, body system code "+bs_code+" is refered by radiology procedure");
    
    }else{
        RMIConnector rmic = new RMIConnector();
        String sqlDel = "Delete from ris_body_system where body_system_cd = '"+bs_code+"' AND hfc_cd = '"+hfc_cd+"'";
        
        boolean isDelete = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlDel);
        
        if(isDelete){
            out.print("success");
        }else{
            out.print("fail");
        }
    
    }
    
%>