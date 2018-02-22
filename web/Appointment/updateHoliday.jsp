<%-- 
    Document   : updateHoliday
    Created on : Apr 6, 2016, 11:00:26 PM
    Author     : user
--%>

<%@page import="ADM_helper.MySessionKey"%>
<%@page import="java.util.ArrayList"%>;
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn conn = new Conn();
        String state_code = request.getParameter("state");
        String holiday_date = request.getParameter("date");
        String holiday_desc = request.getParameter("desc");
        String holiday_type = request.getParameter("appTo");
        String status = request.getParameter("status");
        String stateBefore = request.getParameter("stateBefore");
        String dateBefore = request.getParameter("dateBefore");
        String username = (String)session.getAttribute("username");
        
        String hfc = (String) session.getAttribute(MySessionKey.HFC_CD);
        
        String sqlDisplayHoliday = "SELECT * FROM pms_holiday WHERE state_code = '"+stateBefore+"' AND holiday_date = '"+dateBefore+"' AND hfc_cd='"+hfc+"'";
        ArrayList<ArrayList<String>> data = conn.getData(sqlDisplayHoliday);
      
            if(data.size() == 0)
            {//Update holiday fail due to the holiday data does not exist
                out.print("fail");
            }
            else
            {
                RMIConnector rmic = new RMIConnector();
                String sqlInsert = "UPDATE pms_holiday "
                        + "SET state_code='" + state_code + "',holiday_date='" + holiday_date + "',holiday_desc='" + holiday_desc + "',holiday_type='" + holiday_type + "',status='" + status + "', created_by='" + username + "', created_date= now() "
                        + "WHERE state_code='" + stateBefore + "' AND holiday_date='" + dateBefore + "' AND hfc_cd='"+hfc+"';";

                boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

                if (isInsert) 
                {
                   out.print("success");
                } else 
                {
                    out.print("notSuccess");
                }
            }

        
%>
