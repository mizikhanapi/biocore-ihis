<%-- 
    Document   : getPackage
    Created on : Jul 18, 2018, 5:56:30 PM
    Author     : user
--%>

<%@page import="ADM_helper.MySessionKey"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Conn con = new Conn();
    
    String user_group = (String) session.getAttribute(MySessionKey.USER_GROUP);
    
    String query = "Select package_type, package_name from adm_package_type WHERE system_cd='"+user_group+"';";
    
    ArrayList<ArrayList<String>> arrData = con.getData(query);
    
    JSONArray arrJson = new JSONArray();
    
    for(ArrayList<String> arr1 : arrData){
        String[] names = arr1.get(1).split("x-x");
        
//        for(String name : names){
//            html+="<h4>"+name+"</h4>";
//        }
        
        JSONObject json = new JSONObject();
        json.put("code", arr1.get(0));
        json.put("html", names);
        
        arrJson.put(json);
        
    }
    
    out.print(arrJson.toString());
%>
