<%-- 
    Document   : getDetailFlexList
    Created on : Apr 13, 2018, 11:04:42 AM
    Author     : user
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ADM_helper.LookupHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
    String master_cd = request.getParameter("master_cd");
    String key = request.getParameter("keyword");
    LookupHelper lh = new LookupHelper("99_iHIS_99");
    ArrayList<ArrayList<String>> data = lh.getListOfDetailCodeNameFlex(master_cd, key);
    
    JSONArray jsonArr = new JSONArray();
    
    for(ArrayList<String> temp : data){
        JSONObject obj = new JSONObject();
        obj.put("value", temp.get(0));
        obj.put("name", temp.get(1));
        jsonArr.put(obj);
    }
    
    out.print(jsonArr.toString());
    
%>
