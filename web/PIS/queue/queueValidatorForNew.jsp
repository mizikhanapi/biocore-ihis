<%-- 
    Document   : queueValidatorForNew
    Created on : Oct 27, 2018, 9:18:01 AM
    Author     : Shammugam
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    Conn conn = new Conn();

    String hfcCD = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    String disCD = session.getAttribute("DISCIPLINE_CODE").toString();

    //                              1                           2                           3                                   4                        
    String searchProblem = "SELECT pis_order_master.ORDER_NO, pis_order_master.PMI_NO, pis_order_master.HEALTH_FACILITY_CODE, pis_order_master.EPISODE_DATE, "
            //                  5                               6                           7                       8                           9
            + " pis_order_master.ENCOUNTER_DATE, pis_order_master.ORDER_DATE, pis_order_master.ORDER_BY, pis_order_master.ORDER_FROM, pis_order_master.ORDER_TO, "
            //              10                      11                      12                      13                              14                      
            + " pis_order_master.HFC_FROM, pis_order_master.HFC_TO, pis_order_master.SPUB_NO, pis_order_master.KEYIN_BY, pis_order_master.TOTAL_ORDER, "
            //              15                          16                          17                              18
            + " pis_order_master.STATUS, pms_patient_biodata.PATIENT_NAME, pms_patient_biodata.NEW_IC_NO, IFNULL(pms_patient_biodata.BIRTH_DATE,'-'), "
            //                  19                                      20                                          21                        22
            + " IFNULL(pms_patient_biodata.SEX_CODE,'-'), IFNULL(pms_patient_biodata.BLOOD_TYPE,'-'), pis_order_master.ORDER_STATUS, IFNULL(s.description,'-'), "
            //              23                  24             25
            + " IFNULL(b.description,'-'), adm.hfc_name, aus.USER_NAME "
            // JOIN PIS ORDER MASTER SQL
            + " FROM pis_order_master "
            // LEFT JOIN PMS PATIENT BIODATA SQL
            + " LEFT JOIN pms_patient_biodata ON (pis_order_master.PMI_NO = pms_patient_biodata.PMI_NO) "
            // LEFT JOIN ADM USERS SQL
            + " LEFT JOIN adm_users aus ON (pis_order_master.ORDER_BY = aus.USER_ID) "
            // LEFT JOIN ADM HFC SQL
            + " LEFT JOIN adm_health_facility adm ON (pis_order_master.HEALTH_FACILITY_CODE = adm.hfc_cd) "
            // LEFT JOIN ADM LOOKUP SEX SQL
            + " LEFT JOIN adm_lookup_detail s on pms_patient_biodata.SEX_CODE = s.detail_reference_code AND s.master_reference_code = '0041' AND s.hfc_cd = pis_order_master.HEALTH_FACILITY_CODE "
            // LEFT JOIN ADM LOOKUP BLOOD SQL
            + " LEFT JOIN adm_lookup_detail b on pms_patient_biodata.BLOOD_TYPE = b.detail_reference_code AND b.master_reference_code = '0074' AND b.hfc_cd = pis_order_master.HEALTH_FACILITY_CODE "
            // WHERE CONDITION
            + " WHERE pis_order_master.ORDER_STATUS = '0' AND date(pis_order_master.ORDER_DATE) = date(now())"
            + " AND pis_order_master.HEALTH_FACILITY_CODE = '" + hfcCD + "' AND pis_order_master.DISCIPLINE_CODE = '" + disCD + "' ;";

    ArrayList<ArrayList<String>> customerData = conn.getData(searchProblem);

    if (customerData.size() > 0) {
        out.print("Got");
    } else {
        out.print("No");
    }

%>