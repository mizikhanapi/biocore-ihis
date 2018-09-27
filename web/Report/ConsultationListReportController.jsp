<%-- 
    Document   : ConsultationListReportController
    Created on : Sep 26, 2018, 2:04:44 AM
    Author     : shay
--%>


<%@page import="java.util.Date"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>

<%

    Config.getBase_url(request);
    Config.getFile_url(session);
    Conn conn = new Conn();

    String patientType, endDate, startDate, query="", hfc;

    startDate = request.getParameter("startDate");
    endDate = request.getParameter("endDate");
    hfc = request.getParameter("hfc");
    patientType = request.getParameter("patientType");
     
//     query = "Select  e.NEW_IC_NO, b.`PATIENT_NAME`,"
//            +" b.SEX_CODE ,IFNULL(adm_lookup_det.`Description`, 'No Record') AS Patient_Gender ,"
//            +" e.DOCTOR, adm_users.`USER_NAME`, e.EPISODE_DATE "
//            +" FROM pms_episode e INNER JOIN pms_patient_biodata b"
//            +" ON e.`PMI_NO` = b.`PMI_NO`"
//            
//            +" INNER join adm_lookup_detail adm_lookup_det"
//            +" ON adm_lookup_det.`Detail_Reference_code` =  b.SEX_CODE"
//            +" AND adm_lookup_det.`hfc_cd` = e.`HEALTH_FACILITY_CODE`"
//            +" AND adm_lookup_det.`Master_Reference_code` like '0041'"
//            
//            +" INNER join adm_users adm_users"
//            +" ON e.`HEALTH_FACILITY_CODE` = adm_users.`HEALTH_FACILITY_CODE`"
//            +" AND adm_users.`USER_ID` =  e.`DOCTOR`"
//            
//            + " WHERE cast(e.EPISODE_DATE as date)  BETWEEN '"+startDate + "' AND '" + endDate + "'"
//            + " AND e.`HEALTH_FACILITY_CODE`='"+hfc+"' ;";
    if(patientType.equalsIgnoreCase("all")){
        query = "select u.user_id,u.user_name as name, count(p.pmi_no) as total "
             + "from adm_users u , pms_episode p,adm_user_access_role ac where p.health_facility_code = '"+hfc+"' "
             + "and p.health_facility_code = u.health_facility_code and ac.discipline_code = p.discipline_code and ac.user_id = u.user_id "
             + "and cast(p.EPISODE_DATE as date)  BETWEEN '"+startDate + "' AND '" + endDate + "' "
             + "and u.user_id = p.doctor group by user_id order by total desc;";
    }else{
        query = "select p.doctor,u.user_name as name, count(p.pmi_no) as total "
             + "from adm_users u , pms_episode p,adm_user_access_role ac where p.health_facility_code = '"+hfc+"' "
             + "and p.health_facility_code = u.health_facility_code "
             + "and p.discipline_code = '"+patientType+"' and ac.discipline_code = p.discipline_code and ac.user_id = u.user_id "
             + "and cast(p.EPISODE_DATE as date)  BETWEEN '"+startDate + "' AND '" + endDate + "' "
             + "and u.user_id = p.doctor group by u.user_id order by total desc;";
    }
     
    ArrayList<ArrayList<String>> medicalInfo = conn.getData(query);
    
    if (medicalInfo.size() > 0) {
        for (int i = 0; i < medicalInfo.size(); i++) {
            ArrayList<String> medicalInforow = medicalInfo.get(i);
            String slitedDatarow = StringUtils.join(medicalInforow, "|");
            out.print(slitedDatarow);
            if (i < medicalInfo.size() - 1) {
                out.print("^");
            }
        }
    } else {
        
        out.print("No Data");
    }

%>
