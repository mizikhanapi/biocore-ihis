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

    //                                  0                       1                       2                           3                                   4                       5                       
    String searchProblem = "SELECT opt_order_master.pmi_no,opt_order_master.order_no,opt_order_master.hfc_cd,opt_order_master.episode_date,opt_order_master.encounter_date,opt_order_master.encounter_date,"
            //  6                                           7                       8                           9                   10                                  11                  12                      
            + "'opt_order_master.doctor_id',opt_order_master.hfc_from,opt_order_master.hfc_to,opt_order_master.order_status,'opt_order_master.order_priority','opt_order_master.created_by','opt_order_master.created_date',"
            //  13                                          14                              15                                  16                          17
            + "pms_patient_biodata.PATIENT_NAME,pms_patient_biodata.NEW_IC_NO,pms_patient_biodata.BIRTH_DATE,pms_patient_biodata.SEX_CODE,pms_patient_biodata.BLOOD_TYPE, "
            //  18                  19              20              21
            + "sx.description, blot.description, hfc.hfc_name "//, au.user_name "
            + "FROM opt_order_master "
            + "LEFT JOIN pms_patient_biodata ON (opt_order_master.pmi_no = pms_patient_biodata.PMI_NO) "
            + "LEFT JOIN adm_lookup_detail sx on pms_patient_biodata.SEX_CODE = sx.detail_reference_code AND sx.master_reference_code = '0041' AND sx.hfc_cd = opt_order_master.hfc_cd "
            + "LEFT JOIN adm_lookup_detail blot on pms_patient_biodata.BLOOD_TYPE = blot.detail_reference_code AND blot.master_reference_code = '0074' AND blot.hfc_cd = opt_order_master.hfc_cd "
            + "Left JOIN adm_health_facility hfc on hfc.hfc_cd = opt_order_master.hfc_cd "
            //+ "LEFT JOIN adm_users au on au.user_id = opt_order_master.doctor_id "
            + "WHERE opt_order_master.order_no in (select distinct(order_no) from opt_order_detail ) AND opt_order_master.order_status = '0' "
            + " AND date(opt_order_master.encounter_date) = date(now()) AND opt_order_master.hfc_cd = '" + hfcCD + "'"
            + " order by opt_order_master.encounter_date DESC;";

    ArrayList<ArrayList<String>> customerData = conn.getData(searchProblem);

    if (customerData.size() > 0) {
        out.print("Got");
    } else {
        out.print("No");
    }

%>