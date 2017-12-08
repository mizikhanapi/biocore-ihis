<%-- 
    Document   : setting_CIS
    Created on : Jun 7, 2017, 4:45:27 PM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String DGS = request.getParameter("DGS");
    String DCG = request.getParameter("DCG");
    String CCN = request.getParameter("CCN");

    Conn con = new Conn();
    RMIConnector rmi = new RMIConnector();
    boolean success = true;

    String query = "Select param_code from cis_clinic_param where hfc_cd ='" + hfc_cd + "' and user_id ='-x-' limit 1;";

    ArrayList<ArrayList<String>> dataParam = con.getData(query);

    //---check is param code exist?
    if (dataParam.size() > 0) {
        String whereClause = " and hfc_cd ='" + hfc_cd + "' and user_id ='-x-' ";
        query = "Update cis_clinic_param set enable ='" + DGS + "' where param_code ='DGS' " + whereClause;
        success = rmi.setQuerySQL(con.HOST, con.PORT, query);

        if (success) {
            query = "Update cis_clinic_param set enable ='" + DCG + "' where param_code ='DCG' " + whereClause;
            success = rmi.setQuerySQL(con.HOST, con.PORT, query);
        }

        if (success) {
            query = "Update cis_clinic_param set enable ='" + CCN + "' where param_code ='CCN' " + whereClause;
            success = rmi.setQuerySQL(con.HOST, con.PORT, query);
        }
        
    } else {
        
        String creator = (String) session.getAttribute("USER_ID");
        String insertInto = "Insert into cis_clinic_param(param_code, param_name, enable, created_by, created_date, hfc_cd, user_id) "
                + "select param_code, param_name, '"+DGS+"', '"+creator+"', now(), '"+hfc_cd+"', user_id from cis_clinic_param "
                + "where param_code ='DGS' and hfc_cd ='99_iHIS_99' and user_id='-x-';";
        
        success = rmi.setQuerySQL(con.HOST, con.PORT, insertInto);
        
        if(success){
             insertInto = "Insert into cis_clinic_param(param_code, param_name, enable, created_by, created_date, hfc_cd, user_id) "
                + "select param_code, param_name, '"+DCG+"', '"+creator+"', now(), '"+hfc_cd+"', user_id from cis_clinic_param "
                + "where param_code ='DCG' and hfc_cd ='99_iHIS_99' and user_id='-x-';";
        
            success = rmi.setQuerySQL(con.HOST, con.PORT, insertInto);
        }
        
        if(success){
             insertInto = "Insert into cis_clinic_param(param_code, param_name, enable, created_by, created_date, hfc_cd, user_id) "
                + "select param_code, param_name, '"+CCN+"', '"+creator+"', now(), '"+hfc_cd+"', user_id from cis_clinic_param "
                + "where param_code ='CCN' and hfc_cd ='99_iHIS_99' and user_id='-x-';";
        
            success = rmi.setQuerySQL(con.HOST, con.PORT, insertInto);
        }

    }
    
    if(success){
        out.print("success");
        
        ArrayList<String> params = new ArrayList<String>();
        
        if(DGS.equalsIgnoreCase("1"))
            params.add("DGS");
        
        if(DCG.equalsIgnoreCase("1"))
            params.add("DCG");
        
        if(CCN.equalsIgnoreCase("1"))
            params.add("CCN");
        
        String CISLongString = String.join("|", params);
        session.setAttribute("CIS_PARAM", CISLongString);
    }
    else{
        out.print("fail");
    }
%>
