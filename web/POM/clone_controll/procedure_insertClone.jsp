<%-- 
    Document   : procedure_insertClone
    Created on : Jul 18, 2017, 11:50:59 PM
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
            
            query="insert into cis_procedure(`PROCEDURE_CD`, `PROCEDURE_NAME`, `STATUS`, hfc_cd, selling_price, buying_price) "
                + "select `PROCEDURE_CD`, `PROCEDURE_NAME`, `STATUS`, '" + hfc_cd + "', selling_price, buying_price "
                + "from cis_procedure where hfc_cd='99_iHIS_99' and procedure_cd='"+detailCodes[i]+"' ";
            
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
        System.out.println("Insert clone POM Level 1: "+e.toString());
        e.printStackTrace();
        out.print("Oopps!");
    }
    
%>
