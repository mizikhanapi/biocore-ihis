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

    //                        0          1            2           3            4            5                   6               7
    String searchProblem = "SELECT lom.pmi_no,lom.order_no,lom.txn_date,lom.hfc_cd,lom.txn_type,lom.episode_date,lom.encounter_date,lom.order_date,  "
            //        8                  9                         10                              11               12
            + " lom.order_by,lom.order_from_discipline,lom.order_from_subdiscipline,lom.order_to_discipline,lom.order_to_subdiscipline, "
            //        3           14           15              16               17                  18                      19
            + " lom.hfc_from,lom.hfc_to,lom.order_status,pms.PATIENT_NAME,pms.NEW_IC_NO,IFNULL(pms.BIRTH_DATE,'-'),IFNULL(pms.SEX_CODE,'-'), "
            //          20                          21                          22                  23          24
            + " IFNULL(pms.BLOOD_TYPE,'-'),IFNULL(s.description,'-'),IFNULL(b.description,'-'),adm.hfc_name,aus.USER_NAME  "
            // FROM ORDER TABLE
            + " FROM lis_order_master lom  "
            // LEFT JOIN USER TABLE
            + " LEFT JOIN pms_patient_biodata pms ON (lom.pmi_no = pms.PMI_NO)"
            // LEFT JOIN USER TABLE
            + " LEFT JOIN adm_users aus ON (lom.order_by = aus.USER_ID) "
            // LEFT JOIN HFC TABLE
            + " LEFT JOIN adm_health_facility adm ON (lom.hfc_to = adm.hfc_cd) "
            // LEFT LOOKUP SEX TABLE
            + " LEFT JOIN adm_lookup_detail s ON pms.SEX_CODE = s.detail_reference_code "
            + " AND s.master_reference_code = '0041' AND s.hfc_cd = lom.hfc_to "
            // LEFT LOOKUP BLOOD TABLE
            + " LEFT JOIN adm_lookup_detail b ON pms.BLOOD_TYPE = b.detail_reference_code "
            + " AND b.master_reference_code = '0074' AND b.hfc_cd = lom.hfc_to "
            // WHERE CONDITION
            + " WHERE lom.order_status = '0' AND date(lom.txn_date) = date(now()) AND lom.hfc_to = '" + hfcCD + "' ;";

    ArrayList<ArrayList<String>> customerData = conn.getData(searchProblem);

    if (customerData.size() > 0) {
        out.print("Got");
    } else {
        out.print("No");
    }

%>