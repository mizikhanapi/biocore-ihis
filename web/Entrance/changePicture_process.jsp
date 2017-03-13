<%-- 
    Document   : changePicture_process
    Created on : Mar 10, 2017, 12:37:34 AM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    String gambar = request.getParameter("pic");
    String userID = session.getAttribute("USER_ID").toString();
    
    String query = "UPDATE adm_users set picture = '"+gambar+"' where user_id = '"+userID+"'";
    boolean jaya = rmic.setQuerySQL(conn.HOST, conn.PORT, query);
    
    if(jaya){
        
        session.setAttribute("PICTURE", gambar);
        out.print("success");
    
    }else{
    
         out.print("fail");
    }
%>
