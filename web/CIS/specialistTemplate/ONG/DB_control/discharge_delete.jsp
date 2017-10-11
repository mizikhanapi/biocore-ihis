<%-- 
    Document   : discharge_delete
    Created on : Oct 10, 2017, 11:57:10 AM
    Author     : Ardhi Surya; rdsurya147@gmail.com; @rdcfc
--%>

<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%
    String pmiNo = (String) session.getAttribute("patientPMINo");
    String epDate = (String) session.getAttribute("episodeDate");
    
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String dis_cd = (String) session.getAttribute("DISCIPLINE_CODE");
    String sub_cd = (String) session.getAttribute("SUB_DISCIPLINE_CODE");
    String creator = (String) session.getAttribute("USER_ID");
    
    String tagNo = request.getParameter("tagNo");
    
    Conn con = new Conn();
    RMIConnector rmi= new RMIConnector();
    
    String query="DELETE FROM lhr_ong_discharge_baby where pmi_no='"+pmiNo+"' and hfc_cd='"+hfc_cd+"' and infant_tag_no='"+tagNo+"';";
    boolean isSuccess = rmi.setQuerySQL(con.HOST, con.PORT, query);
    
    if(isSuccess)
        out.print("success");
    else
        out.print("fail");
%>
