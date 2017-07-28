<%-- 
    Document   : responsibility_edit
    Created on : Mar 18, 2017, 1:04:24 PM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    String creator = session.getAttribute("USER_ID").toString();
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    
    String strSystem = request.getParameter("system");
    String strModule = request.getParameter("module");
    String strPage = request.getParameter("page");
    String roleCode = request.getParameter("roleCode");
    String status = request.getParameter("status");
    
    Conn conn = new Conn();
    
    RMIConnector rmic = new RMIConnector();
    
    String[] system = strSystem.split("\\|");
    String[] modules = strModule.split("\\|");
    String[] pages = strPage.split("\\|");
    
    String sqlDelete = "DELETE from adm_responsibility where role_code = '"+roleCode+"' and health_facility_code='"+hfc_cd+"';";
    rmic.setQuerySQL(conn.HOST, conn.PORT, sqlDelete);
    
     String sqlInsert = "";
     
     if(pages.length == 1 && pages[0].equalsIgnoreCase("")){
          out.print("Done");
          return;
     
     }
    
    for(int i = 0; i < pages.length; i++){
    
        sqlInsert = "INSERT INTO adm_responsibility(role_code, system_code, module_code, page_code, health_facility_code, status, created_by, created_date) "+
                    "VALUES('"+roleCode+"', '"+system[i]+"', '"+modules[i]+"', '"+pages[i]+"', '"+hfc_cd+"', '"+status+"', '"+creator+"', now())";
        
        rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);
    
    }
    
    out.print("Done");


%>
