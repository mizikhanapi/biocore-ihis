<%@page import ="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%
    RMIConnector rmic = new RMIConnector();
   
    Conn conn = new Conn();
    
    String userIC, userPassword,userMobileNO,userName,userEmail;
    
  
    
    userIC = request.getParameter("userIC");
    userName = request.getParameter("userName");
    userPassword = request.getParameter("userPassword");
    userEmail = request.getParameter("userEmail");
    userMobileNO = request.getParameter("userPhoneNo");
    
     String searchPatient, exsited;
    
     searchPatient = "select * from adm_signup_tbl where ic_no='" + userIC + "'";
    
     
     ArrayList<ArrayList<String>> patientRow = conn.getData(searchPatient);
     out.print(patientRow);
     
     if(patientRow.size() > 0)
     {
        
        exsited= " Existed ";
     }  else {
         
            exsited= " not "; 
            
            
        Boolean SQL=false;
            String sql1 = "insert into adm_signup_tbl(ic_no,username, password,email,mobile_no)"
                    + "values('" + userIC + "', '" + userName + "', '" + userPassword 
                    + "', '" + userEmail + "', '" + userMobileNO + "')";

            SQL = rmic.setQuerySQL(conn.HOST, conn.PORT, sql1);
            out.print(SQL+"|"+sql1);
             out.print(userIC+" "+userName);
     }
     out.print(exsited);
    
   
%>