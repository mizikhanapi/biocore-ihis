<%-- 
    Document   : accessRole_delete
    Created on : Mar 14, 2017, 7:13:07 PM
    Author     : user
--%>

<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    String userID = request.getParameter("userID");
    
    Conn conn = new Conn();
    
    RMIConnector rmic = new RMIConnector();
    
    String query = "Delete from adm_user_access_role Where user_id = '"+userID+"'";
    
    boolean isDelete = rmic.setQuerySQL(conn.HOST, conn.PORT, query);
    
    if(isDelete){
        out.print("success");
    
    }else{
         out.print("fail");
    
    }


%>
