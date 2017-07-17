<%-- 
    Document   : DLT_insertClone
    Created on : Jul 17, 2017, 5:31:30 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; insta: @rdcfc
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    String creator = (String) session.getAttribute("USER_ID"); 
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE"); 

    String strDetailCodes = request.getParameter("strCode");
    String masterCode = request.getParameter("masterCode");
    
    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    
    try{
        
        String[] detailCodes = strDetailCodes.split("\\|");
        
        boolean isSuccess = true; 
        String query = ""; 
        
        for(int i=0; i<detailCodes.length; i++){
            query ="INSERT INTO adm_lookup_detail(`Master_Reference_code`, `Detail_Reference_code`, hfc_cd, `Description`, priority_indicator, start_date, end_date, status, created_by, created_date) "
                    + "SELECT `Master_Reference_code`, `Detail_Reference_code`, '"+hfc_cd+"', `Description`, priority_indicator, start_date, end_date, '0', '"+creator+"', now() "
                    + "FROM adm_lookup_detail "
                    + "WHERE `Master_Reference_code`='"+masterCode+"' and `Detail_Reference_code`='"+detailCodes[i]+"' and hfc_cd ='99_iHIS_99';";
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
        System.out.println("Insert clone lookup detail: "+e.toString());
        e.printStackTrace();
        out.print("Oopps!");
    }
    
%>
