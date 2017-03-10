<%@page import ="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%
 final int NO_USER = 0;
    final int WRONG_PASSWORD = 1;
    final int LOGIN = 2;
    int status = 0;
    
    Config.getBase_url(request);
      Config.getFile_url(session);
    Conn conn = new Conn();
    
    String user_id = request.getParameter("userIC");
    String password = request.getParameter("password");
    String facility = request.getParameter("facility");
        
    
    
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
                session.setAttribute("Admin_IC", user_id);
                String name = dataStaff.get(0).get(2) ;
                session.setAttribute("Admin_NAME", name);
                session.setAttribute("HFC", facility);
                session.setMaxInactiveInterval(24*60*60);
                
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
    
    
   
%>