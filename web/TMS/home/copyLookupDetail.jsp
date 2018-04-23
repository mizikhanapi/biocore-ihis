<%-- 
    Document   : copyLookupDetail
    Created on : Apr 23, 2018, 7:23:27 PM
    Author     : user
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="ADM_helper.MySessionKey"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String user_id = (String) session.getAttribute(MySessionKey.USER_ID);
    String hfc_cd = request.getParameter("hfc_cd");
    String copyLookup = "INSERT INTO adm_lookup_detail(Master_Reference_code, Detail_Reference_code, Description, priority_indicator, start_date, end_date, status, created_by, created_date, hfc_cd) "
            + "Select Master_Reference_code, Detail_Reference_code, Description, priority_indicator, start_date, end_date, status, '" + user_id + "', now(), '" + hfc_cd + "' "
            + "from adm_lookup_detail where hfc_cd = '99_iHIS_99'";
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    
    boolean isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, copyLookup);
    String msg="";
    if(isSuccess){
        msg = "Lookup detail is copied,";
    }
    else{
        msg = "Failed to copy lookup detail.";
    }
    
    JSONObject json = new JSONObject();
    json.put("msg", msg);
    
    out.print(json.toString());

%>
