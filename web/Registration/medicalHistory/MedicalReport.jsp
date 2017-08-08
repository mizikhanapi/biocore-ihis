
<%@page import="Config.Config"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.io.*"%> 
<%@page import="java.sql.Connection"%> 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="main.RMIConnector"%>
<%@page import="java.util.ArrayList"%>

<%
    RMIConnector rmic = new RMIConnector();
    Config.getBase_url(request);
    Config.getFile_url(session);

    Conn conn = new Conn();
    ArrayList<ArrayList<String>> medicalInfo = null;
    String pmiNo = request.getParameter("pmiNo").trim();
//             String pmiNo = "051347716";
    String HelathFacility = session.getAttribute("HFC_NAME").toString();
    String ic = "", name = "", bloodtype = "", diagnosis = "", medication = "", allerg = "", date = "", time;
    String Result = "";
    try {
        String quary = "SELECT distinct"
                + " pbd.`NEW_IC_NO` AS pms_patient_biodata_NEW_IC_NO,"
                + " pbd.`PATIENT_NAME` AS pms_patient_biodata_PATIENT_NAME,"
                + " icd_cd.`icd10_desc`  AS diagnosis_Diagnosis,"
                + " IFNULL(lhr_med.`product_name`, 'None') AS lhr_medication_product_name,"
                + " IFNULL(lhr_aller.`allergy_cd`, 'None') AS lhr_allergy_allergy_cd,"
                + " lhr_dia.`Episode_Date` AS lhr_diagnosis_Episode_Date,"
                + " IFNULL(adm_lookup_det.`Description`, 'No Record') AS Textuer_Blood_Type,"
                + " CASE WHEN pbd.`NEW_IC_NO`= '-' THEN 'No Record'"
                + "    ELSE  pbd.`NEW_IC_NO`  END AS pms_patient_biodata_NEW_IC_NO_new,"
                + " CASE WHEN pbd.`BLOOD_TYPE` = '-' THEN 'No Record'"
                + "       ELSE  pbd.`BLOOD_TYPE`  END AS pbd_BLOOD_TYPE_new"
                + "   FROM `pms_patient_biodata` pbd"
                + "   inner join lhr_diagnosis lhr_dia"
                + "    on pbd.`PMI_NO` = lhr_dia.`PMI_no`"
                + "    inner join icd10_codes icd_cd"
                + "    on lhr_dia.`Diagnosis_Cd` = icd_cd.`icd10_code` "
                + "    left join adm_lookup_detail adm_lookup_det"
                + "    on adm_lookup_det.`Detail_Reference_code` =  pbd.`BLOOD_TYPE`"
                + "    and adm_lookup_det.`hfc_cd` = lhr_dia.`hfc_cd`"
                + "   left join adm_lookup_master adm_lookup_mas"
                + "   on adm_lookup_det.`Master_Reference_code` = adm_lookup_mas.`Master_Reference_code`"
                + "   and adm_lookup_mas.`Master_Reference_code` like '0074'"
                + "    left join lhr_medication lhr_med"
                + "    on pbd.`PMI_NO` = lhr_med.pmi_no "
                + "    and lhr_dia.`Episode_Date` = lhr_med.`Episode_Date`"
                + "    left join lhr_allergy lhr_aller"
                + "    on pbd.`PMI_NO` =  lhr_aller.pmi_no"
                + " WHERE pbd.`PMI_NO` = '" + pmiNo + "' "
                + " AND IF(pbd.`BLOOD_TYPE` != '-',adm_lookup_det.`Master_Reference_code`, '0074')"
                + " LIKE '0074'  "
                + " ORDER BY lhr_dia.`Episode_Date` DESC"
                + " LIMIT 3;";
        Boolean SQL = false;
        medicalInfo = conn.getData(quary);
        SQL = rmic.setQuerySQL(conn.HOST, conn.PORT, quary);
//               out.print(" SQL "+SQL);

        if (SQL == true && !medicalInfo.isEmpty()) {

            ic = medicalInfo.get(0).get(0);
            name = medicalInfo.get(0).get(1);
            bloodtype = medicalInfo.get(0).get(6);
            diagnosis = medicalInfo.get(0).get(2);
            medication = medicalInfo.get(0).get(3);
            allerg = medicalInfo.get(0).get(4);
            date = medicalInfo.get(0).get(5);

//                Result = "|"+HelathFacility+"  "+"|"+ic +"|"+name +"|"+bloodtype +"|"+diagnosis+"|"+medication+"|"+allerg;              
            Result = "Success";
        } else {
            Result = "No Records";
        }

    } catch (Exception ex) {
//                out.print("Error: " + ex.getMessage());
    }

%>


<% for (int x = 0; x < medicalInfo.size(); x++) {
%>
<div>
    <h3 style="text-align: center"><strong><%=HelathFacility%></strong></h3>
    <p>IC NO: <strong><%=medicalInfo.get(x).get(0)%></strong></p>
    <p>NAME: <strong><%=medicalInfo.get(x).get(1)%></strong></p>
    <p>BLOOD TYPE: <strong><%=medicalInfo.get(x).get(6)%></strong></p>
    <p>DIAGNOSIS: <strong><%=medicalInfo.get(x).get(2)%></strong></p>
    <p>MEDICATION: <strong><%=medicalInfo.get(x).get(3)%></strong></p>
    <p>ALLERGY: <strong><%=medicalInfo.get(x).get(4)%></strong></p>
    <p>Date: <strong><%=medicalInfo.get(x).get(5)%></strong></p>
    <p style="display: none" id="checkReport"><%=Result%></p>
</div>
<%
    }
%>






