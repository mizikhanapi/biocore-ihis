<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
    String hfc = request.getParameter("hfc_name");
    //session.setAttribute("sessionHFC", hfc);
    //session.setAttribute("HEALTH_FACILITY_CODE", hfc_cd);
    
    String sql_hfc_cd = "SELECT hfc_cd FROM adm_health_facility WHERE hfc_name = '"+hfc+"'";
    ArrayList<ArrayList<String>> data = Conn.getData(sql_hfc_cd);
    session.setAttribute("HFC_NAME", hfc);
    session.setAttribute("HEALTH_FACILITY_CODE", data.get(0).get(0));
   
    
    response.sendRedirect("index.jsp");

%>