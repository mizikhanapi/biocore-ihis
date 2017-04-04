<%-- 
    Document   : procedure_insert
    Created on : Apr 4, 2017, 9:32:48 PM
    Author     : user
--%>

<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String hfc_cd = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String creator = session.getAttribute("USER_ID").toString();
    String discipline = session.getAttribute("DISCIPLINE_CODE").toString();
    String subdiscipline = session.getAttribute("SUB_DISCIPLINE_CODE").toString();
    
    String clincal_code = request.getParameter("clinical_discipline_cd");
    String bs_code = request.getParameter("bs_cd");
    String bs_name = request.getParameter("bs_name");
    String mod_code = request.getParameter("mod_cd");
    String mod_name = request.getParameter("mod_name");
    String pro_code = request.getParameter("procedure_cd");
    String pro_name = request.getParameter("procedure_name");
    String buy = request.getParameter("buyPrice");
    String sell = request.getParameter("sellPrice");
    String quantity = request.getParameter("quantity");
    String status = request.getParameter("status");
    
    Conn conn = new Conn();
    
    String sqlCheck = "Select ris_procedure_cd from ris_procedure_master where hfc_cd = '"+hfc_cd+"' AND ris_procedure_cd = '"+pro_code+"' limit 1";
    ArrayList<ArrayList<String>> duplicate = conn.getData(sqlCheck);
    
    if(duplicate.size() > 0){
        out.print("Sorry. The procedure code " + pro_code + " is already used. Please enter different code.");
    
    }else{
    
        RMIConnector rmic = new RMIConnector();
        String query = "Insert into ris_procedure_master(hfc_cd, clinical_discipline_cd, body_system_cd, modality_cd, ris_procedure_cd, ris_procedure_name, discipline_cd, subdiscipline_cd, selling_price, buying_price, quantity, created_by, created_date, status, body_system_name, modality_name) "
                + "values('"+hfc_cd+"', '"+clincal_code+"', '"+bs_code+"', '"+mod_code+"', '"+pro_code+"', '"+pro_name+"', '"+discipline+"', '"+subdiscipline+"', '"+sell+"', '"+buy+"', '"+quantity+"', '"+creator+"', now(), '"+status+"', '"+bs_name+"', '"+mod_name+"')";
        
        boolean isInsert = rmic.setQuerySQL(conn.HOST, conn.PORT, query);
        
        if(isInsert){
            out.print("success");
        
        }else{
            out.print("fail");
        
        }
    
    }

%>