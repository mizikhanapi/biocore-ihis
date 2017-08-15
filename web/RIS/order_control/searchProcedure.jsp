<%-- 
    Document   : searchProcedure
    Created on : Apr 25, 2017, 4:25:50 AM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    
    String bsCode = request.getParameter("BScode");
    String modCode = request.getParameter("MODcode");
    String key =  request.getParameter("key");
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    
    /*
    old query 15/8/2017
    "Select ris_procedure_cd, ris_procedure_name from ris_procedure_master "
            + "where hfc_cd = '"+hfc_cd+"' AND body_system_cd = '"+bsCode+"' AND modality_cd = '"+modCode+"' AND concat(ris_procedure_cd, ' | ', ris_procedure_name) LIKE '%"+key+"%'";
    */
    
    String query = "Select ris_procedure_cd, ris_procedure_name, body_system_cd, modality_cd from ris_procedure_master "
            + "where hfc_cd = '"+hfc_cd+"' AND concat(ris_procedure_cd, ' | ', ris_procedure_name) LIKE '%"+key+"%'";
    
     ArrayList<ArrayList<String>> dataPro = conn.getData(query);
     
     if(dataPro.size() < 1){
         out.print("Procedure not found.");
         
     }else{

%>
<ul id="RNO_pro_matchlist" style="width: 150px; max-height: 150px; height: 100%; overflow: auto">
<%
         for(int i = 0; i < dataPro.size(); i++){
             
%>
<li data-bscode="<%=dataPro.get(i).get(2)%>" data-modcode="<%=dataPro.get(i).get(3)%>" ><a style="cursor:pointer"><%= dataPro.get(i).get(0)%> | <%=dataPro.get(i).get(1)%></a></li>
<%
         
         }//end for loop
%>
</ul>
<%
     
     }
%>
