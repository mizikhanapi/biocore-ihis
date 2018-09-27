<%-- 
    Document   : DiagnosisListController
    Created on : Sep 26, 2018, 3:43:42 AM
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
        query = "select d.icd10_cd,d.icd10_description,count(d.pmi_no) "
                + "from lhr_diagnosis d,pms_episode p where d.hfc_cd = '"+hfc+"' "
             + "and cast(d.EPISODE_DATE as date)  BETWEEN '"+startDate + "' AND '" + endDate + "' and d.pmi_no = p.pmi_no and d.episode_date = p.episode_date group by (icd10_cd)";
    }else{
        query = "select d.icd10_cd,d.icd10_description,count(d.pmi_no) from lhr_diagnosis d,pms_episode p where "
                + "d.hfc_cd = '"+hfc+"' "
                + "and d.discipline_cd = '"+patientType+"' "
                + "and cast(d.EPISODE_DATE as date)  BETWEEN '"+startDate + "' AND '" + endDate + "' and d.pmi_no = p.pmi_no and d.episode_date = p.episode_date group by (icd10_cd)";
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
