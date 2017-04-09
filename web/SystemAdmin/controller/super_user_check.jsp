<%-- 
    Document   : super_user_check
    Created on : Apr 9, 2017, 11:37:40 PM
    Author     : user
--%>

<%
    String super_user = (String)session.getAttribute("USER_ID");
    String hfc99 = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    
    String last_nine = super_user.substring(super_user.length() - 1);
    
    if(!hfc99.equals("99_iHIS_99") || !last_nine.equals("9")){
    
        out.print("Sorry, you are not authorized to do that!");
        return;    
    }

%>
