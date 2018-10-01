<%-- 
    Document   : UTeMMedicalCertificateReportController
    Created on : Jul 25, 2017, 9:41:59 AM
    Author     : user
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>

<%
    Config.getBase_url(request);
    Config.getFile_url(session);
    
    Conn conn = new Conn();
    String startDate, endDate, hfc, query = "";

    startDate = request.getParameter("startDate").toString();
    endDate = request.getParameter("endDate").toString();
    hfc = request.getParameter("hfc").toString();
    String dis = request.getParameter("dis");
    String discipline ="";
//    startDate = "2017-08-01";
//    endDate = "2017-08-28";
//    hfc = "04010101";

    if (!startDate.equals("") && !endDate.equals("") && !hfc.equals("")) {
        if(dis.equalsIgnoreCase("all")){
            query = "Select distinct b.`NEW_IC_NO`, b.`PATIENT_NAME`, b.SEX_CODE ,"
                + " adm_lookup_det.`Description` AS Gender_name,"
                + " ml.start_date,ml.end_date,ml.centre_code,"
                + " b.`NATIONALITY`, adm_lookup_det1.`Description` AS Nationality_name,"
                + " s.symptom_name, ml.doctor_name, DATE_FORMAT(ml.EPISODE_DATE,'%d/%m/%Y %H:%i:%s') "
                + " FROM lhr_med_leave ml INNER JOIN lhr_signs s"
                + " ON ml.`PMI_NO` = s.pmi_no"
                + " AND ml.episode_date = s.episode_date"
                + " AND ml.hfc_cd = s.hfc_cd"
                + " AND ml.discipline_cd = s.discipline_cd"
                + " INNER JOIN pms_patient_biodata b"
                + " ON b.`PMI_NO` = ml.`PMI_NO`"
                + " INNER join adm_lookup_detail adm_lookup_det "
                + " ON adm_lookup_det.`Detail_Reference_code` = b.SEX_CODE "
                + " AND adm_lookup_det.`hfc_cd` = ml.`hfc_cd` "
                + " AND adm_lookup_det.`Master_Reference_code` like '0041' "
                + " INNER join adm_lookup_detail adm_lookup_det1 "
                + " ON adm_lookup_det1.`Detail_Reference_code` = b.`NATIONALITY` "
                + " AND adm_lookup_det1.`hfc_cd` = ml.`hfc_cd` "
                + " AND adm_lookup_det1.`Master_Reference_code` like '0011' "
                + " WHERE cast(ml.EPISODE_DATE as date) BETWEEN '" + startDate + "' AND '" + endDate + "'"
                + " AND s.hfc_cd = '" + hfc + "'";
        }else{
            query = "Select distinct b.`NEW_IC_NO`, b.`PATIENT_NAME`, b.SEX_CODE ,"
                + " adm_lookup_det.`Description` AS Gender_name,"
                + " ml.start_date,ml.end_date,ml.centre_code,"
                + " b.`NATIONALITY`, adm_lookup_det1.`Description` AS Nationality_name,"
                + " s.symptom_name, ml.doctor_name, DATE_FORMAT(ml.EPISODE_DATE,'%d/%m/%Y %H:%i:%s') "
                + " FROM lhr_med_leave ml INNER JOIN lhr_signs s"
                + " ON ml.`PMI_NO` = s.pmi_no"
                + " AND ml.episode_date = s.episode_date"
                + " AND ml.hfc_cd = s.hfc_cd"
                + " AND ml.discipline_cd = s.discipline_cd"
                + " INNER JOIN pms_patient_biodata b"
                + " ON b.`PMI_NO` = ml.`PMI_NO`"
                + " INNER join adm_lookup_detail adm_lookup_det "
                + " ON adm_lookup_det.`Detail_Reference_code` = b.SEX_CODE "
                + " AND adm_lookup_det.`hfc_cd` = ml.`hfc_cd` "
                + " AND adm_lookup_det.`Master_Reference_code` like '0041' "
                + " INNER join adm_lookup_detail adm_lookup_det1 "
                + " ON adm_lookup_det1.`Detail_Reference_code` = b.`NATIONALITY` "
                + " AND adm_lookup_det1.`hfc_cd` = ml.`hfc_cd` "
                + " AND adm_lookup_det1.`Master_Reference_code` like '0011' "
                + " WHERE cast(ml.EPISODE_DATE as date) BETWEEN '" + startDate + "' AND '" + endDate + "'"
                + " AND s.hfc_cd = '" + hfc + "' and ml.discipline_cd = '"+dis+"'";
        }
        
        if(!dis.equalsIgnoreCase("all")){
         String dis_name_query = "SELECT discipline_cd, discipline_name FROM adm_discipline WHERE discipline_hfc_cd='" + hfc + "' and discipline_cd = '"+dis+"'";
                    ArrayList<ArrayList<String>> mysqldis_name = conn.getData(dis_name_query);
                    discipline = mysqldis_name.get(0).get(1);
     }else{
         discipline = "ALL";
     }
//    out.print("Replay : " + hfc + " - " + startDate + " - " + endDate + " + " + query +"<br>");
        ArrayList<ArrayList<String>> medicalCertificateInfo = conn.getData(query);

        if (medicalCertificateInfo.size() > 0) {
            for (int i = 0; i < medicalCertificateInfo.size(); i++) {
                ArrayList<String> medicalInforow = medicalCertificateInfo.get(i);
                String slitedDatarow = StringUtils.join(medicalInforow, "|");
                out.print(slitedDatarow);
                if (i < medicalCertificateInfo.size() - 1) {
                    out.print("^");
                }
            }
        } else {
                
            out.print("No Data");
        }

    } else {
        out.print("UnCorrect Massage");
    }

%>