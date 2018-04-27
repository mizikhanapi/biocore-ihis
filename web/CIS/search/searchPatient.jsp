<%-- 
    Document   : searchPatient
    Created on : Feb 10, 2017, 5:48:50 PM
    Author     : -D-
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="Formatter.CheckDateFormat"%>

<%

    Conn conn = new Conn();
    CheckDateFormat cdf = new CheckDateFormat();
    String pmiNo = request.getParameter("pmiNo");
    String episodeDate = request.getParameter("episodeDate");
    String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
    //String pmiNo ="7805110451210";

    String bloodType = "";
    String sex = "";
    String IdType = "";
    int age = 0;
    String race = "";
    String allergy = "";
    String dob = "";
    String dataFull = "";
    String ageS = "", gambarPesakitoi = "";

    String patientCategory = "";

    boolean check;

    Calendar now = Calendar.getInstance();
    int year = now.get(Calendar.YEAR);
    int month = now.get(Calendar.MONTH);

    String sqlPatientCategory = "SELECT patient_category FROM PMS_PATIENT_QUEUE  WHERE pmi_no = '" + pmiNo + "'  AND episode_date = '" + episodeDate + "'";
    ArrayList<ArrayList<String>> dataPatientCategory = conn.getData(sqlPatientCategory);
    if (dataPatientCategory.size() > 0) {
        patientCategory = dataPatientCategory.get(0).get(0);
    }

    //Convert Code to Description 0         1           2           3       4        5        6         7           8                   9                   10
    String sqlPatient = "select pmi_no,patient_name,new_ic_no,blood_type,sex_code,id_type,birth_date,race_code,allergy_ind,IF(LENGTH(picture)>0,picture,''),"
            + " HOME_ADDRESS from pms_patient_biodata where pmi_no = '" + pmiNo + "'";
    ArrayList<ArrayList<String>> dataQueue = conn.getData(sqlPatient);

    String sqlFullPatient = "select * from emedica.pms_patient_biodata where pmi_no = '" + pmiNo + "'";
    ArrayList<ArrayList<String>> dataPatientFull = conn.getData(sqlFullPatient);

    String sqlAddressPatient = "select IFNULL(pms.home_address,''), IFNULL(tc.description,''), IFNULL(dc.description,''), IFNULL(sc.description,''), IFNULL(cc.description,'') "
            + " from pms_patient_biodata pms "
            + " LEFT JOIN adm_lookup_detail tc on pms.home_town_code = tc.detail_reference_code AND tc.master_reference_code = '0003' AND tc.hfc_cd = '" + hfc + "' "
            + " LEFT JOIN adm_lookup_detail dc on pms.home_district_code = dc.detail_reference_code AND dc.master_reference_code = '0078' AND dc.hfc_cd = '" + hfc + "' "
            + " LEFT JOIN adm_lookup_detail sc on pms.home_state_code = sc.detail_reference_code AND sc.master_reference_code = '0002' AND sc.hfc_cd = '" + hfc + "' "
            + " LEFT JOIN adm_lookup_detail cc on pms.home_country_code = cc.detail_reference_code AND cc.master_reference_code = '0001' AND cc.hfc_cd = '" + hfc + "' "
            + " where pmi_no = '" + pmiNo + "'";
    ArrayList<ArrayList<String>> dataPatientAddress = conn.getData(sqlAddressPatient);

    if ("-".equals(dataQueue.get(0).get(3))) {
        bloodType = "-";
    } else {
        String sqlGetBlood = "select* from adm_lookup_detail where master_reference_code = '0074' and detail_reference_code = '" + dataQueue.get(0).get(3) + "'";
        ArrayList<ArrayList<String>> dataBlood = conn.getData(sqlGetBlood);
        if (dataBlood.size() < 1) {
            bloodType = "-";
        } else {
            bloodType = dataBlood.get(0).get(2);
        }

    }

    if ("-".equals(dataQueue.get(0).get(4))) {
        sex = "-";
    } else {
        String sqlGetSexCd = "select* from adm_lookup_detail where master_reference_code = '0041' and detail_reference_code = '" + dataQueue.get(0).get(4) + "'";
        ArrayList<ArrayList<String>> dataSexCd = conn.getData(sqlGetSexCd);
        if (dataSexCd.size() < 1) {
            sex = "-";
        } else {
            sex = dataSexCd.get(0).get(2);
        }

    }

    if ("-".equals(dataQueue.get(0).get(5))) {
        IdType = "-";
    } else {
        String sqlGetIdType = "select* from adm_lookup_detail where master_reference_code = '0012' and detail_reference_code = '" + dataQueue.get(0).get(5) + "'";
        ArrayList<ArrayList<String>> dataIdType = conn.getData(sqlGetIdType);
        if (dataIdType.size() < 1) {
            IdType = "-";
        } else {
            IdType = dataIdType.get(0).get(2);
        }

    }

    if ("-".equals(dataQueue.get(0).get(7))) {
        race = "-";
    } else {
        String sqlGetRace = "select* from adm_lookup_detail where master_reference_code = '0004' and detail_reference_code = '" + dataQueue.get(0).get(7) + "'";
        ArrayList<ArrayList<String>> dataRace = conn.getData(sqlGetRace);
        if (dataRace.size() < 1) {
            race = "-";
        } else {
            race = dataRace.get(0).get(2);
        }

    }

    if ("-".equals(dataQueue.get(0).get(8))) {
        allergy = "-";
    } else {
        String sqlAllergy = "select* from adm_lookup_detail where master_reference_code = '0075' and detail_reference_code = '" + dataQueue.get(0).get(8) + "'";
        ArrayList<ArrayList<String>> dataAllergy = conn.getData(sqlAllergy);
        if (dataAllergy.size() < 1) {
            allergy = "-";
        } else {
            allergy = dataAllergy.get(0).get(2);
        }

    }

    for (int i = 0; i < dataPatientFull.get(0).size(); i++) {
        dataFull = dataFull + "#" + dataPatientFull.get(0).get(i);
    }

