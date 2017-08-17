<%-- 
    Document   : ResultAddActiveDrugOutPatient
    Created on : Aug 14, 2017, 6:27:29 PM
    Author     : shay
--%>
<%@page import="main.RMIConnector"%>
<%@page import="dBConn.Conn"%>
<%@page import="java.util.ArrayList"%>
<%
    String pmi, disicpline, subdiscpiline, episodedate, hfc, doctor, drugcode;
    pmi = request.getParameter("pmino");
    episodedate = request.getParameter("episodedate");
    disicpline = request.getParameter("discipline");
    subdiscpiline = request.getParameter("subdiscipline");
    hfc = request.getParameter("hfc");
    doctor = request.getParameter("doctor");
    drugcode = request.getParameter("drugcode");

    String sql = "select pmi_no,hfc_cd,episode_date,encounter_date,discipline_cd,subdiscipline_cd,onset_date,drug_cd,created_by,created_date from lhr_active_medication where pmi_no ='" + pmi + "' and drug_cd = '" + drugcode + "';";
    Conn conn = new Conn();
    RMIConnector rmic = new RMIConnector();
    ArrayList<ArrayList<String>> searchActiveDrug;
    searchActiveDrug = conn.getData(sql);
    if (searchActiveDrug.size() > 0) {
        out.print("already");
    } else {
        String insertactiv = "INSERT INTO lhr_active_medication(pmi_no,hfc_cd,episode_date,encounter_date,discipline_cd,subdiscipline_cd,onset_date,drug_cd,problem_cd,drug_name,product_name,drug_form"
                + ",drug_form_desc,drug_route_code,drug_route_desc,drug_freq_code,drug_freq_desc,drug_freq_unit,drug_dosage,drug_strength,drug_oum,duration,quantity,start_date,end_date,doctor_id,doctor_name"
                + ",national_id_no,person_id_no,person_status,centre_code,created_by,created_date)select pmi_no,hfc_cd,episode_date,encounter_date,discipline_cd,subdiscipline_cd,now(),drug_cd,problem_cd,drug_name,product_name,drug_form,drug_form_desc,drug_route_code,drug_route_desc,drug_freq_code,drug_freq_desc,drug_freq_unit,drug_dosage,drug_strength,drug_uom,duration,quantity,start_date,end_date,doctor_id,doctor_name,national_id_no,person_id_no,person_status,centre_code,'"+doctor+"',now() from lhr_medication where pmi_no ='" + pmi + "' and drug_cd = '" + drugcode + "' and episode_date ='"+episodedate+"';";
        Boolean insertS = rmic.setQuerySQL(conn.HOST, conn.PORT, insertactiv);
        if(insertS){
            out.print("success");
        }else{
            out.print("fail");
//            out.print(insertactiv);
        }
    }
%>