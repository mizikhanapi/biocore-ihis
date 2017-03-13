<%-- 
    Document   : login
    Created on : Feb 14, 2017, 9:42:17 PM
    Author     : user
--%>
<%@page import ="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%
   
    
    final int NO_USER = 0;
    final int WRONG_PASSWORD = 1;
    final int LOGIN = 2;
    int status = 0;
    
    Conn conn = new Conn();
    
    String user_id = request.getParameter("userIC");
    String password = request.getParameter("password");
      
    
    
    String sql = "SELECT USER_ID, PASSWORD, USER_NAME from adm_users where USER_ID='"+user_id+"';";
    ArrayList<ArrayList<String>> dataStaff = conn.getData(sql);

//    out.print(dataPatient.size());
//    out.print(dataStaff.size());
     //out.print(dataStaff.get(0).get(0));
    
    if(dataStaff.size() > 0)                                                   // login Staff (admin, nurse, doctor)
    {
//        for(int i=0; i<dataStaff.size(); i++)
//        {    
            
            if(dataStaff.get(0).get(1).equals(password))
            {
                session.setAttribute("USER_IC", user_id);
                String name = dataStaff.get(0).get(2) ;
                session.setAttribute("USER_NAME", name);
//                

                status = LOGIN;
                //response.sendRedirect("facility.jsp");
            }
            else
            {
               status = WRONG_PASSWORD;
            }
            
           
//        }
    }
    else
    {
       status = NO_USER;
    }
    
    out.print(status);
    
    
   
//    
//   ArrayList<ArrayList<String>> dataRIS = conn.getData(sqlRIS);
//    if(dataRIS.size() < 1){
//        out.print("Not Fount");
//    }else{
//        ArrayList<String> singleDataRIS = dataRIS.get(0);
//        String result = StringUtils.join(singleDataRIS,"|");
//        out.print(result);
//    }
//    
    %>