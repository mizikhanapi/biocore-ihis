<%-- 
    Document   : responsibility_insert
    Created on : Mar 2, 2017, 4:13:23 AM
    Author     : user
--%>


<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%           
    Conn conn = new Conn();
    String roleCode = request.getParameter("roleCode");
    String systemCode = request.getParameter("systemCode");
    String moduleCode = request.getParameter("moduleCode");
    String pageCode = request.getParameter("pageCode");
    String status = request.getParameter("status");
    String creator = (String)session.getAttribute("USER_ID");
    
    
    String sqlCheck = "SELECT page_code from adm_responsibility WHERE page_code = '"+pageCode+"' AND module_code = '"+moduleCode+"' AND system_code = '"+systemCode+"' AND role_code = '"+roleCode+"' LIMIT 1 ";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);
    
    if(duplicate.size() > 0)
    {
        out.print("Sorry, page "+pageCode+" is already assigned to this role. Please assign different page.");
    }
    else{
        RMIConnector rmic = new RMIConnector();

        String sqlInsert = "INSERT INTO adm_responsibility(role_code, system_code, module_code, page_code, health_facility_code, status, created_by, created_date) "+
                    "VALUES('"+roleCode+"', '"+systemCode+"', '"+moduleCode+"', '"+pageCode+"', '0', '"+status+"', '"+creator+"', now())";

        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

        if (isInsert == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }
    }

    

%>

