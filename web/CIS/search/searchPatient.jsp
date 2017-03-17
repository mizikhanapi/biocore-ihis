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
    //String pmiNo ="7805110451210";
   
    
    String bloodType = "";
    String sex = "";
    String IdType = "";
    int age = 0;
    String race = "";
    String allergy = "";
    String dob="";
    String dataFull = "";
    String ageS = "";
    
    boolean check;
    
Calendar now = Calendar.getInstance(); 
int year = now.get(Calendar.YEAR);  
int month = now.get(Calendar.MONTH);
    

    
    //Convert Code to Description
String sqlPatient = "select pmi_no,patient_name,new_ic_no,blood_type,sex_code,id_type,birth_date,race_code,allergy_ind from pms_patient_biodata where pmi_no = '"+pmiNo+"'";
ArrayList<ArrayList<String>> dataQueue = conn.getData(sqlPatient);

String sqlFullPatient = "select * from emedica.pms_patient_biodata where pmi_no = '"+pmiNo+"'";
ArrayList<ArrayList<String>> dataPatientFull = conn.getData(sqlFullPatient);

if(dataQueue.get(0).get(3).equals("-")){
    bloodType = "-";
} else{
    String sqlGetBlood = "select* from adm_lookup_detail where master_reference_code = '0074' and detail_reference_code = '" + dataQueue.get(0).get(3) + "'";
        ArrayList<ArrayList<String>> dataBlood = conn.getData(sqlGetBlood);
        if(dataBlood.size() <1){
              bloodType = "-";
        }else{
             bloodType = dataBlood.get(0).get(2);
        }
   
}

if(dataQueue.get(0).get(4).equals("-")){
    sex = "-";
} else{
    String sqlGetSexCd = "select* from adm_lookup_detail where master_reference_code = '0041' and detail_reference_code = '" + dataQueue.get(0).get(4) + "'";
        ArrayList<ArrayList<String>> dataSexCd = conn.getData(sqlGetSexCd);
        if(dataSexCd.size() <1){
            sex = "-";
        }else{
            sex = dataSexCd.get(0).get(2);
        }
    
}

if(dataQueue.get(0).get(5).equals("-")){
    IdType = "-";
} else{
    String sqlGetIdType = "select* from adm_lookup_detail where master_reference_code = '0012' and detail_reference_code = '" + dataQueue.get(0).get(5) + "'";
        ArrayList<ArrayList<String>> dataIdType = conn.getData(sqlGetIdType);
        if(dataIdType.size() <1){
            IdType = "-";
        }else{
             IdType = dataIdType.get(0).get(2);
        }
   
}

if(dataQueue.get(0).get(7).equals("-")){
    race = "-";
} else{
    String sqlGetRace = "select* from adm_lookup_detail where master_reference_code = '0004' and detail_reference_code = '" + dataQueue.get(0).get(7) + "'";
        ArrayList<ArrayList<String>> dataRace = conn.getData(sqlGetRace);
        if(dataRace.size() <1){
             race = "-";
        }else{
             race = dataRace.get(0).get(2);
        }
   
}

if(dataQueue.get(0).get(8).equals("-")){
    allergy = "-";
} else{
    String sqlAllergy = "select* from adm_lookup_detail where master_reference_code = '0075' and detail_reference_code = '" + dataQueue.get(0).get(8) + "'";
        ArrayList<ArrayList<String>> dataAllergy = conn.getData(sqlAllergy);
        if(dataAllergy.size() <1){
            allergy = "-";
        }else{
             allergy = dataAllergy.get(0).get(2);
        }
   
}


for(int i=0; i<dataPatientFull.get(0).size(); i++ ){
    dataFull = dataFull+"#"+dataPatientFull.get(0).get(i);
}

// Get Age from Date of Birth

dob = dataQueue.get(0).get(6).toString();

check = cdf.isValidFormat("dd/MM/yyyy", dob);
if(check){
        String[] dobAr = StringUtils.split(dob, "/");
        int dobYear = Integer.parseInt(dobAr[2]);
        int dobMonth = Integer.parseInt(dobAr[1]);
       age = year - dobYear;
       ageS = Integer.toString(age);
}else{
        ageS="undefined";
}

//out.print(check);

String patientBio = dataQueue.get(0).get(0) + "|"+dataQueue.get(0).get(1)+"|"+dataQueue.get(0).get(2)+"|"+bloodType+"|"+sex+"|"+IdType+"|"+ageS+"|"+race+"|"+allergy+"|"+dataFull;

session.setAttribute("patientPMINo",dataQueue.get(0).get(0));
//session.setAttribute("patientPMINo","6303190161596");
session.setAttribute("patientBio", patientBio);
session.setAttribute("episodeDate", episodeDate);


out.print(patientBio);


%>