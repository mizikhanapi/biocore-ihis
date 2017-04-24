<%-- 
    Document   : bodySystem_insert
    Created on : Mar 28, 2017, 6:45:41 PM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String creator = session.getAttribute("USER_ID").toString();
    String hfcCode = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String discipline = session.getAttribute("DISCIPLINE_CODE").toString();
    String subdiscipline = session.getAttribute("SUB_DISCIPLINE_CODE").toString();

    String bs_code = request.getParameter("bs_code");
    String bs_name = request.getParameter("bs_name");
    String status = request.getParameter("status");
    
    Conn conn = new Conn();
    
    String sqlCheck = "Select body_system_cd from ris_body_system where body_system_cd = '"+bs_code+"' AND hfc_cd = '"+hfcCode+"' LIMIT 1";
    
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);
    
    if(duplicate.size() > 0){
        out.print("Sorry. The body system code is already used. Please enter different code");
        
    }else{
        RMIConnector rmic = new RMIConnector();
        
        String query = "Insert into ris_body_system(hfc_cd, modality_cd, body_system_cd, body_system_name, discipline_cd, subdiscipline_cd, created_by, created_date, status) "
                + "values ('"+hfcCode+"', '-', '"+bs_code+"', '"+bs_name+"', '"+discipline+"', '"+subdiscipline+"', '"+creator+"', now(), '"+status+"')";
        
        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, query);
        
        if(isInsert){
            out.print("success");
        
        }else{
            out.print("fail");
        
        }
    
    }

%>