// Get Age from Date of Birth
    try {
        dob = dataQueue.get(0).get(6).toString();
    } catch (Exception e) {
        dob = "-";
    }

    if (dob.contains("/")) {
        check = cdf.isValidFormat("dd/MM/yyyy", dob);
        if (check) {
            String[] dobAr = StringUtils.split(dob, "/");
            int dobYear = Integer.parseInt(dobAr[2]);
            int dobMonth = Integer.parseInt(dobAr[1]);
            age = year - dobYear;
            ageS = Integer.toString(age);
        } else {
            ageS = "undefined";
        }
    } else if (dob.contains("-")) {
        check = cdf.isValidFormat("yyyy-MM-dd", dob);
        if (check) {
            String[] dobAr = StringUtils.split(dob, "-");
            int dobYear = Integer.parseInt(dobAr[0]);
            int dobMonth = Integer.parseInt(dobAr[1]);
            age = year - dobYear;
            ageS = Integer.toString(age);
        } else {
            ageS = "undefined";
        }
    }

    if (dataQueue.get(0).get(9).equalsIgnoreCase("") || dataQueue.get(0).get(9).equalsIgnoreCase("-") || dataQueue.get(0).get(9).isEmpty() || dataQueue.get(0).get(9).equalsIgnoreCase("null")) {
        gambarPesakitoi = "";
    } else {
        gambarPesakitoi = dataQueue.get(0).get(9);
    }

    String bDate = dataQueue.get(0).get(6);
    String splitDate[] = bDate.split("-");
    String updatedBDate = splitDate[2] + "/" + splitDate[1] + "/" + splitDate[0];

    String patientAddress = dataPatientAddress.get(0).get(0).toUpperCase() + "," + dataPatientAddress.get(0).get(1).toUpperCase() + "," + dataPatientAddress.get(0).get(2).toUpperCase()
            + "," + dataPatientAddress.get(0).get(3).toUpperCase() + "," + dataPatientAddress.get(0).get(4).toUpperCase();

//out.print(check);             0                               1                               2                           3              4            5             6            7              8                 9                   10                  11                      12                                  13
    String patientBio = dataQueue.get(0).get(0) + "|" + dataQueue.get(0).get(1) + "|" + dataQueue.get(0).get(2) + "|" + bloodType + "|" + sex + "|" + IdType + "|" + ageS + "|" + race + "|" + allergy + "|" + patientCategory + "|" + dataFull + "|" + gambarPesakitoi + "|" + patientAddress + "|" + updatedBDate;

    session.setAttribute("patientCategory", patientCategory);
    session.setAttribute("patientPMINo", dataQueue.get(0).get(0));
//session.setAttribute("patientPMINo","6303190161596");
    session.setAttribute("patientBio", patientBio);
    session.setAttribute("episodeDate", episodeDate);

    out.print(patientBio);


%>