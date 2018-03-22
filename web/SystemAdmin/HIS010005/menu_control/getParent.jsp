<%-- 
    Document   : getParent
    Created on : Mar 20, 2018, 2:59:21 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String parent_cd = request.getParameter("parent_cd").trim();
    String level = request.getParameter("level").trim();
    String page_cd = request.getParameter("page_cd").trim();
    String module_cd = request.getParameter("module_cd").trim();
    
    Conn con = new Conn();
    
    String query = "Select menu_cd, menu_name from adm_menu where menu_level= "+level+" and parent_cd ='"+parent_cd+"' and module_cd='"+module_cd+"' AND page_cd='"+page_cd+"';";
    
    
    ArrayList<ArrayList<String>> data = con.getData(query);

%>
<option value="-">New</option>
<%
    if(data.size()>0){
        for(int i=0; i<data.size(); i++){
            
            
%>
<option value="<%=data.get(i).get(0)%>"><%=data.get(i).get(1)%></option>
<%
        }//end for
            
    }//end if
%>
