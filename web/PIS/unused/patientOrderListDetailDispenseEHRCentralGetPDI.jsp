<%-- 
    Document   : patientOrderListDetailDispenseEHRCentralGetPDI
    Created on : Apr 14, 2017, 9:26:48 PM
    Author     : Shammugam
--%>

<%@page import="main.RMIConnector"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>

<%

    Conn conn = new Conn();
    String pmiNo = request.getParameter("pmiNo");

    String PDI = "";

    String sqlPatient = "SELECT PMI_NO,PATIENT_NAME,OLD_IC_NO,NEW_IC_NO,ID_TYPE,ID_NO,SEX_CODE,BIRTH_DATE,RACE_CODE,MARITAL_STATUS_CODE,"
            + "RELIGION_CODE,NATIONALITY,HOME_ADDRESS,POSTAL_TOWN_CODE,POSTAL_DISTRICT_CODE,POSTAL_STATE_CODE,POSTAL_COUNTRY_CODE,"
            + "POSTAL_POSTCODE,HOME_PHONE,MOBILE_PHONE,EMAIL_ADDRESS FROM pms_patient_biodata WHERE pmi_no = '" + pmiNo + "'";
    ArrayList<ArrayList<String>> dataPDI = conn.getData(sqlPatient);

    PDI = "PDI|";
    
    String PDI_DATA = "";
    
    int size = dataPDI.size();
    for (int i = 0; i < size; i++) {
        PDI_DATA = String.join("|", dataPDI.get(i));
    }

    out.print(PDI + PDI_DATA + "<cr>");

%>
