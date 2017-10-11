<%-- 
    Document   : getInfantTag
    Created on : Oct 9, 2017, 2:43:40 PM
    Author     : Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    String pmiNo = (String) session.getAttribute("patientPMINo");
    String hfc_cdc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    
    Conn con = new Conn();
    
    String query="SELECT infant_tag_no FROM lhr_ong_infant_birth_record WHERE pmi_no='"+pmiNo+"' order by created_date desc limit 1;";
    
    ArrayList<ArrayList<String>> dataInf = con.getData(query);
    
    String tag_no="";
    
    if(dataInf.size()>0){
        tag_no = dataInf.get(0).get(0);
    }
    
    out.print(tag_no);
%>
