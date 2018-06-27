<%-- 
    Document   : addUserID
    Created on : Jun 27, 2018, 2:58:30 PM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="org.json.JSONObject"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conn con = new Conn();
    String userID= request.getParameter("userID");
    String pwd= request.getParameter("pwd");
    String question= request.getParameter("question");
    String answer= request.getParameter("answer");
    String email= request.getParameter("email");
    
    JSONObject json = new JSONObject();
    
    boolean isIDAvailable = true;
    
    String query = "Select user_id from adm_users where user_id='"+userID+"' limit 1";
    if(con.getData(query).size()>0){
        isIDAvailable = false;
        json.put("isIDAvailable", isIDAvailable);
        out.print(json.toString());
        return;
    }
    
    String msg = "";
    
    query = "Insert into adm_users(user_id, email, password, question, answer, HEALTH_FACILITY_CODE, START_DATE, END_DATE, USER_GROUP, USER_TYPE) "
            + "values('"+userID+"', '"+email+"', '"+pwd+"', '"+question+"', '"+answer+"', '???', now(), '9999-12-31', 'HIS-CARE', 'TENANT' );";
    
    RMIConnector rmi = new RMIConnector();
    
    boolean isValid = rmi.setQuerySQL(con.HOST, con.PORT, query);
    if(isValid){
       session.setAttribute("REGISTRATION_ID", userID);
       session.setAttribute("REGISTRATION_EMAIL", email);
       
    }
    else{
        msg = "Failed to create user ID! Try again later...";
    }
    
    json.put("isIDAvailable", isIDAvailable);
    json.put("isValid", isValid);
    json.put("msg", msg);
    json.put("sql", query);
    
    out.print(json.toString());
%>
