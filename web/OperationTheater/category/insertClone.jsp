<%-- 
    Document   : procedure_insertClone
    Created on : Jul 18, 2017, 11:50:59 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE"); 
    String creator = (String) session.getAttribute("USER_ID");

    String strDetailCodes = request.getParameter("strCode");
    
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    
    try{
        
        String[] detailCodes = strDetailCodes.split("\\|");
        
        boolean isSuccess = true; 
        String query = ""; 
        
        for(int i=0; i<detailCodes.length; i++){
            
            query="insert into opt_procedure_category(`category_cd`, `category_name`, `STATUS`, hfc_cd, created_by, created_date) "
                + "select `category_cd`, `category_name`, `STATUS`, '" + hfc_cd + "', '"+creator+"', now() "
                + "from opt_procedure_category where hfc_cd='99_iHIS_99' and category_cd='"+detailCodes[i]+"' ";
            
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
        System.out.println("Insert clone OPT Category: "+e.toString());
        e.printStackTrace();
        out.print("Oopps!");
    }
    
%>
