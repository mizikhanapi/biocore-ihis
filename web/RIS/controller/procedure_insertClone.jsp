<%-- 
    Document   : procedure_insertClone
    Created on : Jul 18, 2017, 10:53:59 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    String creator = (String) session.getAttribute("USER_ID"); 
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE"); 

    String strDetailCodes = request.getParameter("strCode");
    
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    
    try{
        
        String[] detailCodes = strDetailCodes.split("\\|");
        
        boolean isSuccess = true; 
        String query = ""; 
        
        for(int i=0; i<detailCodes.length; i++){
            
            query="insert into ris_procedure_master(hfc_cd, clinical_discipline_cd, body_system_cd, modality_cd, ris_procedure_cd, ris_procedure_name, discipline_cd, subdiscipline_cd, selling_price, buying_price, quantity, created_by, created_date, status) "
                + "select '" + hfc_cd + "', clinical_discipline_cd, body_system_cd, modality_cd, ris_procedure_cd, ris_procedure_name, '001', '001', selling_price, buying_price, quantity, '" + creator + "', now(), '0' "
                + "from ris_procedure_master WHERE hfc_cd = '99_iHIS_99' and ris_procedure_cd='"+detailCodes[i]+"';";
            
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
        System.out.println("Insert clone RIS procedure: "+e.toString());
        e.printStackTrace();
        out.print("Oopps!");
    }
    
%>
