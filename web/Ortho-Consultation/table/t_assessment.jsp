
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%
    if (session.getAttribute("patientPMINo") == null || session.getAttribute("patientPMINo").equals(" ")) {
        out.print("<br>No data recorded.");
    } else {
        try {

            String time_history = request.getParameter("time_history");
            String hfc = session.getAttribute("HEALTH_FACILITY_CODE").toString();
            String pmino = session.getAttribute("patientPMINo").toString();
            String episodeDate = session.getAttribute("episodeDate").toString();

            SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd");//dd/MM/yyyy
            Date now = new Date();
            String dateTime = sdfDate.format(now);

            String sql = "";
            if (time_history == null) {
                sql = "SELECT a.hip_slrt_1,a.hip_slrt_2,a.hip_extension_1,a.hip_extension_2,a.hip_flexion_1,a.hip_flexion_2,a.hip_abduction_1,a.hip_abduction_2,a.knee_extension_1,a.knee_extension_2,a.knee_flexion_1,a.knee_flexion_2,a.ankle_dorsiflex_1,a.ankle_dorsiflex_2,a.ankle_pantarflex_1,a.ankle_pantarflex_2,a.ankle_eversion_1,a.ankle_eversion_2,a.ankle_inversion_1,a.ankle_inversion_2,a.toes_dorsiflex_1,a.toes_dorsiflex_2,a.toes_plantarflex_1,a.toes_plantarflex_2,a.`sensory_L1_1`,a.`sensory_L1_2`,a.sensory_l2_1,a.sensory_l2_2,a.sensory_l3_1,a.sensory_l3_2,a.sensory_l4_1,a.sensory_l4_2,a.sensory_l5_1,a.sensory_l5_2,a.sensory_s1_1,a.sensory_s1_2,a.sensory_s2_1,a.sensory_s2_2,a.sensory_sacral_1,a.sensory_sacral_2,a.sensory_abdominal_1,a.sensory_abdominal_2,a.sensory_crematenic_1,a.sensory_crematenic_2,a.sensory_anal_1,a.sensory_anal_2,a.sensory_bo_1,a.sensory_bo_2,a.encounter_date FROM lhr_ort_neu_assessment_chart a  WHERE a.pmi_no='" + pmino + "' AND a.hfc_cd='" + hfc + "' AND DATE(a.encounter_date) = CURDATE()";
            } else if (time_history.equals("Viewby")) {
                sql = "SELECT a.hip_slrt_1,a.hip_slrt_2,a.hip_extension_1,a.hip_extension_2,a.hip_flexion_1,a.hip_flexion_2,a.hip_abduction_1,a.hip_abduction_2,a.knee_extension_1,a.knee_extension_2,a.knee_flexion_1,a.knee_flexion_2,a.ankle_dorsiflex_1,a.ankle_dorsiflex_2,a.ankle_pantarflex_1,a.ankle_pantarflex_2,a.ankle_eversion_1,a.ankle_eversion_2,a.ankle_inversion_1,a.ankle_inversion_2,a.toes_dorsiflex_1,a.toes_dorsiflex_2,a.toes_plantarflex_1,a.toes_plantarflex_2,a.`sensory_L1_1`,a.`sensory_L1_2`,a.sensory_l2_1,a.sensory_l2_2,a.sensory_l3_1,a.sensory_l3_2,a.sensory_l4_1,a.sensory_l4_2,a.sensory_l5_1,a.sensory_l5_2,a.sensory_s1_1,a.sensory_s1_2,a.sensory_s2_1,a.sensory_s2_2,a.sensory_sacral_1,a.sensory_sacral_2,a.sensory_abdominal_1,a.sensory_abdominal_2,a.sensory_crematenic_1,a.sensory_crematenic_2,a.sensory_anal_1,a.sensory_anal_2,a.sensory_bo_1,a.sensory_bo_2,a.encounter_date FROM lhr_ort_neu_assessment_chart a  WHERE a.pmi_no='" + pmino + "' AND a.hfc_cd='" + hfc + "' AND DATE(a.encounter_date) = CURDATE()";
            } else if (time_history.equals("Today")) {
                sql = "SELECT a.hip_slrt_1,a.hip_slrt_2,a.hip_extension_1,a.hip_extension_2,a.hip_flexion_1,a.hip_flexion_2,a.hip_abduction_1,a.hip_abduction_2,a.knee_extension_1,a.knee_extension_2,a.knee_flexion_1,a.knee_flexion_2,a.ankle_dorsiflex_1,a.ankle_dorsiflex_2,a.ankle_pantarflex_1,a.ankle_pantarflex_2,a.ankle_eversion_1,a.ankle_eversion_2,a.ankle_inversion_1,a.ankle_inversion_2,a.toes_dorsiflex_1,a.toes_dorsiflex_2,a.toes_plantarflex_1,a.toes_plantarflex_2,a.`sensory_L1_1`,a.`sensory_L1_2`,a.sensory_l2_1,a.sensory_l2_2,a.sensory_l3_1,a.sensory_l3_2,a.sensory_l4_1,a.sensory_l4_2,a.sensory_l5_1,a.sensory_l5_2,a.sensory_s1_1,a.sensory_s1_2,a.sensory_s2_1,a.sensory_s2_2,a.sensory_sacral_1,a.sensory_sacral_2,a.sensory_abdominal_1,a.sensory_abdominal_2,a.sensory_crematenic_1,a.sensory_crematenic_2,a.sensory_anal_1,a.sensory_anal_2,a.sensory_bo_1,a.sensory_bo_2,a.encounter_date FROM lhr_ort_neu_assessment_chart a  WHERE a.pmi_no='" + pmino + "' AND a.hfc_cd='" + hfc + "' AND DATE(a.encounter_date) = CURDATE()";
            } else if (time_history.equals("Yesterday")) {
                sql = "SELECT a.hip_slrt_1,a.hip_slrt_2,a.hip_extension_1,a.hip_extension_2,a.hip_flexion_1,a.hip_flexion_2,a.hip_abduction_1,a.hip_abduction_2,a.knee_extension_1,a.knee_extension_2,a.knee_flexion_1,a.knee_flexion_2,a.ankle_dorsiflex_1,a.ankle_dorsiflex_2,a.ankle_pantarflex_1,a.ankle_pantarflex_2,a.ankle_eversion_1,a.ankle_eversion_2,a.ankle_inversion_1,a.ankle_inversion_2,a.toes_dorsiflex_1,a.toes_dorsiflex_2,a.toes_plantarflex_1,a.toes_plantarflex_2,a.`sensory_L1_1`,a.`sensory_L1_2`,a.sensory_l2_1,a.sensory_l2_2,a.sensory_l3_1,a.sensory_l3_2,a.sensory_l4_1,a.sensory_l4_2,a.sensory_l5_1,a.sensory_l5_2,a.sensory_s1_1,a.sensory_s1_2,a.sensory_s2_1,a.sensory_s2_2,a.sensory_sacral_1,a.sensory_sacral_2,a.sensory_abdominal_1,a.sensory_abdominal_2,a.sensory_crematenic_1,a.sensory_crematenic_2,a.sensory_anal_1,a.sensory_anal_2,a.sensory_bo_1,a.sensory_bo_2,a.encounter_date FROM lhr_ort_neu_assessment_chart a  WHERE a.pmi_no='" + pmino + "' AND a.hfc_cd='" + hfc + "' AND DATE(a.encounter_date) = SUBDATE('" + dateTime + "',1);";
            } else if (time_history.equals("7 Days")) {
                sql = "SELECT a.hip_slrt_1,a.hip_slrt_2,a.hip_extension_1,a.hip_extension_2,a.hip_flexion_1,a.hip_flexion_2,a.hip_abduction_1,a.hip_abduction_2,a.knee_extension_1,a.knee_extension_2,a.knee_flexion_1,a.knee_flexion_2,a.ankle_dorsiflex_1,a.ankle_dorsiflex_2,a.ankle_pantarflex_1,a.ankle_pantarflex_2,a.ankle_eversion_1,a.ankle_eversion_2,a.ankle_inversion_1,a.ankle_inversion_2,a.toes_dorsiflex_1,a.toes_dorsiflex_2,a.toes_plantarflex_1,a.toes_plantarflex_2,a.`sensory_L1_1`,a.`sensory_L1_2`,a.sensory_l2_1,a.sensory_l2_2,a.sensory_l3_1,a.sensory_l3_2,a.sensory_l4_1,a.sensory_l4_2,a.sensory_l5_1,a.sensory_l5_2,a.sensory_s1_1,a.sensory_s1_2,a.sensory_s2_1,a.sensory_s2_2,a.sensory_sacral_1,a.sensory_sacral_2,a.sensory_abdominal_1,a.sensory_abdominal_2,a.sensory_crematenic_1,a.sensory_crematenic_2,a.sensory_anal_1,a.sensory_anal_2,a.sensory_bo_1,a.sensory_bo_2,a.encounter_date FROM lhr_ort_neu_assessment_chart a  WHERE a.pmi_no='" + pmino + "' AND a.hfc_cd='" + hfc + "' AND DATE(a.encounter_date) between SUBDATE('" + dateTime + "',7) and '" + dateTime + "' ;";
            } else if (time_history.equals("30 Days")) {
                sql = "SELECT a.hip_slrt_1,a.hip_slrt_2,a.hip_extension_1,a.hip_extension_2,a.hip_flexion_1,a.hip_flexion_2,a.hip_abduction_1,a.hip_abduction_2,a.knee_extension_1,a.knee_extension_2,a.knee_flexion_1,a.knee_flexion_2,a.ankle_dorsiflex_1,a.ankle_dorsiflex_2,a.ankle_pantarflex_1,a.ankle_pantarflex_2,a.ankle_eversion_1,a.ankle_eversion_2,a.ankle_inversion_1,a.ankle_inversion_2,a.toes_dorsiflex_1,a.toes_dorsiflex_2,a.toes_plantarflex_1,a.toes_plantarflex_2,a.`sensory_L1_1`,a.`sensory_L1_2`,a.sensory_l2_1,a.sensory_l2_2,a.sensory_l3_1,a.sensory_l3_2,a.sensory_l4_1,a.sensory_l4_2,a.sensory_l5_1,a.sensory_l5_2,a.sensory_s1_1,a.sensory_s1_2,a.sensory_s2_1,a.sensory_s2_2,a.sensory_sacral_1,a.sensory_sacral_2,a.sensory_abdominal_1,a.sensory_abdominal_2,a.sensory_crematenic_1,a.sensory_crematenic_2,a.sensory_anal_1,a.sensory_anal_2,a.sensory_bo_1,a.sensory_bo_2,a.encounter_date FROM lhr_ort_neu_assessment_chart a  WHERE a.pmi_no='" + pmino + "' AND a.hfc_cd='" + hfc + "' AND DATE(a.encounter_date) between SUBDATE('" + dateTime + "',30) and '" + dateTime + "' ;";
            } else if (time_history.equals("60 Days")) {
                sql = "SELECT a.hip_slrt_1,a.hip_slrt_2,a.hip_extension_1,a.hip_extension_2,a.hip_flexion_1,a.hip_flexion_2,a.hip_abduction_1,a.hip_abduction_2,a.knee_extension_1,a.knee_extension_2,a.knee_flexion_1,a.knee_flexion_2,a.ankle_dorsiflex_1,a.ankle_dorsiflex_2,a.ankle_pantarflex_1,a.ankle_pantarflex_2,a.ankle_eversion_1,a.ankle_eversion_2,a.ankle_inversion_1,a.ankle_inversion_2,a.toes_dorsiflex_1,a.toes_dorsiflex_2,a.toes_plantarflex_1,a.toes_plantarflex_2,a.`sensory_L1_1`,a.`sensory_L1_2`,a.sensory_l2_1,a.sensory_l2_2,a.sensory_l3_1,a.sensory_l3_2,a.sensory_l4_1,a.sensory_l4_2,a.sensory_l5_1,a.sensory_l5_2,a.sensory_s1_1,a.sensory_s1_2,a.sensory_s2_1,a.sensory_s2_2,a.sensory_sacral_1,a.sensory_sacral_2,a.sensory_abdominal_1,a.sensory_abdominal_2,a.sensory_crematenic_1,a.sensory_crematenic_2,a.sensory_anal_1,a.sensory_anal_2,a.sensory_bo_1,a.sensory_bo_2,a.encounter_date FROM lhr_ort_neu_assessment_chart a  WHERE a.pmi_no='" + pmino + "' AND a.hfc_cd='" + hfc + "' AND DATE(a.encounter_date) between SUBDATE('" + dateTime + "',90) and '" + dateTime + "' ;";
            } else if (time_history.equals("Select_date")) {
                String startDate = request.getParameter("startDate");
                String toDate = request.getParameter("toDate");
                sql = "SELECT a.hip_slrt_1,a.hip_slrt_2,a.hip_extension_1,a.hip_extension_2,a.hip_flexion_1,a.hip_flexion_2,a.hip_abduction_1,a.hip_abduction_2,a.knee_extension_1,a.knee_extension_2,a.knee_flexion_1,a.knee_flexion_2,a.ankle_dorsiflex_1,a.ankle_dorsiflex_2,a.ankle_pantarflex_1,a.ankle_pantarflex_2,a.ankle_eversion_1,a.ankle_eversion_2,a.ankle_inversion_1,a.ankle_inversion_2,a.toes_dorsiflex_1,a.toes_dorsiflex_2,a.toes_plantarflex_1,a.toes_plantarflex_2,a.`sensory_L1_1`,a.`sensory_L1_2`,a.sensory_l2_1,a.sensory_l2_2,a.sensory_l3_1,a.sensory_l3_2,a.sensory_l4_1,a.sensory_l4_2,a.sensory_l5_1,a.sensory_l5_2,a.sensory_s1_1,a.sensory_s1_2,a.sensory_s2_1,a.sensory_s2_2,a.sensory_sacral_1,a.sensory_sacral_2,a.sensory_abdominal_1,a.sensory_abdominal_2,a.sensory_crematenic_1,a.sensory_crematenic_2,a.sensory_anal_1,a.sensory_anal_2,a.sensory_bo_1,a.sensory_bo_2,a.encounter_date FROM lhr_ort_neu_assessment_chart a  WHERE a.pmi_no='" + pmino + "' AND a.hfc_cd='" + hfc + "' AND DATE(a.encounter_date) BETWEEN '" + startDate + "' AND '" + toDate + "'";
            }
            //out.print(hfc + " ----- " + pmino + " ----- " + episodeDate + " ------ " + user_id);
            Conn conn = new Conn();

            ArrayList<ArrayList<String>> q1 = conn.getData(sql);
            DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            DateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy");
            DateFormat outputFormat1 = new SimpleDateFormat("KK:mm a");
            if (q1.size() > 0) {
                for (int i = 0; i < q1.size(); i++) {
                    String dateTime_i = q1.get(i).get(48);
                    //out.print(i + 1 + "  " + q1.get(i).get(48));
%>
<div class="panel panel-default">
    <div class="panel-heading">

        <div class="radio radio-primary" style="display: inline;">
               <input type="radio" name="selected_assessment" value="<%=q1.get(i).get(48)%>" <%
                if (i == 0) {%> checked="checked"<%}%> id="neu-0<%=i + 1%>">
            <label for="neu-0<%=i + 1%>">
                &nbsp;
            </label>
        </div>



        <span class="tarikh-neu">Date:<%=outputFormat.format(inputFormat.parse(dateTime_i))%> Time:<%=outputFormat1.format(inputFormat.parse(dateTime_i))%></span>

        <a href="#" class="deleteBtn pull-right" id="delete_Assessment_<%=i%>"><i class="fa fa-times fa-lg" aria-hidden="true" style="display: inline-block; color: #d9534f;"></i></a>
        <script>
            $("#delete_Assessment_<%=i%>").click(function () {

                //alert("Are you sure to delete the data?");
                var dateTime = "<%=q1.get(i).get(48)%>";
                var r = confirm("Are you sure to delete the data?");
                if (r == true) {
                    $.ajax({
                        url: "../Ortho-Consultation/modal/action/delete_assessment.jsp",
                        type: "post",
                        data: {dateTime: dateTime
                        },
                        timeout: 10000,
                        success: function () {
                            bootbox.alert("Observation record is deleted.");
                            $("#getNeuAssessment").load("../Ortho-Consultation/neuAssessment.jsp");
                        },
                        error: function (err) {
                            bootbox.alert("Error update!");
                        }
                    });
                } else {
                    //txt = "You pressed Cancel!";
                }
            });
        </script>
    </div>
    <div class="nota" id="table_assessment" style="overflow-x: auto;">
        <table class="table table-bordered" id="table_assessment">
            <tr>
                <th colspan="24">Muscle Power</th>
            </tr>
            <tr>
                <th colspan="8">Hip</th>
                <th colspan="4">Knee</th>
                <th colspan="8">Ankle</th>
                <th colspan="4">Toes</th>
            </tr>
            <tr>
                <td colspan="2">SLRT</td>
                <td colspan="2">Extension</td>
                <td colspan="2">Flexion</td>
                <td colspan="2">Abduction</td>
                <td colspan="2">Extension</td>
                <td colspan="2">Flexion</td>
                <td colspan="2">Dorsiflex</td>
                <td colspan="2">Plantarflex</td>
                <td colspan="2">Eversion</td>
                <td colspan="2">Inversion</td>
                <td colspan="2">Dorsiflex</td>
                <td colspan="2">Plantaflex</td>
            </tr>
            <tr>
                <td><%if (q1.get(i).get(0) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(0));
                    }%></td>
                <td><%if (q1.get(i).get(1) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(1));
                    }%></td>
                <td><%if (q1.get(i).get(2) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(2));
                    }%></td>
                <td><%if (q1.get(i).get(3) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(3));
                    }%></td>
                <td><%if (q1.get(i).get(4) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(4));
                    }%></td>
                <td><%if (q1.get(i).get(5) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(5));
                    }%></td>
                <td><%if (q1.get(i).get(6) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(6));
                    }%></td>
                <td><%if (q1.get(i).get(7) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(7));
                    }%></td>
                <td><%if (q1.get(i).get(8) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(8));
                    }%></td>
                <td><%if (q1.get(i).get(9) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(9));
                    }%></td>
                <td><%if (q1.get(i).get(10) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(10));
                    }%></td>
                <td><%if (q1.get(i).get(11) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(11));
                    }%></td>
                <td><%if (q1.get(i).get(12) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(12));
                    }%></td>
                <td><%if (q1.get(i).get(13) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(13));
                    }%></td>
                <td><%if (q1.get(i).get(14) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(14));
                    }%></td>
                <td><%if (q1.get(i).get(15) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(15));
                    }%></td>
                <td><%if (q1.get(i).get(16) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(16));
                    }%></td>
                <td><%if (q1.get(i).get(17) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(17));
                    }%></td>
                <td><%if (q1.get(i).get(18) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(18));
                    }%></td>
                <td><%if (q1.get(i).get(19) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(19));
                    }%></td>
                <td><%if (q1.get(i).get(20) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(20));
                    }%></td>
                <td><%if (q1.get(i).get(21) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(21));
                    }%></td>
                <td><%if (q1.get(i).get(22) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(22));
                    }%></td>
                <td><%if (q1.get(i).get(23) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(23));
                    }%></td>
            </tr>
            <tr>
                <th colspan="24">Sensory</th>
            </tr>
            <tr>
                <td colspan="2">L1</td>
                <td colspan="2">L2</td>
                <td colspan="2">L3</td>
                <td colspan="2">L4</td>
                <td colspan="2">L5</td>
                <td colspan="2">S1</td>
                <td colspan="2">S2</td>
                <td colspan="2">Sacral</td>
                <td colspan="2">Abdominal</td>
                <td colspan="2">Crematenic</td>
                <td colspan="2">Anal</td>
                <td colspan="2">BO</td>
            </tr>
            <tr>
                <td><%if (q1.get(i).get(24) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(24));
                    }%></td>
                <td><%if (q1.get(i).get(25) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(25));
                    }%></td>
                <td><%if (q1.get(i).get(26) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(26));
                    }%></td>
                <td><%if (q1.get(i).get(27) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(27));
                    }%></td>
                <td><%if (q1.get(i).get(28) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(28));
                    }%></td>
                <td><%if (q1.get(i).get(29) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(29));
                    }%></td>
                <td><%if (q1.get(i).get(30) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(30));
                    }%></td>
                <td><%if (q1.get(i).get(31) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(31));
                    }%></td>
                <td><%if (q1.get(i).get(32) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(32));
                    }%></td>
                <td><%if (q1.get(i).get(33) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(33));
                    }%></td>
                <td><%if (q1.get(i).get(34) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(34));
                    }%></td>
                <td><%if (q1.get(i).get(35) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(35));
                    }%></td>
                <td><%if (q1.get(i).get(36) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(36));
                    }%></td>
                <td><%if (q1.get(i).get(37) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(37));
                    }%></td>
                <td><%if (q1.get(i).get(38) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(38));
                    }%></td>
                <td><%if (q1.get(i).get(39) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(39));
                    }%></td>
                <td><%if (q1.get(i).get(40) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(40));
                    }%></td>
                <td><%if (q1.get(i).get(41) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(41));
                    }%></td>
                <td><%if (q1.get(i).get(42) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(42));
                    }%></td>
                <td><%if (q1.get(i).get(43) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(43));
                    }%></td>
                <td><%if (q1.get(i).get(44) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(44));
                    }%></td>
                <td><%if (q1.get(i).get(45) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(45));
                    }%></td>
                <td><%if (q1.get(i).get(46) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(46));
                    }%></td>
                <td><%if (q1.get(i).get(47) == null) {
                        out.print("");
                    } else {
                        out.print(q1.get(i).get(47));
                    }%></td>
            </tr>
        </table>
    </div>
</div>
<%             }
            } else {
                out.print("<br>No data recorded.");
            }
        } catch (Exception e) {
        }

    }
%>
