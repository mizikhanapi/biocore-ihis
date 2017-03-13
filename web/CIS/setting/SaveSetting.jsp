<%-- 
    Document   : SaveSetting
    Created on : Mar 12, 2017, 2:24:43 PM
    Author     : -D-
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
    String param_code =  request.getParameter("param_code");
    String param_name = request.getParameter("param_name");
    String param_type = "checkbox";
    String enable = request.getParameter("enable");
    String createdby = request.getParameter("createdby");
    String createddate = request.getParameter("createddate");
    String hfc_cd = request.getParameter("hfc_cd");
    String user_id = request.getParameter("user_id");
    
 

    Conn conn = new Conn();
        String sqlCheckSetting = "select * from cis_clinic_param where param_code = '"+param_code+"' AND user_id = '"+user_id+"' AND hfc_cd='"+hfc_cd+"'";
       ArrayList<ArrayList<String>> checkSetting = conn.getData(sqlCheckSetting);
       if (checkSetting.size() > 0){
            boolean updateEnable = conn.setData("UPDATE cis_clinic_param SET enable = '"+enable+"' WHERE user_id = '"+user_id+"' AND param_code = '"+param_code+"' AND hfc_cd = '"+hfc_cd+"';");
             if (updateEnable) {
                    out.print("|3|");
                } else {
                    out.print("|4|");
                }
       }else{
            String insert = "INSERT INTO cis_clinic_param(param_code,param_name, param_type, enable, created_by, created_date,hfc_cd,user_id) VALUES('" + param_code + "','" + param_name + "','" + param_type + "','" + enable + "','" + createdby + "','" + createddate + "','" + hfc_cd + "','" + user_id + "')";
                boolean stats = conn.setData(insert);
                //out.print(insert);
                if (stats) {
                    out.print("|1|");
                } else {
                    out.print("|2|");
                }
       }
   


    

            
%>