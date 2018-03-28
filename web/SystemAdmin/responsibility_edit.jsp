<%-- 
    Document   : responsibility_edit
    Created on : Mar 18, 2017, 1:04:24 PM
    Author     : user
--%>

<%@page import="ADM_helper.ResponsibilityHelper"%>
<%@page import="org.json.JSONObject"%>
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
    
    JSONObject json;

    String sqlInsert = "";

    if (pages.length == 1 && pages[0].equalsIgnoreCase("")) {
        boolean isValid = true;
        String sqlDelete = "DELETE from adm_responsibility where role_code = '" + roleCode + "' and health_facility_code='" + hfc_cd + "';";
        isValid = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlDelete);
        if(isValid){
            sqlDelete = "DELETE from adm_responsibility_detail where role_cd = '" + roleCode + "' and hfc_cd='" + hfc_cd + "';";
            isValid = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlDelete);
        }
        
        json = new JSONObject();
        json.put("isValid", isValid);
        json.put("query", sqlDelete);
        json.put("msg", "Failed while deleting all pages from adm_responsibility");
       
        out.print(json.toString());
        return;

    }
    
    ResponsibilityHelper resH = new ResponsibilityHelper(system, modules, pages, roleCode, hfc_cd, status, creator);
    try{
        json = resH.setAdmPage();
    }catch(Exception e){
        json = new JSONObject();
        json.put("isValid", false);
        json.put("msg", e.toString());
        json.put("query", "-");
    }
    
    
    out.print(json.toString());


%>
