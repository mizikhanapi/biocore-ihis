<%-- 
    Document   : addMenu
    Created on : Mar 21, 2018, 5:26:39 AM
    Author     : user
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="main.RMIConnector"%>
<%@page import="ADM_helper.MySessionKey"%>
<%@page import="dBConn.Conn"%>
<%
    String menu_cd = request.getParameter("menu_cd").trim();
    String menu_name = request.getParameter("menu_name").trim();
    String type = request.getParameter("type").trim();
    String status = request.getParameter("status").trim();
    String level =  request.getParameter("level").trim();
    String parent_cd = request.getParameter("parent_cd").trim();
    String page_cd = request.getParameter("page_cd").trim();
    String module_cd = request.getParameter("module_cd").trim();
    String system_cd = "HIS";
    
    String created_by = (String) session.getAttribute(MySessionKey.USER_ID);
    
    Conn con = new Conn();
    
    String msg="";
    boolean isValid = true;
    
    String query = "Select menu_cd from adm_menu where menu_cd='"+menu_cd+"' limit 1;";
    
    if(con.getData(query).size()>0){
        isValid = false;
        msg="The menu code "+menu_cd+" is already been used. Please enter different code.";
    }
    else{
        query = "Insert into adm_menu(system_cd, module_cd, page_cd, menu_cd, menu_name, menu_level, parent_cd, `type`, status, created_date, created_by) "
                + "VALUES('"+system_cd+"', '"+module_cd+"', '"+page_cd+"', '"+menu_cd+"', '"+menu_name+"', "+level+", '"+parent_cd+"', '"+type+"', '"+status+"', now(), '"+created_by+"' );";
        RMIConnector rmi = new RMIConnector();
        
        if(rmi.setQuerySQL(con.HOST, con.PORT, query)){
            msg = "New menu is registered successfully.";
        }
        else{
            isValid = false;
            msg = "Oops! Something went wrong. Try again later.";
        }
    }
    
    JSONObject json = new JSONObject();
    json.put("isValid", isValid);
    json.put("msg", msg);
    json.put("query", query);
    
    out.print(json.toString());
    
%>
