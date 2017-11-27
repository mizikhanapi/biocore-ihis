<%-- 
    Document   : deleteHoliday

--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();

    String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String discipline = (String) session.getAttribute("DISCIPLINE_CODE");
    String subdiscipline = (String) session.getAttribute("SUB_DISCIPLINE_CODE");


        RMIConnector rmic = new RMIConnector();
        String sqlDelete = "DELETE FROM pms_appointment_time "
                + "WHERE hfc_cd = '"+hfc+"' "
                + "AND discipline_cd = '"+discipline+"' "
                + "AND subdiscipline_cd = '"+subdiscipline+"' ;";
         

        boolean isDelete = rmic.setQuerySQL(Conn.HOST, Conn.PORT, sqlDelete);
        

        if(isDelete)
        {
            out.print("success");
        } else{
            out.print("error");
        }
   
%>       