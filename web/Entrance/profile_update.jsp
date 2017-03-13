<%-- 
    Document   : profile_update
    Created on : Mar 14, 2017, 1:30:23 AM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    String userID = session.getAttribute("USER_ID").toString();
    String email = request.getParameter("email");
    String mobile = request.getParameter("mobile");
    String fax = request.getParameter("fax");
    String home = request.getParameter("home");
    String office = request.getParameter("office");
    
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    
    String query = "Update adm_users set email = '"+email+"', mobile_phone = '"+mobile+"', home_phone = '"+home+"', office_phone = '"+office+"', fax_no = '"+fax+"' "
            + "Where user_id = '"+userID+"' ";
    
    boolean isUpdate = rmic.setQuerySQL(conn.HOST, conn.PORT, query);
    
    if(isUpdate){
        out.print("success");
    }else{
        out.print("fail");
    }



%>