<%-- 
    Document   : getEHRRecord
    Created on : Mar 6, 2017, 3:27:02 PM
    Author     : -D-
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
  
   String pmino = request.getParameter("pmiNo");
   String episodedate = request.getParameter("episodeDate");




    Conn conn = new Conn();
String sqlPatient = "select C_TXNData  from  ehr_central where pmi_no = '"+pmino+"' AND c_txndate = '"+episodedate+"' AND (status = 2 OR status = 4) ";
ArrayList<ArrayList<String>> EHRRecord = conn.getData(sqlPatient);

out.print(EHRRecord);
  
    

            %>