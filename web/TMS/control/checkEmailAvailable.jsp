<%-- 
    Document   : checkEmailAvailable
    Created on : Jun 27, 2018, 11:58:27 AM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="org.json.JSONObject"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    String sessionEmail = (String) session.getAttribute("REGISTRATION_EMAIL");
    String sessionUserID = (String) session.getAttribute("REGISTRATION_ID");
    
    String email = request.getParameter("email");
    Conn con = new Conn();
    
    String query = "";
    
    boolean isAvailable = true;
    boolean emailSame = email.equals(sessionEmail);
    query = "Select user_id from adm_users where user_id='"+email+"' limit 1;";
    
    if(con.getData(query).size()>0){
        isAvailable = false;
    }
    
    RMIConnector rmi = new RMIConnector();
    JSONObject json = new JSONObject();
    
    if(isAvailable && sessionEmail == null){
                
        query = "Insert into adm_users(user_id, email, password, HEALTH_FACILITY_CODE, START_DATE, END_DATE, USER_TYPE) "
            + "values('"+email+"', '"+email+"', 'abc123', '???', now(), '9999-12-31', 'TENANT' );";
        rmi.setQuerySQL(con.HOST, con.PORT, query);
       session.setAttribute("REGISTRATION_ID", email);
       session.setAttribute("REGISTRATION_EMAIL", email);
       
    }
    else if(sessionEmail != null && isAvailable && !emailSame){
        query = "Update adm_users set email='"+email+"', user_id='"+email+"' where user_id = '"+sessionEmail+"';";
        rmi.setQuerySQL(con.HOST, con.PORT, query);
        session.setAttribute("REGISTRATION_ID", email);
        session.setAttribute("REGISTRATION_EMAIL", email);
       
    }
    else if(sessionEmail != null && emailSame){
        isAvailable = true;
    }
    
    
    json.put("isAvailable", isAvailable);
    json.put("sql", query);
    
    out.print(json.toString());
%>
