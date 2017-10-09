<%-- 
    Document   : send_to_bill
    Created on : May 1, 2017, 6:45:01 PM
    Author     : user
--%>

<%@page import="OPT_helper.OPT_EHRMessageSender"%>
<%@page import="POS_helper.POS_EHRMessenger"%>
<%
    
    String userID =(String) session.getAttribute("USER_ID");
    String hfc =(String) session.getAttribute("HEALTH_FACILITY_CODE");
    String dis =(String) session.getAttribute("DISCIPLINE_CODE");
    String subdis =(String) session.getAttribute("SUB_DISCIPLINE_CODE");
    
    String longString = request.getParameter("longData");
    
    String[] bigFields = longString.split("\\^");
    
    OPT_helper.OPT_EHRMessageSender ems;
    
    boolean isSuccess = true;
    
    for(int i = 0; i < bigFields.length; i++){
        String[] smallFields = bigFields[i].split("\\|");
        ems = new OPT_EHRMessageSender(userID, hfc, dis, subdis, smallFields[1], smallFields[0], smallFields[2], smallFields[3], smallFields[4]);
        isSuccess = ems.isInsertIntoEHR_FAR("19"); //19 is code for OPT
        
        if(!isSuccess)
            break;
    }
    
    if(isSuccess){
        out.print("success");
    }
   
    
   
%>
