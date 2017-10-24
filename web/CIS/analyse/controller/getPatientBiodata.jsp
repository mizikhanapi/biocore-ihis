<%-- 
    Document   : getPatientBiodata
    Created on : Oct 23, 2017, 12:46:33 PM
    Author     : user
--%>

<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="Formatter.CheckDateFormat"%>
<%@page import="dBConn.Conn"%>
<%

    Conn conn = new Conn();
    CheckDateFormat cdf = new CheckDateFormat();
    String idType = request.getParameter("idType");
    String id = request.getParameter("id");
    //String pmiNo ="7805110451210";

    String bloodType = "";
    String sex = "";
    String IdType = "";
    int age = 0;
    String race = "";
    String allergy = "";
    String dob = "";
    String dataFull = "";
    String ageS = "";

    String patientCategory = "";

    boolean check;

    Calendar now = Calendar.getInstance();
    int year = now.get(Calendar.YEAR);
    
    String whereCondition="";
    
    //search based on ID Type
    if (idType.equals("001")) { //PMI No
        whereCondition=" where pmi_no='"+id+"' ";

    } else if (idType.equals("002")) { // IC No (New)
        whereCondition=" where new_ic_no='"+id+"' ";
        
    } else if (idType.equals("003")) { // IC No (Old)
        whereCondition=" where old_ic_no='"+id+"' ";
        
    }else { // Matric No, Staff no, ID no
       whereCondition=" where id_no='"+id+"' ";
       
    }
    
    //Convert Code to Description
    String sqlPatient = "select pmi_no,patient_name,new_ic_no,blood_type,sex_code,id_type,birth_date,race_code,allergy_ind from pms_patient_biodata "+whereCondition;
    ArrayList<ArrayList<String>> dataQueue = conn.getData(sqlPatient);
    
    if(dataQueue.size()>0){
        if (dataQueue.get(0).get(3).equals("-")) {
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

        if (dataQueue.get(0).get(4).equals("-")) {
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

        if (dataQueue.get(0).get(5).equals("-")) {
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

        if (dataQueue.get(0).get(7).equals("-")) {
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

        if (dataQueue.get(0).get(8).equals("-")) {
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


    // Get Age from Date of Birth
        dob = dataQueue.get(0).get(6).toString();
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
        }else if(dob.contains("-")){
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

    //out.print(check);
        String patientBio = dataQueue.get(0).get(0) + "|" + dataQueue.get(0).get(1) + "|" + dataQueue.get(0).get(2) + "|" + bloodType + "|" + sex + "|" + IdType + "|" + ageS + "|" + race + "|" + allergy + "|" + patientCategory + "|" + dataFull;

%>

<div class="center-block" style="margin: 10px;">
    <input type="hidden" id="ANL_hidden_patientBio" value="<%=patientBio%>">
    <div class="col-md-12">
        <h4 style="padding: 0px;">Patient Info</h4>
    </div>
    <div class="col-md-3">
        <address>
            <p>Name: <span class="p-label"><%=dataQueue.get(0).get(1)%></span></p>
            <p>IC/ID No: <span class="p-label"><%=dataQueue.get(0).get(2)%></span></p>
        </address>
    </div>
    <div class="col-md-3">
        <address>
            <p>gender: <span class="p-label"><%=sex%></span></p>
            <p>Age: <span class="p-label"><%= ageS%></span></p>
        </address>
    </div>
    <div class="col-md-3">
        <address>
            <p>ID Type: <span class="p-label"><%=IdType%></span></p>
            <p>Race: <span class="p-label"><%=race%></span></p>
        </address>
    </div>
    <div class="col-md-3">
        <address>
            <p>Blood Type: <span class="p-label"><%=bloodType%></span></p>
            <p>Allergy: <span class="p-label"><%=allergy%></span></p>
        </address>
    </div>
</div>
    
<%        
    }//end if no patient
else{
    out.print("0");
}
  
%>    