<%-- 
    Document   : discharge
    Created on : Mar 3, 2017, 4:58:40 PM
    Author     : -D-
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    String msg = request.getParameter("msg");
    String pmino = request.getParameter("pmino");
    String episodedate = request.getParameter("episodedate");
    String status = request.getParameter("status");

    Conn conn = new Conn();
    String sqlCheckEHR = "SELECT * FROM ehr_central where pmi_no = '" + pmino + "' AND c_txndate = '" + episodedate + "'";

    ArrayList<ArrayList<String>> dataEHR = conn.getData(sqlCheckEHR);



            boolean stats = conn.setData("INSERT INTO ehr_central(pmi_no, c_txndate, c_txndata, status,status_1,status_2,status_3,status_4,status_5) "
                    + "VALUES('" + pmino + "','" + episodedate + "','" + msg + "','" + status + "','0','0','0','0','0') ");

            if (stats) {
                out.print("|-SUCCESS-|");
            } else {
                out.print("|2|");
            }

   


 

%>