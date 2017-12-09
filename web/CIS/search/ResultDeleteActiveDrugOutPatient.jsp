<%-- 
    Document   : ResultAddActiveDrugOutPatient
    Created on : Aug 14, 2017, 6:27:29 PM
    Author     : shay
--%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%
    String pmi, drug_onset, hfc, doctor, drugcode;
    pmi = request.getParameter("pmi_no");
    drugcode = request.getParameter("drug_code");
    drug_onset = request.getParameter("drug_onset");

    String sql = "DELETE FROM lhr_active_medication WHERE pmi_no = '"+pmi+"' AND drug_cd = '"+drugcode+"' AND onset_date = '"+drug_onset+"';";
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    

        Boolean deleteS = rmic.setQuerySQL(conn.HOST, conn.PORT, sql);
        if(deleteS){
            out.print("|-SUCCESS-|");
            
        }else{
            out.print("fail");
          
        }
    
%>