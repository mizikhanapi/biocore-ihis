<%-- 
    Document   : contentDelete
    Created on : 08-Jan-2019, 12:38:17
    Author     : Shay
--%>

<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    String idContent = request.getParameter("idContent");
    boolean isSuccess = false;
    
    String sql = "DELETE FROM qcs_calling_system_content WHERE id = '"+idContent+"'";
    isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, sql);
    
    if (isSuccess) {
        out.print("success");
    } else {
        out.print("fail");
        //out.print(sql);
    }
%>