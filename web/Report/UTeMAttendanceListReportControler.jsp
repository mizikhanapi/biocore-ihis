
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

    patientType = request.getParameter("patientType");
    startDate = request.getParameter("startDate");
    endDate = request.getParameter("endDate");
    hfc = request.getParameter("hfc");
     if (patientType.equalsIgnoreCase("all")){
     
     query = "Select  e.NEW_IC_NO, b.`PATIENT_NAME`,"
            +" b.SEX_CODE ,IFNULL(adm_lookup_det.`Description`, 'No Record') AS Patient_Gender ,"
            +" e.DOCTOR, adm_users.`USER_NAME`, DATE_FORMAT(e.EPISODE_DATE,'%d/%m/%Y %H:%i:%s'),d.icd10_description,ty.description,IF(STRCMP(ssi.person_type,1) = 0, 'Student', 'Staff') "
            +" FROM pms_episode e INNER JOIN pms_patient_biodata b"
            +" ON e.`PMI_NO` = b.`PMI_NO`"
            
            +" INNER join adm_lookup_detail adm_lookup_det"
            +" ON adm_lookup_det.`Detail_Reference_code` =  b.SEX_CODE"
            +" AND adm_lookup_det.`hfc_cd` = e.`HEALTH_FACILITY_CODE`"
            +" AND adm_lookup_det.`Master_Reference_code` like '0041'"
            
            +" INNER join adm_users adm_users"
            +" ON e.`HEALTH_FACILITY_CODE` = adm_users.`HEALTH_FACILITY_CODE`"
            +" AND adm_users.`USER_ID` =  e.`DOCTOR`"
             
            +" INNER join lhr_diagnosis d "
             + "ON d.pmi_no = e.pmi_no "
             + "and d.episode_date = e.episode_date"
             + " and d.hfc_cd = e.HEALTH_FACILITY_CODE"
             
             +" INNER join special_integration_information ssi "
             + "ON ssi.person_id_no = b.id_no " 
                          
             +" INNER join adm_lookup_detail ty "
             + "ON ty.detail_reference_code = e.patient_category_code "
             + "and ty.master_reference_code = '0033'"
             + " and ty.hfc_cd = e.HEALTH_FACILITY_CODE"
            
            + " WHERE cast(e.EPISODE_DATE as date)  BETWEEN '"+startDate + "' AND '" + endDate + "'"
            + " AND e.`HEALTH_FACILITY_CODE`='"+hfc+"' ;";
     
     } else if (patientType.equals("002")){
         
      query = "Select  we.NEW_IC_NO, b.`PATIENT_NAME`,"
            +" b.SEX_CODE ,IFNULL(adm_lookup_det.`Description`, 'No Record') AS Patient_Gender ,"
            +" we.order_by, DATE_FORMAT(we.EPISODE_DATE,'%d/%m/%Y %H:%i:%s'), DATE_FORMAT(e.EPISODE_DATE,'%d/%m/%Y %H:%i:%s'),d.icd10_description,ty.description,IF(STRCMP(ssi.person_type,1) = 0, 'Student', 'Staff') "
            +" FROM wis_inpatient_episode we INNER JOIN pms_patient_biodata b"
            +" ON we.`PMI_NO` = b.`PMI_NO` "
            
            +" INNER join adm_lookup_detail adm_lookup_det"
            +" on adm_lookup_det.`Detail_Reference_code` =  b.SEX_CODE"
            +" and adm_lookup_det.`hfc_cd` = we.hfc_cd"
            +" AND adm_lookup_det.`Master_Reference_code` like '0041'"
             
            +" INNER join lhr_diagnosis d "
             + "ON d.pmi_no = e.pmi_no "
             + "and d.episode_date = we.episode_date"
             + " and d.hfc_cd = we.HEALTH_FACILITY_CODE"
             
             +" INNER join special_integration_information ssi "
             + "ON ssi.person_id_no = b.id_no " 
              
              +" INNER join adm_lookup_detail ty "
             + "ON ty.detail_reference_code = e.patient_category_code "
             + "and ty.master_reference_code = '0033'"
             + " and ty.hfc_cd = e.HEALTH_FACILITY_CODE"
              
            + " WHERE cast(we.EPISODE_DATE as date) BETWEEN '"+startDate + "' AND '" + endDate + "' "
            + " AND we.hfc_cd='"+hfc+"' ;";
     }else{
         query = "Select  e.NEW_IC_NO, b.`PATIENT_NAME`,"
            +" b.SEX_CODE ,IFNULL(adm_lookup_det.`Description`, 'No Record') AS Patient_Gender ,"
            +" e.DOCTOR, adm_users.`USER_NAME`, DATE_FORMAT(e.EPISODE_DATE,'%d/%m/%Y %H:%i:%s'),d.icd10_description,ty.description,IF(STRCMP(ssi.person_type,1) = 0, 'Student', 'Staff') "
            +" FROM pms_episode e INNER JOIN pms_patient_biodata b "
            +" ON e.`PMI_NO` = b.`PMI_NO` and e.discipline_code = '"+patientType+"'"
            
            +" INNER join adm_lookup_detail adm_lookup_det"
            +" ON adm_lookup_det.`Detail_Reference_code` =  b.SEX_CODE"
            +" AND adm_lookup_det.`hfc_cd` = e.`HEALTH_FACILITY_CODE`"
            +" AND adm_lookup_det.`Master_Reference_code` like '0041'"
            
            +" INNER join adm_users adm_users"
            +" ON e.`HEALTH_FACILITY_CODE` = adm_users.`HEALTH_FACILITY_CODE`"
            +" AND adm_users.`USER_ID` =  e.`DOCTOR`"
             
            +" INNER join lhr_diagnosis d "
             + "ON d.pmi_no = e.pmi_no "
             + "and d.episode_date = e.episode_date"
             + " and d.hfc_cd = e.HEALTH_FACILITY_CODE "
                 + "and d.discipline_cd = e.discipline_code"
             
             +" INNER join special_integration_information ssi "
             + "ON ssi.person_id_no = b.id_no " 
                          
             +" INNER join adm_lookup_detail ty "
             + "ON ty.detail_reference_code = e.patient_category_code "
             + "and ty.master_reference_code = '0033'"
             + " and ty.hfc_cd = e.HEALTH_FACILITY_CODE"
            
            + " WHERE cast(e.EPISODE_DATE as date)  BETWEEN '"+startDate + "' AND '" + endDate + "'"
            + " AND e.`HEALTH_FACILITY_CODE`='"+hfc+"' ;";
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
        //out.print(query);
        out.print("No Data");
    }

%>