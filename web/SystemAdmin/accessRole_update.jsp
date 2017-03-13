<%-- 
    Document   : accessRole_update
    Created on : Feb 28, 2017, 3:04:23 PM
    Author     : user
--%>

<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    
    String userID = request.getParameter("userID");
    String roleCode = request.getParameter("roleCode");
    String disciplineCode = request.getParameter("disciplineCode");
    String subdisciplineCode = request.getParameter("subdisciplineCode");
    String status = request.getParameter("status");
    
    String sql = "UPDATE adm_user_access_role SET role_code = '"+roleCode+"', discipline_code = '"+disciplineCode+"', subdiscipline_code = '"+subdisciplineCode+"', status = '"+status+"' "
            + "WHERE user_id = '"+userID+"'";
    
    boolean done = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
    
    if (done == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }



%>
