<%-- 
    Document   : updateMenu
    Created on : Mar 22, 2018, 3:53:10 PM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="org.json.JSONObject"%>
<%
    String menu_cd = request.getParameter("menu_cd").trim();
    String menu_name = request.getParameter("menu_name").trim();
    String type = request.getParameter("type").trim();
    String status = request.getParameter("status").trim();
    
    Conn con = new Conn();
    
    String query;
    
    boolean isValid = true;
    String msg="";
    
    //update 
    query = "Update adm_menu set menu_name='"+menu_name+"', type='"+type+"', status='"+status+"' Where menu_cd='"+menu_cd+"';";
    RMIConnector rmi = new RMIConnector();
    
    if(rmi.setQuerySQL(con.HOST,con.PORT, query)){
        msg = "The menu is updated successfully";
    }
    else{
        isValid = false;
        query = "Select menu_cd from adm_menu where menu_cd = '"+menu_cd+"' limit 1;";
        
        if(con.getData(query).size()<1){
            msg="Failed to update. The menu code "+menu_cd+" does not exist. Try refresh the page.";
        }
        else{
            msg = "Oops! Something went wrong. Please try again later.";
        }
    }
    
    
    JSONObject json = new JSONObject();
    json.put("isValid", isValid);
    json.put("msg", msg);
    
    out.print(json.toString());
%>