<%-- 
    Document   : searchNextPatient
    Created on : Mar 11, 2017, 2:09:52 PM
    Author     : -D-
--%>


<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>

<%
    
    Conn conn = new Conn();
    String now = request.getParameter("date");
  String hfc_cd= request.getParameter("hfc");
//    String now = "2017-03-12";
//    String hfc_cd = "04010102";
    
//    String sqlPatient = "select pmi_no,patient_name,new_ic_no,blood_type,sex_code,id_type,birth_date,race_code,allergy_ind from emedica.pms_patient_biodata where pmi_no = '"+pmiNo+"'";
//ArrayList<ArrayList<String>> dataQueue = conn.getData(sqlPatient);

String sqlNextPatient = "select * from pms_patient_queue a,  pms_patient_biodata b where status = '0'  AND a.episode_date LIKE '%"+now+"%' and a.pmi_no = b.`PMI_NO` and a.hfc_cd = '"+hfc_cd+"' order by queue_no LIMIT 1 ";
ArrayList<ArrayList<String>> dataNextPatient = conn.getData(sqlNextPatient);
if(dataNextPatient.size() < 1){
    out.print("|O|");
}else{
    out.print(dataNextPatient.get(0).get(4)+"|"+dataNextPatient.get(0).get(2));
}

//out.print(dataNextPatient);
    


%>