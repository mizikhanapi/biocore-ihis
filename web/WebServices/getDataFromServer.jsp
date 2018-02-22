<%-- 
    Document   : getDataFromServer
    Created on : 20-Feb-2018, 18:03:37
    Author     : wosha
--%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.Array"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    RMIConnector rmic = new RMIConnector();
    Conn conn = new Conn();
    String icnumber = "950607015241";//request.getParameter("ic");
    
    String queryPmino = "SELECT pmi_no from pms_patient_biodata WHERE new_ic_no = '"+icnumber+"'";
    ArrayList<ArrayList<String>> pmino = conn.getData(queryPmino);
    //out.print(pmino.size());
    //out.print(queryPmino);
    String pmi = pmino.get(0).get(0);
    //out.print(pmi);

    String querybp = "select pmi_no,episode_date,encounter_date,systolic_sitting,diastolic_sitting,sitting_pulse from lhr_bp where pmi_no='"+pmi+"';";
    ArrayList<ArrayList<String>> bps = conn.getData(querybp);
    //out.print(bps.size());
    JSONObject arrayobj= new JSONObject();
    JSONArray jsArray = new JSONArray();
    
    int counter = 0;
    String[] jsonvar = new String[bps.size()];
    for(int i=0;i<bps.size();i++){
       
       JSONObject objectjs= new JSONObject();
       objectjs.put("pmi_no", bps.get(i).get(0));
       objectjs.put("episode_date", bps.get(i).get(1));
       objectjs.put("encounter_date", bps.get(i).get(2));
       objectjs.put("systolic_sitting", bps.get(i).get(3));
       objectjs.put("diastolic_sitting", bps.get(i).get(4));
       objectjs.put("sitting_pulse", bps.get(i).get(5));
//       out.println(bps.get(i).get(0)+"<br/>");
//       out.println(bps.get(i).get(1)+"<br/>");
//       out.println(bps.get(i).get(2)+"<br/>");
//       out.println(bps.get(i).get(3)+"<br/>");
//       out.println(bps.get(i).get(4)+"<br/>");
//       out.println(bps.get(i).get(5)+"<br/>");
//       out.println("----------------------"+"<br/>");
       //counter++;
       jsArray.put(objectjs);
    }
    out.print(jsArray);
%>

