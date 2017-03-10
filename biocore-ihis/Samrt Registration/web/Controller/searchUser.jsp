<%@page import ="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>

<%

    Conn conn = new Conn();
    String searchPatient, userIC;
    
    userIC = request.getParameter("userIC");
     
    searchPatient = "select * from pms_patient_biodata where NEW_IC_NO='" + userIC + "'";
    
     ArrayList<ArrayList<String>> patientRow = conn.getData(searchPatient);
     
     if(patientRow.size() > 0)
     {
         ArrayList<String> search1=patientRow.get(0);
//         for(int i = 0; i < search1.size(); i++)
//         {
//             
//         }
         String newVal = StringUtils.join(search1, "|");
         out.print(newVal);
     } else {
         out.print("NOT FOUND");
     }
%>