<%-- 
    Document   : process_change_dis
    Created on : Aug 22, 2017, 7:09:15 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc= (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String userID = (String) session.getAttribute("USER_ID");
    
    String disCD = request.getParameter("disCD");
    String disName = request.getParameter("disName");
    String subCD = request.getParameter("subCD");
    String subName = request.getParameter("subName");
    
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    
    try{
        String query ="UPDATE adm_user_access_role set `DISCIPLINE_CODE`='"+disCD+"', `SUBDISCIPLINE_CODE`='"+subCD+"' WHERE `HEALTH_FACILITY_CODE`='"+hfc+"' and `USER_ID`='"+userID+"';";
        boolean isUpdate=rmi.setQuerySQL(con.HOST, con.PORT, query);
        
        if(isUpdate){
            out.print("success");
            session.setAttribute("DISCIPLINE_NAME", disName);
            session.setAttribute("SUB_DISCIPLINE_NAME", subName);
            session.setAttribute("DISCIPLINE_CODE", disCD);
            session.setAttribute("SUB_DISCIPLINE_CODE", subCD);
        }
        else{
            out.print("fail");
        }
    
    }//end try
    catch(Exception e){
        response.sendError(response.SC_BAD_REQUEST);
    }//end catch
%>
