<%-- 
    Document   : dischargeProcess
    Created on : Dec 2, 2017, 10:31:03 AM
    Author     : user
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="ADT_helper.ADT_EHRMessenger"%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="ADM_helper.MySessionKey"%>
<%
    String hfc_cd = (String) session.getAttribute(MySessionKey.HFC_CD);
    String user_id = (String) session.getAttribute(MySessionKey.USER_ID);
    String dis_cd = (String) session.getAttribute(MySessionKey.DISCIPLINE_CD);
    String sub_cd = (String) session.getAttribute(MySessionKey.SUBDISCIPLINE_CD);
    Conn con = new Conn(); 
    RMIConnector rmi = new RMIConnector();
    boolean success = false;
    
    String pmiNo = request.getParameter("pmiNo"); 
    String[] arrDay= request.getParameter("arrDay").split("\\|"); 
    String[] arrCharge= request.getParameter("arrCharge").split("\\|"); 
    String[] arrCode= request.getParameter("arrCode").split("\\|"); 
    String[] arrName= request.getParameter("arrName").split("\\|"); 
    String orderNo= request.getParameter("orderNo"); 
    String orderDate= request.getParameter("arrName"); 
    String epiDate= request.getParameter("epiDate"); 
    String lasDiscipline= request.getParameter("discipline"); 
    String bedID= request.getParameter("bedID"); 
    String wardID= request.getParameter("wardID"); 
    
    String encounterDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
    String query="";
    
    //send to billing
    ADT_EHRMessenger ehr = new ADT_EHRMessenger(user_id, hfc_cd, dis_cd, sub_cd, pmiNo, orderNo, orderDate, epiDate, encounterDate);
    success = ehr.sendWardCharge(arrCode, arrName, arrDay, arrCharge); 
    
    //update order_master status=1
    if(success){
        query="UPDATE wis_order_master set order_status='1' WHERE pmi_no='"+pmiNo+"' AND order_no='"+orderNo+"' AND hfc_cd='"+hfc_cd+"';";
        success=rmi.setQuerySQL(con.HOST, con.PORT, query);
    }
    
    //update inpatient  status=1
    if(success){
        query="UPDATE wis_inpatient_episode set inpatient_status='1' where pmi_no='"+pmiNo+"' AND hfc_cd='"+hfc_cd+"' AND inpatient_status='0';";
        success=rmi.setQuerySQL(con.HOST, con.PORT, query);
    }
    
    //update inpatient history
    if(success){
        query="UPDATE wis_inpatient_episode_history set inpatient_status='1' where pmi_no='"+pmiNo+"' AND hfc_cd='"+hfc_cd+"' AND inpatient_status='0';";
        success=rmi.setQuerySQL(con.HOST, con.PORT, query);
    }
    
    //update bed status=Available
    if(success){
        query="UPDATE wis_bed_id set bed_status='Available' WHERE hfc_cd='"+hfc_cd+"' AND discipline_cd='"+lasDiscipline+"' AND ward_id='"+wardID+"' AND bed_id='"+bedID+"';";
        success=rmi.setQuerySQL(con.HOST, con.PORT, query);
    }
    
    if(success){
        out.print("success");
    }
    else{
        out.print(query);
    }
    
    
%>