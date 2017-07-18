<%-- 
    Document   : bodySystem_insertClone
    Created on : Jul 18, 2017, 6:58:11 PM
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
            query = "Insert into ris_body_system(hfc_cd, modality_cd, body_system_cd, body_system_name, discipline_cd, subdiscipline_cd, created_by, created_date, status) "
                + "Select '" + hfc_cd + "', modality_cd, body_system_cd, body_system_name, '001', '001', '" + creator + "', now(), '0' "
                + "from ris_body_system where hfc_cd = '99_iHIS_99' and body_system_cd='"+detailCodes[i]+"'; ";

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
        System.out.println("Insert clone body system: "+e.toString());
        e.printStackTrace();
        out.print("Oopps!");
    }
    
%>
