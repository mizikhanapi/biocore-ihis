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

    String status = session.getAttribute("SYSTEMSTAT").toString();
    String searchPatient = "";

    if (status.equals("1")) {

        if (idType.equals("pmino") || idType.equals("001")) {
            searchPatient = "select ward_class_code, bed_id, PATIENT_NAME, ID_NO, pmi_no, ward_id, eligibility_category_cd,DEPOSIT_INPATIENT ,"
                    + " from wis_inpatient_episode "
                    + " where pmi_no='" + idInput + "'";
        } else if (idType.equals("icnew") || idType.equals("002")) {
            searchPatient = "select ward_class_code, bed_id, PATIENT_NAME, ID_NO, pmi_no, ward_id, eligibility_category_cd,DEPOSIT_INPATIENT ,"
                    + " from wis_inpatient_episode"
                    + " where a.NEW_IC_NO='" + idInput + "'";

        } else if (idType.equals("icold") || idType.equals("003")) {
            searchPatient = "select select ward_class_code, bed_id, PATIENT_NAME, ID_NO, pmi_no, ward_id, eligibility_category_cd,DEPOSIT_INPATIENT ,"
                    + " from wis_inpatient_episode"
                    + " where a.OLD_IC_NO='" + idInput + "'";
        } else {
            searchPatient = "selectselect select ward_class_code, bed_id, PATIENT_NAME, ID_NO, pmi_no, ward_id, eligibility_category_cd,DEPOSIT_INPATIENT ,"
                    + " from wis_inpatient_episode"
                    + " where a.ID_NO='" + idInput + "' AND a.ID_TYPE='" + idType + "'";
        }

        ArrayList<ArrayList<String>> search = conn.getData(searchPatient);
        if (search.size() > 0) {
            ArrayList<String> search1 = search.get(0);
            String newVal = StringUtils.join(search1, "|");
%>

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
} else if (search.size() == 0 && (idType.equals("icnew") || idType.equals("002"))) {
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

} 

%>   