<%-- 
    Document   : SearchCCN_cd
    Created on : 03-Feb-2017, 15:12:03
    Author     : ahmed
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    Conn Conn = new Conn();
   
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String discipline = session.getAttribute("DISCIPLINE_CODE").toString();
    String subdicipline = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
    String room_name = request.getParameter("room_name");
  

    String searchProblem = "select room_no,room_name from opt_room WHERE hfc_cd = '"+hfc_cd+"' AND discipline_cd = '"+discipline+"' AND `subdiscipline_cd` = '"+subdicipline+"' and room_name='"+room_name+"';;";
    ArrayList<ArrayList<String>> search = Conn.getData(searchProblem);
   // out.print(searchProblem);

    if (search.size() > 0) {
        out.print(search.get(0).get(0));
    }
%>        
