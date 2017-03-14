<%-- 
    Document   : healthFacility_logoProcess
    Created on : Mar 14, 2017, 7:11:30 AM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String process = request.getParameter("process");
    String hfcCode = request.getParameter("hfcCode");
    String picture = request.getParameter("picture");
    
    Conn conn = new Conn();
    
   if(process.equalsIgnoreCase("get")){
    
        String query = "Select ifnull(convert(logo using utf8), '') from adm_health_facility where hfc_cd = '"+hfcCode+"'"; 
        
        ArrayList<ArrayList<String>> dataLogo = conn.getData(query);
        
        String gamba = dataLogo.get(0).get(0);
        
        out.print(gamba);
    
    }else if(process.equalsIgnoreCase("set")){
    
        RMIConnector rmic = new RMIConnector();
        String query = "update adm_health_facility set logo = '"+picture+"' where hfc_cd ='"+hfcCode+"'";
        boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, query);
        
        if(isUpdate){
        
            out.print("success");
        
        }else{
        
            out.print("fail");
        }
    
    
    }


%>
