<%-- 
    Document   : assignDiscipline_delete
    Created on : Feb 15, 2017, 11:34:58 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    Conn conn = new Conn();
    
    String hfcCode = request.getParameter("hfcCode");
    String disciplineCode = request.getParameter("disciplineCode");
    String subdisciplineCode = request.getParameter("subdisciplineCode");
    
    String sqlCheck="Select user_id from adm_user_access_role "
            + "WHERE health_facility_code='"+hfcCode+"' AND discipline_code='"+disciplineCode+"' AND subdiscipline_code='"+subdisciplineCode+"' limit 1;";
    ArrayList<ArrayList<String>> dataUser = conn.getData(sqlCheck);
    
    if(dataUser.size()>0){
        out.print("You cannot delete this discipline/subdiscipline assignment because there are users in it.");
    }
    else{
        RMIConnector rmic = new RMIConnector();
        String sql = "DELETE FROM adm_hfc_discipline WHERE hfc_cd = '" + hfcCode + "' AND discipline_cd = '"+disciplineCode+"' AND subdiscipline_cd = '"+subdisciplineCode+"' ";

        boolean status = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);

        if (status == true) {
            out.print("Success");
        } else {
            out.print("Failed");
        }
    
    }

    
%>