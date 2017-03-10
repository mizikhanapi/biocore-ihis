<%@page import ="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>

<%
    RMIConnector rmic = new RMIConnector();
   
    Config.getBase_url(request);
    Config.getFile_url(session);
    
    Conn conn = new Conn();
    
    final int EXISTED_USER = 1;
    final int NEW_USER = 2;
    int status = 0;
    
    String userIC, userID, userName, userGender, userNationality,
            userOccupation,userEmail, userPhoneNo,userBirthday;
    
    userIC = request.getParameter("userIC");
    userID = request.getParameter("userID");
    userName = request.getParameter("userName");
    userNationality = request.getParameter("userNationality");
    userGender = request.getParameter("userGender");
    userOccupation = request.getParameter("userOccupation");
    userEmail = request.getParameter("userEmail");
    userPhoneNo = request.getParameter("userPhoneNo");
    userBirthday = request.getParameter("userbirthday");
    
   String dataPatientBiodata,searchPatient, exsited;
    
     searchPatient = "select * from pms_patient_biodata where NEW_IC_NO='" + userIC + "'";
    
     
     ArrayList<ArrayList<String>> patientRow = conn.getData(searchPatient);
     out.print(patientRow);
     
     if(patientRow.size() > 0)
     {
        
        exsited= "  Existed ";
     }  else {
         
            exsited= " not ";
            String pmino = rmic.getPMI(conn.HOST, conn.PORT, userIC); 
            out.print(pmino);
            
            Boolean SQL=false;
            String sql1 = "insert into PMS_PATIENT_BIODATA(PMI_NO,PATIENT_NAME,NEW_IC_NO,ID_NO,NATIONALITY,"
                   + "BIRTH_DATE,SEX_CODE,MOBILE_PHONE,EMAIL_ADDRESS)"
                   + "values('" + pmino + "', '" + userName + "', '" + userIC + "', '" + userID 
                   + "', '" + userNationality +"', '" + userBirthday + "', '" + userGender + "', '" + userPhoneNo + "', '" + userEmail + "')";

            SQL = rmic.setQuerySQL(conn.HOST, conn.PORT, sql1);
            out.print(SQL+"|"+sql1);
    
    
//            + " recived : "+userIC+"-"+ userID+"-"+ userName+"-"+ 
//            userGender+"-"+ userNationality+"-"+ userOccupation+ "-"+userEmail+"-"+ userPhoneNo+"-"+userBirthday);
   }
     out.print(exsited);
     
%>