<%@page import ="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%
    RMIConnector rmic = new RMIConnector();
   
    Conn conn = new Conn();
    
    String userID, userPassword,hfc, startDate, endDate, idCategory;
    
    startDate="2016-09-05";
    endDate="2020-11-27";
    idCategory="Fixed";
    
    userID = request.getParameter("userID");
    userPassword = request.getParameter("userPassword");
    hfc = session.getAttribute("HFC").toString();
        Boolean SQL=false;
            String sql1 = "insert into adm_users(USER_ID, PASSWORD,HEALTH_FACILITY_CODE,"
                    + "ID_CATEGORY_CODE,START_DATE,END_DATE)"
                    + "values('" + userID + "', '" + userPassword + "', '" + hfc 
                    + "', '" + idCategory + "', '" + startDate + "', '" + endDate + "')";

            SQL = rmic.setQuerySQL(conn.HOST, conn.PORT, sql1);
            out.print(SQL+"|"+sql1);

    
    
    
    
    out.print(userID+"-"+userPassword+"-"+hfc);
%>