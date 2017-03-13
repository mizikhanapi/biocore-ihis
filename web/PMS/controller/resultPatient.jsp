<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="dBConn.Conn"%>
<%@page import="Config.Config"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%
    String idType = request.getParameter("idType");
    String idInput = request.getParameter("idInput");
    Config.getBase_url(request);
    Config.getFile_url(session);
    Conn conn = new Conn();

    //String systemParam = "select * from system_param";
    //ArrayList<ArrayList<String>> systemParams = connect.getData(systemParam);
    //String status = systemParams.get(0).get(2);
    //if status = 1,select from table pms_patient_biodata and special_intergration_information
    // status 0 = public
    // status 1 = universiti
    // status bole dapat kat session
    String status = session.getAttribute("SYSTEMSTAT").toString();
    String searchPatient = "";

    if (status.equals("1")) {

        if (idType.equals("pmino")) {
            searchPatient = "select a.pmi_no,a.pmi_no_temp,a.patient_name,a.title_code,a.new_ic_no,a.old_ic_no,a.id_type,a.id_no,a.eligibility_category_code,a.eligibility_type_code,"
                    + "a.birth_date,a.sex_code,a.marital_status_code,a.race_code,a.nationality,a.religion_code,a.blood_type,"
                    + "a.blood_rhesus_code,"
                    + "a.allergy_ind,"
                    + "a.chronic_disease_ind,a.organ_donor_ind,a.home_address,a.home_district_code,a.home_town_code,a.home_postcode,a.home_state_code,a.home_country_code,a.home_phone,"
                    + "a.postal_address,a.postal_district_code,a.postal_town_code,a.postal_postcode,a.postal_state_code,a.postal_country_code,a.mobile_phone,a.email_address,"
                    + "b.description,c.description,d.description,e.description,f.description,g.description,h.description,i.description,j.description,k.description,l.description,m.description"
+ " from pms_patient_biodata a"
+ " left join adm_lookup_detail b on b.detail_reference_code=a.home_district_code and b.master_reference_code='0078'"
+ " left join adm_lookup_detail c on c.detail_reference_code=a.home_town_code and c.master_reference_code='0003'"
+ " left join adm_lookup_detail d on d.detail_reference_code=a.home_postcode and d.master_reference_code='0079'"
+ " left join adm_lookup_detail e on e.detail_reference_code=a.home_state_code and e.master_reference_code='0002'"
+ " left join adm_lookup_detail f on f.detail_reference_code=a.home_country_code and f.master_reference_code='0001'"
+ " left join adm_lookup_detail g on g.detail_reference_code=a.postal_district_code and g.master_reference_code='0078'"
+ " left join adm_lookup_detail h on h.detail_reference_code=a.postal_town_code and h.master_reference_code='0003'"
+ " left join adm_lookup_detail i on i.detail_reference_code=a.postal_postcode and i.master_reference_code='0079'"
+ " left join adm_lookup_detail j on j.detail_reference_code=a.postal_state_code and j.master_reference_code='0002'"
+ " left join adm_lookup_detail k on k.detail_reference_code=a.postal_country_code and k.master_reference_code='0001'"
+ " left join adm_lookup_detail l on l.detail_reference_code=a.title_code and l.master_reference_code='0026'"
+ " left join adm_lookup_detail m on m.detail_reference_code=a.nationality and m.master_reference_code='0011'"
+ " where a.PMI_NO='" + idInput + "'";
        } else if (idType.equals("icnew")) {
            searchPatient = "select a.pmi_no,a.pmi_no_temp,a.patient_name,a.title_code,a.new_ic_no,a.old_ic_no,a.id_type,a.id_no,a.eligibility_category_code,a.eligibility_type_code,"
                    + "a.birth_date,a.sex_code,a.marital_status_code,a.race_code,a.nationality,a.religion_code,a.blood_type,"
                    + "a.blood_rhesus_code,"
                    + "a.allergy_ind,"
                    + "a.chronic_disease_ind,a.organ_donor_ind,a.home_address,a.home_district_code,a.home_town_code,a.home_postcode,a.home_state_code,a.home_country_code,a.home_phone,"
                    + "a.postal_address,a.postal_district_code,a.postal_town_code,a.postal_postcode,a.postal_state_code,a.postal_country_code,a.mobile_phone,a.email_address,"
                    + "b.description,c.description,d.description,e.description,f.description,g.description,h.description,i.description,j.description,k.description,l.description,m.description"
+ " from pms_patient_biodata a"
+ " left join adm_lookup_detail b on b.detail_reference_code=a.home_district_code and b.master_reference_code='0078'"
+ " left join adm_lookup_detail c on c.detail_reference_code=a.home_town_code and c.master_reference_code='0003'"
+ " left join adm_lookup_detail d on d.detail_reference_code=a.home_postcode and d.master_reference_code='0079'"
+ " left join adm_lookup_detail e on e.detail_reference_code=a.home_state_code and e.master_reference_code='0002'"
+ " left join adm_lookup_detail f on f.detail_reference_code=a.home_country_code and f.master_reference_code='0001'"
+ " left join adm_lookup_detail g on g.detail_reference_code=a.postal_district_code and g.master_reference_code='0078'"
+ " left join adm_lookup_detail h on h.detail_reference_code=a.postal_town_code and h.master_reference_code='0003'"
+ " left join adm_lookup_detail i on i.detail_reference_code=a.postal_postcode and i.master_reference_code='0079'"
+ " left join adm_lookup_detail j on j.detail_reference_code=a.postal_state_code and j.master_reference_code='0002'"
+ " left join adm_lookup_detail k on k.detail_reference_code=a.postal_country_code and k.master_reference_code='0001'"
+ " left join adm_lookup_detail l on l.detail_reference_code=a.title_code and l.master_reference_code='0026'"
+ " left join adm_lookup_detail m on m.detail_reference_code=a.nationality and m.master_reference_code='0011'"
+ " where a.NEW_IC_NO='" + idInput + "'";
            
        } else if (idType.equals("icold")) {
            searchPatient = "select a.pmi_no,a.pmi_no_temp,a.patient_name,a.title_code,a.new_ic_no,a.old_ic_no,a.id_type,a.id_no,a.eligibility_category_code,a.eligibility_type_code,"
                    + "a.birth_date,a.sex_code,a.marital_status_code,a.race_code,a.nationality,a.religion_code,a.blood_type,"
                    + "a.blood_rhesus_code,"
                    + "a.allergy_ind,"
                    + "a.chronic_disease_ind,a.organ_donor_ind,a.home_address,a.home_district_code,a.home_town_code,a.home_postcode,a.home_state_code,a.home_country_code,a.home_phone,"
                    + "a.postal_address,a.postal_district_code,a.postal_town_code,a.postal_postcode,a.postal_state_code,a.postal_country_code,a.mobile_phone,a.email_address,"
                    + "b.description,c.description,d.description,e.description,f.description,g.description,h.description,i.description,j.description,k.description,l.description,m.description"
+ " from pms_patient_biodata a"
+ " left join adm_lookup_detail b on b.detail_reference_code=a.home_district_code and b.master_reference_code='0078'"
+ " left join adm_lookup_detail c on c.detail_reference_code=a.home_town_code and c.master_reference_code='0003'"
+ " left join adm_lookup_detail d on d.detail_reference_code=a.home_postcode and d.master_reference_code='0079'"
+ " left join adm_lookup_detail e on e.detail_reference_code=a.home_state_code and e.master_reference_code='0002'"
+ " left join adm_lookup_detail f on f.detail_reference_code=a.home_country_code and f.master_reference_code='0001'"
+ " left join adm_lookup_detail g on g.detail_reference_code=a.postal_district_code and g.master_reference_code='0078'"
+ " left join adm_lookup_detail h on h.detail_reference_code=a.postal_town_code and h.master_reference_code='0003'"
+ " left join adm_lookup_detail i on i.detail_reference_code=a.postal_postcode and i.master_reference_code='0079'"
+ " left join adm_lookup_detail j on j.detail_reference_code=a.postal_state_code and j.master_reference_code='0002'"
+ " left join adm_lookup_detail k on k.detail_reference_code=a.postal_country_code and k.master_reference_code='0001'"
+ " left join adm_lookup_detail l on l.detail_reference_code=a.title_code and l.master_reference_code='0026'"
+ " left join adm_lookup_detail m on m.detail_reference_code=a.nationality and m.master_reference_code='0011'"
+ " where a.OLD_IC_NO='" + idInput + "'";
        } else {
            searchPatient = "select a.pmi_no,a.pmi_no_temp,a.patient_name,a.title_code,a.new_ic_no,a.old_ic_no,a.id_type,a.id_no,a.eligibility_category_code,a.eligibility_type_code,"
                    + "a.birth_date,a.sex_code,a.marital_status_code,a.race_code,a.nationality,a.religion_code,a.blood_type,"
                    + "a.blood_rhesus_code,"
                    + "a.allergy_ind,"
                    + "a.chronic_disease_ind,a.organ_donor_ind,a.home_address,a.home_district_code,a.home_town_code,a.home_postcode,a.home_state_code,a.home_country_code,a.home_phone,"
                    + "a.postal_address,a.postal_district_code,a.postal_town_code,a.postal_postcode,a.postal_state_code,a.postal_country_code,a.mobile_phone,a.email_address,"
                    + "b.description,c.description,d.description,e.description,f.description,g.description,h.description,i.description,j.description,k.description,l.description,m.description"
+ " from pms_patient_biodata a"
+ " left join adm_lookup_detail b on b.detail_reference_code=a.home_district_code and b.master_reference_code='0078'"
+ " left join adm_lookup_detail c on c.detail_reference_code=a.home_town_code and c.master_reference_code='0003'"
+ " left join adm_lookup_detail d on d.detail_reference_code=a.home_postcode and d.master_reference_code='0079'"
+ " left join adm_lookup_detail e on e.detail_reference_code=a.home_state_code and e.master_reference_code='0002'"
+ " left join adm_lookup_detail f on f.detail_reference_code=a.home_country_code and f.master_reference_code='0001'"
+ " left join adm_lookup_detail g on g.detail_reference_code=a.postal_district_code and g.master_reference_code='0078'"
+ " left join adm_lookup_detail h on h.detail_reference_code=a.postal_town_code and h.master_reference_code='0003'"
+ " left join adm_lookup_detail i on i.detail_reference_code=a.postal_postcode and i.master_reference_code='0079'"
+ " left join adm_lookup_detail j on j.detail_reference_code=a.postal_state_code and j.master_reference_code='0002'"
+ " left join adm_lookup_detail k on k.detail_reference_code=a.postal_country_code and k.master_reference_code='0001'"
+ " left join adm_lookup_detail l on l.detail_reference_code=a.title_code and l.master_reference_code='0026'"
+ " left join adm_lookup_detail m on m.detail_reference_code=a.nationality and m.master_reference_code='0011'"
+ " where a.ID_NO='" + idInput + "' AND a.ID_TYPE='" + idType + "'";
        }

        ArrayList<ArrayList<String>> search = conn.getData(searchPatient);
        if (search.size() > 0) {
            ArrayList<String> search1 = search.get(0);
            String newVal = StringUtils.join(search1, "|");
%>
<%out.print(newVal);%>
<%
} else if (search.size() == 0 && (idType.equals("004") || idType.equals("005"))) {
    String searchSpecial = "select national_id_no,person_id_no,person_type,name,gender,race,nationality,home_address,home_address_2,postcode,country,phone_no from special_integration_information where person_id_no ='" + idInput + "'";
    ArrayList<ArrayList<String>> search2 = conn.getData(searchSpecial);
    if (search2.size() > 0) {
        ArrayList<String> search3 = search2.get(0);
        String newVal = StringUtils.join(search3, "|");
%>
<%out.print("SMP|" + newVal);%>
<%
} else {
%>
<%out.print("N/A1");%>
<%
    }
} else if (search.size() == 0 && idType.equals("icnew")) {
    String searchSpecial = "select national_id_no,person_id_no,person_type,name,gender,race,nationality,home_address,home_address_2,postcode,country,phone_no from special_integration_information where national_id_no ='" + idInput + "'";
    ArrayList<ArrayList<String>> search2 = conn.getData(searchSpecial);
    if (search2.size() > 0) {
        ArrayList<String> search3 = search2.get(0);
        String newVal = StringUtils.join(search3, "|");
%>
<%out.print("SMP|" + newVal);%>
<%
} else {
%>
<%out.print("N/A1");%>
<%
    }
} else { %>
<%out.print("N/A1");%>
<%
    }

} else if (status.equals("0")) {

    if (idType.equals("pmino")) {
            searchPatient = "select a.pmi_no,a.pmi_no_temp,a.patient_name,a.title_code,a.new_ic_no,a.old_ic_no,a.id_type,a.id_no,a.eligibility_category_code,a.eligibility_type_code,"
                    + "a.birth_date,a.sex_code,a.marital_status_code,a.race_code,a.nationality,a.religion_code,a.blood_type,"
                    + "a.blood_rhesus_code,"
                    + "a.allergy_ind,"
                    + "a.chronic_disease_ind,a.organ_donor_ind,a.home_address,a.home_district_code,a.home_town_code,a.home_postcode,a.home_state_code,a.home_country_code,a.home_phone,"
                    + "a.postal_address,a.postal_district_code,a.postal_town_code,a.postal_postcode,a.postal_state_code,a.postal_country_code,a.mobile_phone,a.email_address,"
                    + "b.description,c.description,d.description,e.description,f.description,g.description,h.description,i.description,j.description,k.description,l.description,m.description"
+ " from pms_patient_biodata a"
+ " left join adm_lookup_detail b on b.detail_reference_code=a.home_district_code and b.master_reference_code='0078'"
+ " left join adm_lookup_detail c on c.detail_reference_code=a.home_town_code and c.master_reference_code='0003'"
+ " left join adm_lookup_detail d on d.detail_reference_code=a.home_postcode and d.master_reference_code='0079'"
+ " left join adm_lookup_detail e on e.detail_reference_code=a.home_state_code and e.master_reference_code='0002'"
+ " left join adm_lookup_detail f on f.detail_reference_code=a.home_country_code and f.master_reference_code='0001'"
+ " left join adm_lookup_detail g on g.detail_reference_code=a.postal_district_code and g.master_reference_code='0078'"
+ " left join adm_lookup_detail h on h.detail_reference_code=a.postal_town_code and h.master_reference_code='0003'"
+ " left join adm_lookup_detail i on i.detail_reference_code=a.postal_postcode and i.master_reference_code='0079'"
+ " left join adm_lookup_detail j on j.detail_reference_code=a.postal_state_code and j.master_reference_code='0002'"
+ " left join adm_lookup_detail k on k.detail_reference_code=a.postal_country_code and k.master_reference_code='0001'"
+ " left join adm_lookup_detail l on l.detail_reference_code=a.title_code and l.master_reference_code='0026'"
+ " left join adm_lookup_detail m on m.detail_reference_code=a.nationality and m.master_reference_code='0011'"
+ " where a.PMI_NO='" + idInput + "'";
        } else if (idType.equals("icnew")) {
            searchPatient = "select a.pmi_no,a.pmi_no_temp,a.patient_name,a.title_code,a.new_ic_no,a.old_ic_no,a.id_type,a.id_no,a.eligibility_category_code,a.eligibility_type_code,"
                    + "a.birth_date,a.sex_code,a.marital_status_code,a.race_code,a.nationality,a.religion_code,a.blood_type,"
                    + "a.blood_rhesus_code,"
                    + "a.allergy_ind,"
                    + "a.chronic_disease_ind,a.organ_donor_ind,a.home_address,a.home_district_code,a.home_town_code,a.home_postcode,a.home_state_code,a.home_country_code,a.home_phone,"
                    + "a.postal_address,a.postal_district_code,a.postal_town_code,a.postal_postcode,a.postal_state_code,a.postal_country_code,a.mobile_phone,a.email_address,"
                    + "b.description,c.description,d.description,e.description,f.description,g.description,h.description,i.description,j.description,k.description,l.description,m.description"
+ " from pms_patient_biodata a"
+ " left join adm_lookup_detail b on b.detail_reference_code=a.home_district_code and b.master_reference_code='0078'"
+ " left join adm_lookup_detail c on c.detail_reference_code=a.home_town_code and c.master_reference_code='0003'"
+ " left join adm_lookup_detail d on d.detail_reference_code=a.home_postcode and d.master_reference_code='0079'"
+ " left join adm_lookup_detail e on e.detail_reference_code=a.home_state_code and e.master_reference_code='0002'"
+ " left join adm_lookup_detail f on f.detail_reference_code=a.home_country_code and f.master_reference_code='0001'"
+ " left join adm_lookup_detail g on g.detail_reference_code=a.postal_district_code and g.master_reference_code='0078'"
+ " left join adm_lookup_detail h on h.detail_reference_code=a.postal_town_code and h.master_reference_code='0003'"
+ " left join adm_lookup_detail i on i.detail_reference_code=a.postal_postcode and i.master_reference_code='0079'"
+ " left join adm_lookup_detail j on j.detail_reference_code=a.postal_state_code and j.master_reference_code='0002'"
+ " left join adm_lookup_detail k on k.detail_reference_code=a.postal_country_code and k.master_reference_code='0001'"
+ " left join adm_lookup_detail l on l.detail_reference_code=a.title_code and l.master_reference_code='0026'"
+ " left join adm_lookup_detail m on m.detail_reference_code=a.nationality and m.master_reference_code='0011'"
+ " where a.NEW_IC_NO='" + idInput + "'";
            
        } else if (idType.equals("icold")) {
            searchPatient = "select a.pmi_no,a.pmi_no_temp,a.patient_name,a.title_code,a.new_ic_no,a.old_ic_no,a.id_type,a.id_no,a.eligibility_category_code,a.eligibility_type_code,"
                    + "a.birth_date,a.sex_code,a.marital_status_code,a.race_code,a.nationality,a.religion_code,a.blood_type,"
                    + "a.blood_rhesus_code,"
                    + "a.allergy_ind,"
                    + "a.chronic_disease_ind,a.organ_donor_ind,a.home_address,a.home_district_code,a.home_town_code,a.home_postcode,a.home_state_code,a.home_country_code,a.home_phone,"
                    + "a.postal_address,a.postal_district_code,a.postal_town_code,a.postal_postcode,a.postal_state_code,a.postal_country_code,a.mobile_phone,a.email_address,"
                    + "b.description,c.description,d.description,e.description,f.description,g.description,h.description,i.description,j.description,k.description,l.description,m.description"
+ " from pms_patient_biodata a"
+ " left join adm_lookup_detail b on b.detail_reference_code=a.home_district_code and b.master_reference_code='0078'"
+ " left join adm_lookup_detail c on c.detail_reference_code=a.home_town_code and c.master_reference_code='0003'"
+ " left join adm_lookup_detail d on d.detail_reference_code=a.home_postcode and d.master_reference_code='0079'"
+ " left join adm_lookup_detail e on e.detail_reference_code=a.home_state_code and e.master_reference_code='0002'"
+ " left join adm_lookup_detail f on f.detail_reference_code=a.home_country_code and f.master_reference_code='0001'"
+ " left join adm_lookup_detail g on g.detail_reference_code=a.postal_district_code and g.master_reference_code='0078'"
+ " left join adm_lookup_detail h on h.detail_reference_code=a.postal_town_code and h.master_reference_code='0003'"
+ " left join adm_lookup_detail i on i.detail_reference_code=a.postal_postcode and i.master_reference_code='0079'"
+ " left join adm_lookup_detail j on j.detail_reference_code=a.postal_state_code and j.master_reference_code='0002'"
+ " left join adm_lookup_detail k on k.detail_reference_code=a.postal_country_code and k.master_reference_code='0001'"
+ " left join adm_lookup_detail l on l.detail_reference_code=a.title_code and l.master_reference_code='0026'"
+ " left join adm_lookup_detail m on m.detail_reference_code=a.nationality and m.master_reference_code='0011'"
+ " where a.OLD_IC_NO='" + idInput + "'";
        } else {
            searchPatient = "select a.pmi_no,a.pmi_no_temp,a.patient_name,a.title_code,a.new_ic_no,a.old_ic_no,a.id_type,a.id_no,a.eligibility_category_code,a.eligibility_type_code,"
                    + "a.birth_date,a.sex_code,a.marital_status_code,a.race_code,a.nationality,a.religion_code,a.blood_type,"
                    + "a.blood_rhesus_code,"
                    + "a.allergy_ind,"
                    + "a.chronic_disease_ind,a.organ_donor_ind,a.home_address,a.home_district_code,a.home_town_code,a.home_postcode,a.home_state_code,a.home_country_code,a.home_phone,"
                    + "a.postal_address,a.postal_district_code,a.postal_town_code,a.postal_postcode,a.postal_state_code,a.postal_country_code,a.mobile_phone,a.email_address,"
                    + "b.description,c.description,d.description,e.description,f.description,g.description,h.description,i.description,j.description,k.description,l.description,m.description"
+ " from pms_patient_biodata a"
+ " left join adm_lookup_detail b on b.detail_reference_code=a.home_district_code and b.master_reference_code='0078'"
+ " left join adm_lookup_detail c on c.detail_reference_code=a.home_town_code and c.master_reference_code='0003'"
+ " left join adm_lookup_detail d on d.detail_reference_code=a.home_postcode and d.master_reference_code='0079'"
+ " left join adm_lookup_detail e on e.detail_reference_code=a.home_state_code and e.master_reference_code='0002'"
+ " left join adm_lookup_detail f on f.detail_reference_code=a.home_country_code and f.master_reference_code='0001'"
+ " left join adm_lookup_detail g on g.detail_reference_code=a.postal_district_code and g.master_reference_code='0078'"
+ " left join adm_lookup_detail h on h.detail_reference_code=a.postal_town_code and h.master_reference_code='0003'"
+ " left join adm_lookup_detail i on i.detail_reference_code=a.postal_postcode and i.master_reference_code='0079'"
+ " left join adm_lookup_detail j on j.detail_reference_code=a.postal_state_code and j.master_reference_code='0002'"
+ " left join adm_lookup_detail k on k.detail_reference_code=a.postal_country_code and k.master_reference_code='0001'"
+ " left join adm_lookup_detail l on l.detail_reference_code=a.title_code and l.master_reference_code='0026'"
+ " left join adm_lookup_detail m on m.detail_reference_code=a.nationality and m.master_reference_code='0011'"
+ " where a.ID_NO='" + idInput + "' AND a.ID_TYPE='" + idType + "'";
        }

    ArrayList<ArrayList<String>> search = conn.getData(searchPatient);
    if (search.size() > 0) {
        ArrayList<String> search1 = search.get(0);

        String newVal = StringUtils.join(search1, "|");
%>
<%out.print(newVal);%>
<%
} else { %>
<%out.print("N/A0");%>
<%
        }

    }

%>   