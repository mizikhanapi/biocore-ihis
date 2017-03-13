<%-- 
    Document   : reset_password_process
    Created on : Mar 6, 2017, 4:34:06 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    
    String userID = request.getParameter("userID");
    String IC = request.getParameter("IC");
    String mother = request.getParameter("mother");
    
               
    String sql = "Select user_id from adm_users where user_id = '"+userID+"' AND new_icno = '"+IC+"' AND mother_name = '"+mother+"' LIMIT 1";
    
    ArrayList<ArrayList<String>> dataUser = conn.getData(sql);
    
    if(dataUser.size() > 0){
    
        String sqlUpdate = "Update adm_users set password = 'abc123' where user_id = '"+userID+"'";
        boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlUpdate);
        
        if(isUpdate){
            out.print("success");
        
        }else{
            out.print("fail");
        
        }
        
    
    }else{
    
        out.print("Information that you have provided is wrong");
    }
    
    
    




%>
