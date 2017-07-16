<%-- 
    Document   : morseAss_approve
    Created on : Jul 16, 2017, 10:24:20 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@page import="Formatter.DateFormatter"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    String approver = (String) session.getAttribute("USER_ID");
    String pmiNo = (String) session.getAttribute("patientPMINo");
    
    String enDate = request.getParameter("enDate");
    String time = request.getParameter("morseTime");
    
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    
    try{
        enDate = DateFormatter.formatDate(enDate, "dd/MM/yyyy", "yyyy-MM-dd");

        if (time.equalsIgnoreCase("AM")) {
            enDate = enDate + " 04:00:00.0";
        } else if (time.equalsIgnoreCase("PM")) {
            enDate = enDate + " 20:00:00.0";
        } else {
            enDate = enDate + " 12:00:00.0";
        }
        
        String query ="UPDATE lhr_ort_nur_morse_fall_scale set approved_by = '"+approver+"', approved_date = now() "
                + "WHERE pmi_no='"+pmiNo+"' and encounter_date='"+enDate+"';";
        
        boolean isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);

        if (isSuccess) {
            out.print("success");
        } else {
            out.print("fail");
        }
    
    }
    catch(Exception e){
        System.out.println("Approving morsefallscale :"+ e.toString());
        e.printStackTrace();
        out.print("Oopps!");
    }
%>
