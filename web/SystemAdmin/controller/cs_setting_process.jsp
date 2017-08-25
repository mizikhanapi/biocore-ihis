<%-- 
    Document   : cs_setting_process
    Created on : Jun 15, 2017, 8:32:26 PM
    Author     : shay
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    
    String type = request.getParameter("type");
    
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    
    boolean success = true;
    
    String query = "select status from adm_system_parameter where system_code = 'CS' and parameter_code ='2' and hfc_cd='"+hfc_cd+"';";
    
    ArrayList<ArrayList<String>> dataPara = con.getData(query);
    
    if(dataPara.size()<1){ //No data yet, so we insert new row of data
        String creator = (String) session.getAttribute("USER_ID");
        query ="Insert into adm_system_parameter(system_code, parameter_code, parameter_name, status, created_by, created_date, hfc_cd) "
                + "values('CS', '2', 'Calling_System_Type', '"+type+"', '"+creator+"', now(), '"+hfc_cd+"');";
        success = rmi.setQuerySQL(con.HOST, con.PORT, query);
    }
    else{ // Data exist, update existing data
        
        query="Update adm_system_parameter set status='"+type+"' "
                + "where hfc_cd='"+hfc_cd+"' and system_code='CS' and parameter_code='2'";
        success = rmi.setQuerySQL(con.HOST, con.PORT, query);
    }
    
    //print result to ajax request
    if(success){
        out.print("success");
        //set session
        session.setAttribute("CS_PARAM", type);
    }
    else{
        out.print("fail");
    }
%>