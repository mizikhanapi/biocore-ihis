<%-- 
    Document   : managePastCompleteOrderGetPatient
    Created on : Feb 1, 2018, 6:55:13 PM
    Author     : Shammugam
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="ADM_helper.MySessionKey"%>
<%
    String hfc_cd = (String) session.getAttribute(MySessionKey.HFC_CD);
    String pmiNo = request.getParameter("pmiNo");

    Conn con = new Conn();
    String query = "SELECT bio.`NEW_IC_NO`, sex.`Description`, blood.`Description`, rhesus.`Description`, date_format(bio.`BIRTH_DATE`, '%d/%m/%Y') "
            + "FROM pms_patient_biodata bio "
            + "LEFT JOIN adm_lookup_detail sex ON sex.`Detail_Reference_code`=bio.`SEX_CODE` AND sex.`Master_Reference_code`='0041' "
            + "LEFT JOIN adm_lookup_detail blood ON blood.`Detail_Reference_code`=bio.`BLOOD_TYPE` AND blood.`Master_Reference_code`='0074' AND blood.hfc_cd=sex.hfc_cd "
            + "LEFT JOIN adm_lookup_detail rhesus ON rhesus.`Detail_Reference_code`=bio.`BLOOD_RHESUS_CODE` AND rhesus.`Master_Reference_code`='0017' AND rhesus.hfc_cd=sex.hfc_cd "
            + "WHERE bio.`PMI_NO`='" + pmiNo + "' AND sex.hfc_cd='" + hfc_cd + "';";

    ArrayList<ArrayList<String>> dataPat = con.getData(query);
    JSONObject json = new JSONObject();
    json.put("valid", false);
    if (dataPat.size() > 0) {
        json.put("valid", true);
        json.put("IC", dataPat.get(0).get(0));
        json.put("sex", dataPat.get(0).get(1));
        json.put("blood", dataPat.get(0).get(2));
        json.put("rhesus", dataPat.get(0).get(3));
        json.put("dob", dataPat.get(0).get(4));

    }

    out.print(json.toString());
%>