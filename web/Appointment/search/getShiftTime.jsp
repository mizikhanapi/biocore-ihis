<%-- 
    Document   : getSelectDiscipline
    Created on : Oct 11, 2017, 6:10:37 PM
    Author     : -D-
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>

<%
    Conn Conn = new Conn();
         String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
             String discipline = (String) session.getAttribute("DISCIPLINE_CODE");
             String subdiscipline = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
             String shift_code = request.getParameter("shift_cd");
             
             String sql = "SELECT start_time,end_time FROM pms_shift WHERE shift_cd = '"+shift_code+"' AND hfc_cd = '"+hfc+"' AND discipline_cd = '"+discipline+"' AND subdiscipline_cd = '"+subdiscipline+"';";
             ArrayList<ArrayList<String>> data = Conn.getData(sql);
             
    
   
    
    if(data.size() > 0){
        out.print(data.get(0).get(0)+"|" + data.get(0).get(1));
    }else{
        out.print("3");
    }
    
%>