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
    String cat_cd = request.getParameter("cat_cd");
    
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    
    try{
        
        String[] detailCodes = strDetailCodes.split("\\|");
        
        boolean isSuccess = true; 
        String query = ""; 
        
        for(int i=0; i<detailCodes.length; i++){
            
            query="insert into opt_procedure( hfc_cd, `category_cd`, `procedure_cd`, `procedure_shortName`, procedure_longName, quantity, buying_price, created_by, created_date, selling_price, status) "
                + "select '"+hfc_cd+"', `category_cd`, `procedure_cd`, `procedure_shortName`, procedure_longName, quantity, buying_price, '"+creator+"', now(), selling_price, status "
                + "from opt_procedure where hfc_cd='99_iHIS_99' and procedure_cd='"+detailCodes[i]+"' and category_cd='"+cat_cd+"' ";
            
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
        System.out.println("Insert clone OPT Procedure "+e.toString());
        e.printStackTrace();
        out.print("Oopps!");
    }
    
%>
