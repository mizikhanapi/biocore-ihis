<%-- 
    Document   : procedure1_insertClone
    Created on : Jul 19, 2017, 12:13:49 AM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE"); 

    String strDetailCodes = request.getParameter("strCode");
    
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    
    try{
        
        String[] detailCodes = strDetailCodes.split("\\|");
        
        boolean isSuccess = true; 
        String query = ""; 
        
        for(int i=0; i<detailCodes.length; i++){
            
            query="insert into cis_procedure_1(`PROCEDURE_1_CD`, `PROCEDURE_1_NAME`, `PROCEDURE_CD`, status, hfc_cd) "
                + "select `PROCEDURE_1_CD`, `PROCEDURE_1_NAME`, `PROCEDURE_CD`, `STATUS`, '" + hfc_cd + "' "
                + "from cis_procedure_1 where hfc_cd='99_iHIS_99' and procedure_1_cd='"+detailCodes[i]+"'";
            
           isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);
            
            if(!isSuccess)
                break;
        }//end for loops
        
        if(isSuccess){
            out.print("success");
        }
        else{
            out.print("fail");
        }
    
    }
    catch(Exception e){
        System.out.println("Insert clone POM Level 2: "+e.toString());
        e.printStackTrace();
        out.print("Oopps!");
    }
    
%>
