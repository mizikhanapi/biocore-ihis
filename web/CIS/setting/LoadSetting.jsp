<%-- 
    Document   : LoadSetting
    Created on : Mar 12, 2017, 4:26:16 PM
    Author     : -D-
--%>


<%-- 
    Document   : SaveSetting
    Created on : Mar 12, 2017, 2:24:43 PM
    Author     : -D-
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%

    String user_id = request.getParameter("userId");
    //String user_id = "DR007";
    String setting ="";
    
    Conn conn = new Conn();
        String sqlLoadSetting = "select param_code,enable from cis_clinic_param where user_id = '" + user_id + "'";
        ArrayList<ArrayList<String>> loadSetting = conn.getData(sqlLoadSetting);
        if (loadSetting.size() < 1) {
            out.print("|O|");
        } else {
            for (int i = 0; i < loadSetting.size(); i++) {
                setting += loadSetting.get(i).get(0) + "|" + loadSetting.get(i).get(1) + "^";
            }
            out.print(setting);

        }


            
%>