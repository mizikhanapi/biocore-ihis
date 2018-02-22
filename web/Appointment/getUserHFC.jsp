<%@page import="java.util.ArrayList"%>;
<%@page import="java.sql.*"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%
//    String hfc = dataStaff.get(0).get(1) ;
//    session.setAttribute("HEALTH_FACILITY_CODE", hfc);
    
    Conn Conn = new Conn();
    //String username = (String)session.getAttribute("username"); 
    String hfc = (String)session.getAttribute("HEALTH_FACILITY_CODE");

    String e17 = request.getParameter("e17");
    String result = "valid";
 
                                
    String sqlgetHoliday2 = "SELECT state_code, day_cd FROM pms_clinic_day WHERE hfc_cd = '"+hfc+"'";
    ArrayList<ArrayList<String>> dataGetStates = Conn.getData(sqlgetHoliday2);
    String dataStates = dataGetStates.get(0).get(0);
                                
    String sql11 = "SELECT holiday_date FROM pms_holiday WHERE state_code = '"+dataStates+"' AND status = 'active' AND hfc_cd='"+hfc+"'";
    ArrayList<ArrayList<String>> dataHolidayDate = Conn.getData(sql11); 

    for(int i=0; i<dataHolidayDate.size(); i++)
    {  
        if(e17.equals(dataHolidayDate.get(i).get(0)))
        {
          
            result = "error";
        }
        else
        {
            out.print("not success");
        }
    }
                out.print(result);

%>

