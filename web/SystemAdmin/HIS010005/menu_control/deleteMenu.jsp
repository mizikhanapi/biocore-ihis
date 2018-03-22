<%-- 
    Document   : deleteMenu
    Created on : Mar 21, 2018, 3:58:29 PM
    Author     : user
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    String menu_cd = request.getParameter("menu_cd").trim();
    
    Conn con = new Conn();
    
    String query;
    boolean isValid = true;
    String msg;
    
    //check if the menu has child. If yes, abort deletion
    query="Select menu_cd from adm_menu where parent_cd='"+menu_cd+"' limit 1";
    if(con.getData(query).size()>0){
        isValid = false;
        msg="You cannot delete this menu because it has child menu.";
    }
    else{
        query = "Delete from adm_menu where menu_cd = '"+menu_cd+"'";
        RMIConnector rmi = new RMIConnector();
        
        if(rmi.setQuerySQL(con.HOST, con.PORT, query)){
            msg = "The menu is deleted.";
        }
        else{
            isValid = false;
            msg = "Failed to delete the menu.";
        }
    }
    
    JSONObject json = new JSONObject();
    json.put("isValid", isValid);
    json.put("msg", msg);
    
    out.print(json.toString());
    
%>