<%-- 
    Document   : modality_delete
    Created on : Apr 3, 2017, 6:08:44 PM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();    
    String mod_code = request.getParameter("mod_code");
    
    Conn conn = new Conn();
    
    String query = "Select ris_procedure_cd from ris_procedure_master where modality_cd = '"+mod_code+"' AND hfc_cd = '"+hfc_cd+"' LIMIT 1";
    
    ArrayList<ArrayList<String>> dataRefered = conn.getData(query);
    
    if(dataRefered.size()>0){
        out.print("Sorry, modality code "+mod_code+" is refered by radiology procedure");
    
    }else{
        RMIConnector rmic = new RMIConnector();
        String sqlDel = "Delete from ris_modality where modality_cd = '"+mod_code+"' AND hfc_cd = '"+hfc_cd+"'";
        
        boolean isDelete = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlDel);
        
        if(isDelete){
            out.print("success");
        }else{
            out.print("fail");
        }
    
    }
    
%>
