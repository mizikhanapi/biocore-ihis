<%-- 
    Document   : progressNote_delete
    Created on : Jul 16, 2017, 12:04:14 AM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    String pmiNo = (String) session.getAttribute("patientPMINo");
    String dateTime = request.getParameter("dateTime");
    
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    
    try{
        
        String query="DELETE FROM lhr_ort_nur_progressnote WHERE pmi_no='"+pmiNo+"' and encounter_date='"+dateTime+"';";
        
        boolean isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);
        
        if(isSuccess){
            out.print("success");
        }
        else{
            out.print("fail");
        }
    
    }
    catch(Exception e){
        System.out.println("Deleting progress note: "+e.toString());
        e.printStackTrace();
    }
%>