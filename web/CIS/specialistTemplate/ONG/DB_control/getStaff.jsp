<%-- 
    Document   : getStaff
    Created on : Oct 9, 2017, 3:02:18 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String user_id = (String) session.getAttribute("USER_ID");
    
    Conn con = new Conn();
    
    String query = "SELECT user_id, user_name from adm_users where user_id='"+user_id+"' limit 1;";
    
    ArrayList<ArrayList<String>> dataUser = con.getData(query);
    String name="";
    if(dataUser.size()>0){
        name=dataUser.get(0).get(1);
    }
    
    out.print(user_id+"|"+name);
    
%>
