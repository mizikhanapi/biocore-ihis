<%-- 
    Document   : assignRole_insert
    Created on : Feb 23, 2017, 5:37:24 PM
    Author     : user
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%           
    Conn conn = new Conn();
    String userCode = request.getParameter("userCode");
    String roleCode = request.getParameter("roleCode");
    String disciplineCode = request.getParameter("disciplineCode");
    String subdisciplineCode = request.getParameter("subdisciplineCode");
    String status = request.getParameter("status");
    String creator = (String)session.getAttribute("USER_ID");
    
    
    String sqlCheck = "SELECT user_id FROM adm_user_access_role WHERE user_id = '"+userCode+"' LIMIT 1 ";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);
    
    
    if(duplicate.size() > 0)
    {
        out.print("Sorry, user "+userCode+" has already assigned to a role.");
        
    }else{
        
        String sqlGetUser = "SELECT health_facility_code from adm_users where user_id = '"+userCode+"' LIMIT 1 ";
        ArrayList<ArrayList<String>> dataHFC = conn.getData(sqlGetUser);
        
        if(dataHFC.size() <= 0){
            out.print("Sorry, user "+userCode+" does not exist or did not register properly.");
        
        }else{
        
            RMIConnector rmic = new RMIConnector();
            
            String hfcCode = dataHFC.get(0).get(0);

            String sqlInsert = "INSERT INTO adm_user_access_role(user_id, role_code, health_facility_code, discipline_code, subdiscipline_code, created_by, created_date, status) "
                        +"VALUES('"+userCode+"', '"+roleCode+"', '"+hfcCode+"', '"+disciplineCode+"', '"+subdisciplineCode+"', '"+creator+"', now(), '"+status+"')";

            boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, sqlInsert);

            if (isInsert == true) {
                out.print("Success");
            } else {
                out.print("Failed");
            }
        
        }
        
    }

    

%>

